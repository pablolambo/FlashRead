import 'package:flash_read/pages/books_page.dart';
import 'package:flash_read/pages/flashcards_page.dart';
import 'package:flutter/material.dart';

class NavigationBarApp extends StatefulWidget {
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _selectedIndex = 0;

  List<Widget> pages = [FlashcardsPage(), BooksPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.school),
            label: "Flashcards",
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: "Books",
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
      body: pages.elementAt(_selectedIndex),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
