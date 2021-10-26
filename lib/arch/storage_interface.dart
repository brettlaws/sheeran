abstract class IStorage {
  Future<bool> exists(String key);
  Future<void> delete(String key);
  Future<void> save(String key, List<String> value);
  Future<List<String>> load(String key);
}
