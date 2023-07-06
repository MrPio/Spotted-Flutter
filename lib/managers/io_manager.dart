// obtain shared preferences
import 'package:shared_preferences/shared_preferences.dart';

class IOManager {
  static final IOManager _instance = IOManager._();

  factory IOManager() => _instance;

  IOManager._();

  set_cache_data(String name, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(name, value); // set value
  }

  Future<String?> get_cache_data(String name) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(name) ?? null;
  }

  remove_cache_data(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(name);

  }
}


