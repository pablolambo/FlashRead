import 'package:flutter/material.dart';

class Book {
  String title;
  String author;
  final IconData icon = Icons.book;

  Book({required this.title, required this.author});
}