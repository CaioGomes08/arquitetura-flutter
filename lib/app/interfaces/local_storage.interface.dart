abstract class ILocalStorage {
  Future get(String key);
  Future delete(String key);
  Future save(String key, dynamic value);
}
