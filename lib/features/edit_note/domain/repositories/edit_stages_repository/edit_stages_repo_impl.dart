import 'package:scriby_app/features/edit_note/domain/domain.dart';
import 'package:scriby_app/persistence/storage/storage.dart';

class EditStagesRepository implements IEditStagesRepository {
  EditStagesRepository({required IEditStackStorage editStackStorage})
      : _editStackStorage = editStackStorage;

  final IEditStackStorage _editStackStorage;

  @override
  Future<void> push() async {}

  @override
  Future<void> pop() async {}

  @override
  Future<void> clear() async {}
}
