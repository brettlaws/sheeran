abstract class IStorage {
  Future<bool> exists(String key);
  Future<void> delete(String key);
  Future<void> save(String key, String value);
  Future<String?> load(String key);
}
