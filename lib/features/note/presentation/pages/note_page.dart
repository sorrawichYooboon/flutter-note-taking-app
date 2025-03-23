import 'package:flutter/material.dart';
import 'package:flutter_note_taking_app/state_management/note_state.dart';
import 'package:provider/provider.dart';
import '../widgets/note_list.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: Consumer<NoteState>(
        builder: (context, noteState, child) {
          return NoteList(notes: noteState.notes);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('navigate to create note page');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
