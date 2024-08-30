abstract interface class IEditStackStorage {
  Future<void> push();
  Future<void> pop();
  Future<void> clear();
}
