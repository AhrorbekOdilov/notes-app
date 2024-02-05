import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_json_app/presentation/states/bloc/remote/remote_note_bloc.dart';
import 'package:notes_json_app/presentation/states/bloc/remote/remote_note_state.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: SafeArea(
          child: _buildBody(),
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteNoteBloc, RemoteNoteState>(
      builder: (_, state) {
        if (state is RemoteNotesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteNotesFailed) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteNotesDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.notes![index].text!),
                subtitle: Text(state.notes![index].dateTime!),
              );
            },
            itemCount: state.notes!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
