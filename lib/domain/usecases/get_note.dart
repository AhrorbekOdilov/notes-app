import 'package:notes_json_app/core/resources/data_state.dart';
import 'package:notes_json_app/core/usecases/usecase.dart';
import 'package:notes_json_app/domain/enteties/note.dart';
import 'package:notes_json_app/domain/repository/notes_repository.dart';

class GetNoteUseCase extends NoParamsUseCase<DataState<List<NoteEntity>>> {
  final NoteRepository _noteRepository;

  GetNoteUseCase(this._noteRepository);

  @override
  Future<DataState<List<NoteEntity>>> call() {
    return _noteRepository.getNotes();
  }
}
