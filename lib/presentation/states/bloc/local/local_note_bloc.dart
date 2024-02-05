import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_json_app/domain/usecases/get_saved_notes.dart';
import 'package:notes_json_app/domain/usecases/remove_note.dart';
import 'package:notes_json_app/domain/usecases/save_note.dart';
import 'package:notes_json_app/presentation/states/bloc/local/local_note_event.dart';
import 'package:notes_json_app/presentation/states/bloc/local/local_note_state.dart';

class LocalNoteBloc extends Bloc<LocalNoteEvent, LocalNoteState> {
  final GetSavedNotesUseCase _getSavedNotesUseCase;
  final RemoveNoteUseCase _removeNoteUseCase;
  final SaveNoteUSeCase _saveNoteUSeCase;

  LocalNoteBloc(
    this._getSavedNotesUseCase,
    this._removeNoteUseCase,
    this._saveNoteUSeCase,
  ) : super(const LocalNotesLoading()) {
    on<GetSavedNotesEvent>(onGetSavedNotes);
    on<SaveNoteEvent>(onSaveNote);
    on<RemoveNoteEvent>(onRemoveNote);
  }

  onGetSavedNotes(
    GetSavedNotesEvent event,
    Emitter<LocalNoteState> emit,
  ) async {
    final notes = await _getSavedNotesUseCase();
    emit(LocalNotesSucces(notes));
  }

  onRemoveNote(
    RemoveNoteEvent event,
    Emitter<LocalNoteState> emit,
  ) async {
    await _removeNoteUseCase(params: event.note);
    final notes = await _getSavedNotesUseCase();
    emit(LocalNotesSucces(notes));
  }

  onSaveNote(
    SaveNoteEvent event,
    Emitter<LocalNoteState> emit,
  ) async {
    await _saveNoteUSeCase(params: event.note);
    final notes = await _getSavedNotesUseCase();
    emit(LocalNotesSucces(notes));
  }
}
