import 'package:flash_read/models/flashcard_model.dart';
import 'package:flutter/material.dart';

class FlashcardsPage extends StatelessWidget {
  FlashcardsPage({super.key});
  List<Flashcard> _flashcards = <Flashcard>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _flashcards.isEmpty ? showDefault() : showFlashcards());
  }

  Scaffold showFlashcards() {
    return Scaffold(
      body: ListView.builder(
        itemCount: _flashcards.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, int index) {
          final flashcard = _flashcards[index];
          return ListTile(
            leading: Icon(flashcard.icon),
            title: Text(flashcard.title),
          );
        },
      ),
    );
  }

  Scaffold showDefault() {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add new flashcards',
            ),
          ],
        ),
      ),
    );
  }
}
