import 'package:equatable/equatable.dart';
import 'package:notes_json_app/domain/enteties/note.dart';

abstract class LocalNoteEvent extends Equatable {
  final NoteEntity? note;

  const LocalNoteEvent({this.note});

  @override
  List<Object?> get props => [note];
}

class GetSavedNotesEvent extends LocalNoteEvent {
  const GetSavedNotesEvent();
}

class RemoveNoteEvent extends LocalNoteEvent {
  const RemoveNoteEvent(NoteEntity noteEntity) : super(note: noteEntity);
}

class SaveNoteEvent extends LocalNoteEvent {
  const SaveNoteEvent(NoteEntity noteEntity) : super(note: noteEntity);
}
