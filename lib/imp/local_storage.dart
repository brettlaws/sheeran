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
    return prefs.getStringList(key) != null;
  }

  @override
  Future<List<String>> load(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  @override
  Future<void> save(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    await delete(key);
    prefs.setStringList(key, value);
  }
}
