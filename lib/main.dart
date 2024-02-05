import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_json_app/dependency_container.dart';
import 'package:notes_json_app/presentation/screens/notes_screen.dart';
import 'package:notes_json_app/presentation/states/bloc/remote/remote_note_bloc.dart';
import 'package:notes_json_app/presentation/states/bloc/remote/remote_note_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteNoteBloc>(
          create: (context) => sl()..add(const GetNotesEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NotesScreen(),
      ),
    );
  }
}
