import 'package:flutter/material.dart';
import 'package:flutter_note_taking_app/features/note/domain/entities/note.dart';

class NoteList extends StatelessWidget {
  final List<Note> notes;

  const NoteList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return ListTile(
          title: Text(note.title),
          subtitle: Text(note.content),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              print('delete note');
            },
          ),
        );
      },
    );
  }
}
