import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flash_read/main.dart';

void main() {
  testWidgets('starts on the empty flashcards tab', (tester) async {
    await tester.pumpWidget(const FlashReadApp());

    expect(find.text('Add new flashcards'), findsOneWidget);
  });

  testWidgets('adds a book on the books tab', (tester) async {
    await tester.pumpWidget(const FlashReadApp());

    await tester.tap(find.text('Books'));
    await tester.pump();
    expect(find.text('Add new book'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('Title 1'), findsOneWidget);
  });
}
