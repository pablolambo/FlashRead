import 'package:flash_read/models/book_model.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  List<Book> _books = <Book>[];
  int _counter = 0;

  void _addBook() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      _books.add(Book(author: "Author $_counter", title: "Title $_counter"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _books.isEmpty ? showDefault() : showBooks(),
    );
  }

  Scaffold showBooks() {
    return Scaffold(
      body: ListView.builder(
        itemCount: _books.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, int index) {
          final book = _books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBook,
        tooltip: 'Add book',
        child: const Icon(Icons.add),
      ),
    );
  }

  Scaffold showDefault() {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add new book',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBook,
        tooltip: 'Add book',
        child: const Icon(Icons.add),
      ),
    );
  }
}
