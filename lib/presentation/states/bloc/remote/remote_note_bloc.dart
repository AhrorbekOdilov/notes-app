import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_json_app/core/resources/data_state.dart';
import 'package:notes_json_app/domain/usecases/get_note.dart';
import 'package:notes_json_app/presentation/states/bloc/remote/remote_note_event.dart';
import 'package:notes_json_app/presentation/states/bloc/remote/remote_note_state.dart';

class RemoteNoteBloc extends Bloc<RemoteNoteEvent, RemoteNoteState> {
  final GetNoteUseCase _getNoteUseCase;

  RemoteNoteBloc(this._getNoteUseCase) : super(const RemoteNotesLoading()) {
    on<GetNotesEvent>(onGetNotes);
  }

  void onGetNotes(GetNotesEvent event, Emitter<RemoteNoteState> emit) async {
    final dataState = await _getNoteUseCase();
    print("onGetNotes");

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteNotesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteNotesFailed(dataState.error!));
    }
  }
}
