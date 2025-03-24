import 'package:flutter/material.dart';
import 'package:flutter_note_taking_app/features/note/domain/entities/note.dart';
import 'package:flutter_note_taking_app/state_management/note_state.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          Colors.primaries[note.id.hashCode % Colors.primaries.length].shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(note.content, style: Theme.of(context).textTheme.bodySmall),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    note.isDone
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                  ),
                  onPressed: () {
                    Provider.of<NoteState>(
                      context,
                      listen: false,
                    ).toggleNoteStatus(note.id);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Provider.of<NoteState>(
                      context,
                      listen: false,
                    ).deleteNoteById(note.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
