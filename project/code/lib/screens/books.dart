import 'package:flutter/material.dart';
import 'package:code/components/book_viewer.dart';

class Book extends StatelessWidget {
  final String title;
  const Book({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
      ),
      body: const BookViewer(),
    );
  }
}
