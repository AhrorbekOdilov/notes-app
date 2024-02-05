import 'package:dio/dio.dart';
import 'package:notes_json_app/core/resources/data_state.dart';
import 'package:notes_json_app/data/data_sources/local/local_db_service.dart';
import 'package:notes_json_app/data/data_sources/local/models/note_hive_model.dart';
import 'package:notes_json_app/data/data_sources/remote/remote_api_service.dart';
import 'package:notes_json_app/data/models/note.dart';
import 'package:notes_json_app/domain/enteties/note.dart';
import 'package:notes_json_app/domain/repository/notes_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final RemoteApiService _remoteApiService;
  final LocalDBService _localDBService;

  NoteRepositoryImpl(
    this._remoteApiService,
    this._localDBService,
  );

  @override
  Future<DataState<List<NoteEntity>>> getNotes() async {
    try {
      List<NoteEntity> notes = [];
      final response = await _remoteApiService.getNotes();

      if (response.statusCode == 200) {
        for (var note in response.data) {
          NoteEntity noteEntity = NoteModel.fromEntity(
            NoteModel.fromJson(note),
          );
          notes.add(noteEntity);
          _localDBService.saveNote(NoteHiveModel.fromEntity(noteEntity));
        }
        return DataSuccess(notes);
      } else {
        return DataFailed(
          DioException(
            response: response,
            error: response.statusMessage,
            requestOptions: response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      List<NoteEntity> notes = _localDBService.getSavedNotes().entyties;
      if (notes.isNotEmpty) {
        return DataSuccess(notes);
      }

      return DataFailed(e);
    }
  }

  @override
  Future<List<NoteEntity>> getSavedNotes() async {
    return _localDBService.getSavedNotes().entyties;
  }

  @override
  Future<void> removeNote(NoteEntity noteEntity) async {
    await _localDBService.removeNote(NoteHiveModel.fromEntity(noteEntity));
  }

  @override
  Future<void> saveNote(NoteEntity noteEntity) async {
    await _localDBService.saveNote(NoteHiveModel.fromEntity(noteEntity));
  }
}

extension NoteHiveModelX on List<NoteHiveModel> {
  List<NoteEntity> get entyties => map((note) => note.toEntity()).toList();
}
