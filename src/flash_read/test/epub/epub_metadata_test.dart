import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:flash_read/epub/epub_metadata.dart';
import 'package:flutter_test/flutter_test.dart';

const _container = '''
<?xml version="1.0"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
  <rootfiles>
    <rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/>
  </rootfiles>
</container>''';

String _package(String metadata) => '''
<?xml version="1.0"?>
<package xmlns="http://www.idpf.org/2007/opf" version="3.0">
  <metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
    $metadata
  </metadata>
</package>''';

/// Builds an EPUB in memory, so the tests need no binary fixture files.
Uint8List _epub(Map<String, String> files) {
  final archive = Archive();
  files.forEach((path, content) {
    archive.addFile(ArchiveFile.string(path, content));
  });
  return Uint8List.fromList(ZipEncoder().encode(archive));
}

void main() {
  test('reads title, author and language', () {
    final metadata = readEpubMetadata(_epub({
      'META-INF/container.xml': _container,
      'OEBPS/content.opf': _package('''
        <dc:title>Pan Tadeusz</dc:title>
        <dc:creator>Adam Mickiewicz</dc:creator>
        <dc:language>pl</dc:language>'''),
    }));

    expect(metadata.title, 'Pan Tadeusz');
    expect(metadata.author, 'Adam Mickiewicz');
    expect(metadata.language, 'pl');
  });

  test('leaves author and language null when the book omits them', () {
    final metadata = readEpubMetadata(_epub({
      'META-INF/container.xml': _container,
      'OEBPS/content.opf': _package('<dc:title>  Untitled draft </dc:title>'),
    }));

    expect(metadata.title, 'Untitled draft');
    expect(metadata.author, isNull);
    expect(metadata.language, isNull);
  });

  test('rejects a file that is not a ZIP archive', () {
    expect(
      () => readEpubMetadata(Uint8List.fromList([1, 2, 3, 4])),
      throwsA(isA<EpubFormatException>()),
    );
  });

  test('rejects an archive without container.xml', () {
    expect(
      () => readEpubMetadata(_epub({'mimetype': 'application/epub+zip'})),
      throwsA(isA<EpubFormatException>()),
    );
  });

  test('rejects a package document without a title', () {
    expect(
      () => readEpubMetadata(_epub({
        'META-INF/container.xml': _container,
        'OEBPS/content.opf': _package('<dc:creator>Anonymous</dc:creator>'),
      })),
      throwsA(isA<EpubFormatException>()),
    );
  });

  test('rejects a package document that is not XML', () {
    expect(
      () => readEpubMetadata(_epub({
        'META-INF/container.xml': _container,
        'OEBPS/content.opf': 'not xml <',
      })),
      throwsA(isA<EpubFormatException>()),
    );
  });
}
