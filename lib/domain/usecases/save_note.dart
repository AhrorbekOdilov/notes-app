import 'package:notes_json_app/core/usecases/usecase.dart';
import 'package:notes_json_app/domain/enteties/note.dart';
import 'package:notes_json_app/domain/repository/notes_repository.dart';

class SaveNoteUSeCase extends UseCase<void, NoteEntity> {
  final NoteRepository _noteRepository;

  SaveNoteUSeCase(this._noteRepository);

  @override
  Future<void> call({NoteEntity? params}) async {
    _noteRepository.saveNote(params!);
  }
}
