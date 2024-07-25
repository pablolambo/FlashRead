import 'package:flutter/material.dart';
import 'books_page.dart';
import 'navigation_bar.dart';

void main() {
  runApp(const FlashReadApp());
}

class FlashReadApp extends StatelessWidget {
  const FlashReadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlashRead',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFAAFFAA)),
        useMaterial3: true,
      ),
      home: const NavigationBarApp(),
    );
  }
}
