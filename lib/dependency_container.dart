import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_json_app/core/network.dart';
import 'package:notes_json_app/data/data_sources/local/local_db_service.dart';
import 'package:notes_json_app/data/data_sources/remote/remote_api_service.dart';
import 'package:notes_json_app/data/repository/note_repository_impl.dart';
import 'package:notes_json_app/domain/repository/notes_repository.dart';
import 'package:notes_json_app/domain/usecases/get_note.dart';
import 'package:notes_json_app/domain/usecases/get_saved_notes.dart';
import 'package:notes_json_app/domain/usecases/remove_note.dart';
import 'package:notes_json_app/domain/usecases/save_note.dart';
import 'package:notes_json_app/presentation/states/bloc/local/local_note_bloc.dart';
import 'package:notes_json_app/presentation/states/bloc/remote/remote_note_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependency() async {
  //initialize local database
  await LocalDBService.init();

  // sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NetworkManager>(NetworkManager());

  sl.registerSingleton<LocalDBService>(LocalDBService());

  // // Dependencie
  // sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<RemoteApiService>(
      RemoteApiService(dio: sl(), networkManager: sl()));

  // sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));
  sl.registerSingleton<NoteRepository>(NoteRepositoryImpl(sl(), sl()));

  // //UseCases
  // sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetNoteUseCase>(GetNoteUseCase(sl()));

  // sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<GetSavedNotesUseCase>(GetSavedNotesUseCase(sl()));

  // sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<SaveNoteUSeCase>(SaveNoteUSeCase(sl()));

  // sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));
  sl.registerSingleton<RemoveNoteUseCase>(RemoveNoteUseCase(sl()));

  // //Blocs
  // sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  sl.registerFactory<RemoteNoteBloc>(() => RemoteNoteBloc(sl()));

  // sl.registerFactory<LocalArticleBloc>(
  //     () => LocalArticleBloc(sl(), sl(), sl()));

  sl.registerFactory<LocalNoteBloc>(() => LocalNoteBloc(sl(), sl(), sl()));
}
