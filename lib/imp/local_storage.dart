import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheeran/arch/storage_interface.dart';

class LocalStorage implements IStorage {
  @override
  Future<void> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future<bool> exists(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) != null;
  }

  @override
  Future<String?> load(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await delete(key);
    prefs.setString(key, value);
  }
}
