import 'package:notes_json_app/core/usecases/usecase.dart';
import 'package:notes_json_app/domain/enteties/note.dart';
import 'package:notes_json_app/domain/repository/notes_repository.dart';

class GetSavedNotesUseCase extends NoParamsUseCase<List<NoteEntity>> {
  final NoteRepository _noteRepository;

  GetSavedNotesUseCase(this._noteRepository);

  @override
  Future<List<NoteEntity>> call() {
    return _noteRepository.getSavedNotes();
  }
}
