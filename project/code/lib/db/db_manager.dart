import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task.dart';
import '../models/book.dart';

class DbManager {
  static final DbManager instance = DbManager._init();

  static Database? _database;

  DbManager._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print("Database path: $path");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const desType = 'TEXT DEFAULT ""';
    const boolType = 'BOOLEAN NOT NULL DEFAULT 0';

    await db.execute('''
    CREATE TABLE tasks ( 
      id $idType, 
      title $textType,
      description $desType,
      isDone $boolType
    )
    ''');

    await db.execute('''
    CREATE TABLE books ( 
      id $idType, 
      title $textType,
      auth $textType,
      description $textType,
      imageUrl $textType
    )
    ''');
  }

  Future<void> createTask(Task task) async {
    final db = await instance.database;

    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> createBook(Book book) async {
    final db = await instance.database;

    await db.insert(
      'books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Task?> findOneTask(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'tasks',
      columns: ['id', 'title', 'description', 'isDone'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<Book?> findOneBook(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'books',
      columns: ['id', 'title', 'auth', 'description', 'imageUrl'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Book.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Task>> findAllTasks() async {
    final db = await instance.database;

    final result = await db.query('tasks');

    return result.map((json) => Task.fromMap(json)).toList();
  }

  Future<List<Book>> findAllBooks() async {
    final db = await instance.database;

    final result = await db.query('books');

    return result.map((json) => Book.fromMap(json)).toList();
  }

  Future<int> updateTask(Task task) async {
    final db = await instance.database;

    return db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> updateBook(Book book) async {
    final db = await instance.database;

    return db.update(
      'books',
      book.toMap(),
      where: 'id = ?',
      whereArgs: [book.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await instance.database;

    return db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteBook(int id) async {
    final db = await instance.database;

    return db.delete(
      'books',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
