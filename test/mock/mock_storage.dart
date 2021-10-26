import 'package:sheeran/arch/storage_interface.dart';

class MockStorage implements IStorage {
  final _data = <String, String>{};

  @override
  Future<void> delete(String key) async {
    if (await exists(key)) {
      _data.remove(key);
    }
  }

  @override
  Future<bool> exists(String key) async {
    if (_data.containsKey(key)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String?> load(String key) async {
    if (await exists(key)) {
      return _data['key'];
    } else {
      return null;
    }
  }

  @override
  Future<void> save(String key, String value) async {
    if (await exists(key)) {
      await delete(key);
    }
    _data.putIfAbsent(key, () => value);
  }
}
