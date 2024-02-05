import 'package:equatable/equatable.dart';
import 'package:notes_json_app/domain/enteties/note.dart';

abstract class LocalNoteState extends Equatable {
  final List<NoteEntity>? notes;

  const LocalNoteState({this.notes});

  @override
  List<Object?> get props => [notes];
}

class LocalNotesSucces extends LocalNoteState {
  const LocalNotesSucces(List<NoteEntity> notes) : super(notes: notes);
}

class LocalNotesLoading extends LocalNoteState {
  const LocalNotesLoading();
}
