import 'package:flutter/material.dart';
import 'package:flutter_note_taking_app/state_management/note_state.dart';
import 'package:provider/provider.dart';

class StatPage extends StatelessWidget {
  const StatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stats')),
      body: Consumer<NoteState>(
        builder: (context, noteState, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Notes: ${noteState.totalNotes}'),
                const SizedBox(height: 8),
                Text('Completed Notes: ${noteState.completedNotes}'),
                const SizedBox(height: 8),
                Text('Pending Notes: ${noteState.pendingNotes}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
