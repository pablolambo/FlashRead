import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:xml/xml.dart';

/// Thrown when a file is not a readable EPUB.
class EpubFormatException implements Exception {
  final String message;

  const EpubFormatException(this.message);

  @override
  String toString() => 'EpubFormatException: $message';
}

/// The descriptive data an EPUB carries about itself.
class EpubMetadata {
  final String title;
  final String? author;

  /// Language tag as written in the book, for example `en` or `pt-BR`.
  final String? language;

  const EpubMetadata({required this.title, this.author, this.language});
}

const _containerPath = 'META-INF/container.xml';

/// Reads the title, author and language from the bytes of an EPUB file.
///
/// An EPUB is a ZIP archive. `META-INF/container.xml` points at the package
/// document (the `.opf` file), whose `<metadata>` element holds these fields.
EpubMetadata readEpubMetadata(Uint8List bytes) {
  final Archive archive;
  try {
    archive = ZipDecoder().decodeBytes(bytes);
  } catch (_) {
    throw const EpubFormatException('The file is not a ZIP archive.');
  }

  final container = _readXml(archive, _containerPath);
  final packagePath = _elements(container, 'rootfile')
      .map((rootfile) => rootfile.getAttribute('full-path'))
      .whereType<String>()
      .firstOrNull;
  if (packagePath == null) {
    throw const EpubFormatException(
        '$_containerPath does not name a package document.');
  }

  final metadata =
      _elements(_readXml(archive, packagePath), 'metadata').firstOrNull;
  if (metadata == null) {
    throw EpubFormatException('$packagePath has no <metadata> element.');
  }

  final title = _text(metadata, 'title');
  if (title == null) {
    throw EpubFormatException('$packagePath has no title.');
  }

  return EpubMetadata(
    title: title,
    author: _text(metadata, 'creator'),
    language: _text(metadata, 'language'),
  );
}

XmlDocument _readXml(Archive archive, String path) {
  final file = archive.findFile(path);
  if (file == null) {
    throw EpubFormatException('$path is missing from the archive.');
  }
  try {
    return XmlDocument.parse(utf8.decode(file.content));
  } on FormatException {
    throw EpubFormatException('$path is not valid XML.');
  }
}

/// Finds elements by local name, so `dc:title` matches whatever prefix the
/// book happens to use for the Dublin Core namespace.
Iterable<XmlElement> _elements(XmlNode node, String localName) =>
    node.descendantElements.where((element) => element.name.local == localName);

String? _text(XmlElement metadata, String localName) =>
    _elements(metadata, localName)
        .map((element) => element.innerText.trim())
        .where((text) => text.isNotEmpty)
        .firstOrNull;
