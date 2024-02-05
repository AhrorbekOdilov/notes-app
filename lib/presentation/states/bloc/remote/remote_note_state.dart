import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_json_app/domain/enteties/note.dart';

abstract class RemoteNoteState extends Equatable {
  final List<NoteEntity>? notes;
  final DioException? error;

  const RemoteNoteState({this.notes, this.error});

  @override
  List<Object?> get props => [notes, error];
}

class RemoteNotesLoading extends RemoteNoteState {
  const RemoteNotesLoading();
}

class RemoteNotesDone extends RemoteNoteState {
  const RemoteNotesDone(List<NoteEntity> notes) : super(notes: notes);
}

class RemoteNotesFailed extends RemoteNoteState {
  const RemoteNotesFailed(DioException error) : super(error: error);
}
