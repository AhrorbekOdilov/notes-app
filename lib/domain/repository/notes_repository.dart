import 'package:notes_json_app/core/resources/data_state.dart';
import 'package:notes_json_app/domain/enteties/note.dart';

abstract class NoteRepository {
  Future<DataState<List<NoteEntity>>> getNotes();

  Future<List<NoteEntity>> getSavedNotes();

  Future<void> saveNote(NoteEntity noteEntity);

  Future<void> removeNote(NoteEntity noteEntity);
}
