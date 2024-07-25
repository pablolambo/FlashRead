import 'package:flutter/material.dart';

class NavigationBarApp extends StatefulWidget{
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Flashcards",
            backgroundColor: Color(0xFFEEFFEE),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Books",
            backgroundColor: Color(0xFFEEFFEE),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFEEFFEE),
        onTap: _onItemTapped,
      ),
    );
  } 

  void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
  }
}