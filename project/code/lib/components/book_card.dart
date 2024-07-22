import 'package:flutter/material.dart';
import 'package:code/widgets/image.dart';
import 'package:code/models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      color: Theme.of(context).colorScheme.primary,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              imageUrl: book.imageUrl,
              height: 150.0,
              borderRadius: BorderRadius.circular(10.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              book.title,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(height: 4.0),
            Text(
              book.description,
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/book',
                      arguments: {'book': book},
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.send_sharp,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        "Visit",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
