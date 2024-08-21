import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import '../models/tasks.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, task_title TEXT, date TEXT, time TEXT, description TEXT, color TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertTask(Tasks task) async {
    final db = await database;
    await db.insert('tasks', task.userMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
        print("data inserted");
  }

  Future<List<Tasks>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      return Tasks()
        ..id = maps[i]['id']
        ..task_title = maps[i]['task_title']
        ..date = maps[i]['date']
        ..time = maps[i]['time']
        ..description = maps[i]['description'];
    });
  }

  Future<void> updateTask(Tasks task) async {
    final db = await database;
    await db.update(
      'tasks',
      task.userMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> truncateTasks() async {
    final db = await database;
    await db.delete("tasks");
  }

}
