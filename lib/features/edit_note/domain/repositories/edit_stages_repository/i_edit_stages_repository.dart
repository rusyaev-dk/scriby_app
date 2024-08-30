abstract interface class IEditStagesRepository {
  Future<void> push();
  Future<void> pop();
  Future<void> clear();
}
