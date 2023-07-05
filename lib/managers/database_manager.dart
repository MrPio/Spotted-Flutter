import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._();

  factory DatabaseManager() => _instance;

  DatabaseManager._();

  final FirebaseDatabase _database = FirebaseDatabase.instance;

  /// Get an object from the given location
  Future<Map<String, dynamic>> get(String path) async =>
      jsonDecode(jsonEncode(
          (await _database.ref(path).once()).snapshot.value as Map));

  /// Put an object to a given location
  Future<void> put(String path, dynamic object) async =>
      _database.ref(path).set(object);

  /// Push given object in a new child on the giving location. Returns the created key
  Future<String?> push(String path, dynamic object) async {
    final node = _database.ref(path).push();
    await node.set(object);
    return node.key;
  }
}
