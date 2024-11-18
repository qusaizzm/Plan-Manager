import 'package:plan_manager/core/error/exceptions.dart';
import 'package:plan_manager/core/network/error_message_model.dart';
import 'package:plan_manager/my_plan/domain/usecases/insert_plan_usecase.dart';
import 'package:plan_manager/my_plan/domain/usecases/update_plan.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/plan_model.dart';

abstract class BaseTaskLocalDataSource {
  Future<List<TaskModel>> insertTask(AddParameters plan);
  Future<List<TaskModel>> getTasks();
  Future<List<TaskModel>> updateTask(UpdateParameters plan);
  Future<List<TaskModel>> deleteTask(int id);
  Future<List<TaskModel>> deleteAllTasks();
}

class TaskLocalDataSource extends BaseTaskLocalDataSource {
  // Singleton instance (if needed)
  // static final TaskLocalDataSource _instance = TaskLocalDataSource._internal();
  // TaskLocalDataSource._internal();
  // static TaskLocalDataSource get instance => _instance;

  Future<Database> _database() async {
    final path = join(await getDatabasesPath(), 'daily_planner98.db');
    return openDatabase(
      path,
      version: 1, // Increment the version number here
      onCreate: (db, version) async {
        // Create the table with the new column (alertDays)
        await db.execute('''
        CREATE TABLE plans (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          completed INTEGER,
          lastCompletedDate TEXT,
          alratDays TEXT
        )
      ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // If upgrading from version 1 to version 2, add the new column
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE plans ADD COLUMN alertDays TEXT');
        }
      },
    );
  }

  @override
  Future<List<TaskModel>> insertTask(AddParameters plan) async {
    var data = plan.planEntites.toMap();
    final db = await _database();
    final id = await db.insert('plans', data);
    if (id > 0) {
      final List<Map<String, dynamic>> maps = await db.query('plans');
      return maps.map((map) => TaskModel.fromMap(map)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
            statusCode: -1, statusMessage: "Error", success: false),
      );
    }
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    final db = await _database();
    final List<Map<String, dynamic>> maps = await db.query('plans');
    return maps.map((map) => TaskModel.fromMap(map)).toList();
  }

  @override
  Future<List<TaskModel>> updateTask(UpdateParameters plan) async {
    final db = await _database();
    final rows = await db.update(
      'plans',
      plan.planEntites.toMap(),
      where: 'id = ?',
      whereArgs: [plan.planEntites.id],
    );
    if (rows > 0) {
      // If the deletion was successful, fetch and return the updated task list
      final List<Map<String, dynamic>> maps = await db.query('plans');
      return maps.map((task) => TaskModel.fromMap(task)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
            statusCode: -1, statusMessage: "Error", success: false),
      );
    }
  }

  @override
  Future<List<TaskModel>> deleteTask(int id) async {
    final db = await _database();

    // Perform the delete operation and check if any rows were affected
    final rows = await db.delete(
      'plans',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (rows > 0) {
      // If the deletion was successful, fetch and return the updated task list
      final List<Map<String, dynamic>> maps = await db.query('plans');
      return maps.map((task) => TaskModel.fromMap(task)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
            statusCode: -1, statusMessage: "Error", success: false),
      );
    }
  }

  @override
  Future<List<TaskModel>> deleteAllTasks() async {
    final db = await _database();

    // Perform the deleteAll operation and check if any rows were affected
    final rows = await db.delete('plans');

    if (rows > 0) {
      final List<Map<String, dynamic>> maps = await db.query('plans');
      return maps.map((task) => TaskModel.fromMap(task)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
            statusCode: -1, statusMessage: "Error", success: false),
      );
    }
  }
}
