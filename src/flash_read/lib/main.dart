import 'package:flutter/material.dart';
import 'pages/navigation_bar.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 215, 237, 168),
          primary: const Color.fromARGB(255, 121, 147, 81),
          secondary: const Color.fromARGB(255, 215, 237, 168),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const NavigationBarApp(),
    );
  }
}
