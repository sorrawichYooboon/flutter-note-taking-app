import 'package:flutter/material.dart';
import 'package:flutter_note_taking_app/features/note/presentation/pages/add_note_page.dart';
import 'package:flutter_note_taking_app/state_management/note_state.dart';
import 'package:provider/provider.dart';
import '../widgets/note_list.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search notes...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                Provider.of<NoteState>(
                  context,
                  listen: false,
                ).searchNotes(query);
              },
            ),
          ),
        ),
      ),
      body: Consumer<NoteState>(
        builder: (context, noteState, child) {
          return Column(
            children: [
              if (noteState.quotes.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Inspiration Quote:'),
                      const SizedBox(height: 8),
                      Text(
                        '"${noteState.quotes[noteState.currentQuoteIndex].quote}"',
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '- ${noteState.quotes[noteState.currentQuoteIndex].author}',
                      ),
                    ],
                  ),
                ),
              Expanded(child: NoteList(notes: noteState.filteredNotes)),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const AddNotePage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
