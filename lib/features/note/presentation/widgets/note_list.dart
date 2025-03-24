import 'package:flutter/material.dart';
import 'package:flutter_note_taking_app/features/note/domain/entities/note.dart';
import 'package:flutter_note_taking_app/state_management/note_state.dart';
import 'package:provider/provider.dart';

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
            icon: Icon(
              note.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            ),
            onPressed: () {
              Provider.of<NoteState>(
                context,
                listen: false,
              ).toggleNoteStatus(note.id);
            },
          ),
          onLongPress:
              () => {
                Provider.of<NoteState>(
                  context,
                  listen: false,
                ).deleteNoteById(note.id),
              },
        );
      },
    );
  }
}
