import 'package:code/models/book.dart';
import 'package:code/db/db_manager.dart';

Future<void> insertBooks() async {
  List<Book> books = [
    Book(
      title: 'Clean Code',
      auth: 'Robert Cecil Martin',
      description:
          'Even bad code can function. But if code isn\'t clean, it can bring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. But it doesn\'t have to be that way.',
      imageUrl: 'assets/book-cover/cleancode.jpeg',
    ),
    Book(
      title: 'The Pragmatic Programmer',
      auth: 'Andy Hunt and Dave Thomas',
      description:
          'The Pragmatic Programmer: From Journeyman to Master is a book about computer programming and software engineering, written by Andrew Hunt and David Thomas and published in October 1999. It is used as a textbook in related university courses.',
      imageUrl: 'assets/book-cover/pragmatic.jpeg',
    ),
    Book(
      title: 'The Mythical Man-Month',
      auth: 'Fred Brooks',
      description:
          'The Mythical Man-Month: Essays on Software Engineering is a book on software engineering and project management by Fred Brooks first published in 1975, with subsequent editions in 1982 and 1995. Its central theme is that adding manpower to a software project that is behind schedule delays it even longer.',
      imageUrl: 'assets/book-cover/mythical.jpeg',
    ),
    Book(
      title: 'A Philosophy of Software Design',
      auth: 'John Ousterhout',
      description:
          'This book addresses the topic of software design: how to decompose complex software systems into modules (such as classes and methods) that can be implemented relatively independently. The book first introduces the fundamental problem in software design, which is managing complexity.',
      imageUrl: 'assets/book-cover/philosophy.jpeg',
    ),
    Book(
      title: 'Design Patterns: Elements of Reusable Object-Oriented Software',
      auth: 'Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides',
      description:
          'Design Patterns: Elements of Reusable Object-Oriented Software is a software engineering book describing software design patterns. The book was written by Erich Gamma, Richard Helm, Ralph Johnson, and John Vlissides, with a foreword by Grady Booch.',
      imageUrl: 'assets/book-cover/designpatterns.jpeg',
    ),
    Book(
      title: 'Test Driven Development by Example',
      auth: 'Kent Beck',
      description:
          'Quite simply, test-driven development is meant to eliminate fear in application development. While some fear is healthy (often viewed as a conscience that tells programmers to "be careful!"),',
      imageUrl: 'assets/book-cover/tdd.jpeg',
    ),
    Book(
      title: 'Head First Design Patterns',
      auth: '',
      description:
          'What’s so special about design patterns? At any given moment, someone struggles with the same software design problems you have. And, chances are, someone else has already solved your problem.',
      imageUrl: 'assets/book-cover/headfirst.jpeg',
    ),
    Book(
      title: 'Code: The Hidden Language of Computer Hardware and Software',
      auth: 'Charles Petzold',
      description:
          'Code: The Hidden Language of Computer Hardware and Software is a book by Charles Petzold that seeks to teach how personal computers work at a hardware and software level.',
      imageUrl: 'assets/book-cover/code.png',
    ),
  ];

  for (var book in books) {
    await DbManager.instance.createBook(book);
  }
}
