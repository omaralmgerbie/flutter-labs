import 'package:flutter/material.dart';
import 'package:code/models/book.dart';
import 'package:code/db/db_manager.dart';
import 'package:code/hooks/insert_books.dart';
import 'book_card.dart';

class BookViewer extends StatefulWidget {
  const BookViewer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookViewerState createState() => _BookViewerState();
}

class _BookViewerState extends State<BookViewer> {
  late Future<List<Book>> _booksFuture;

  @override
  void initState() {
    super.initState();
    _booksFuture = fetchBooks();
  }

  Future<List<Book>> fetchBooks() async {
    List<Book> books = await DbManager.instance.findAllBooks();
    if (books.isEmpty) {
      await insertBooks();
      books = await DbManager.instance.findAllBooks();
    }
    return books;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: _booksFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No books available'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return BookCard(book: snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}
