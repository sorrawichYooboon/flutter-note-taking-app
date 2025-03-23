import 'package:flutter/material.dart';
import 'package:flutter_note_taking_app/features/note/domain/respositories/note_repository_impl.dart';
import 'package:flutter_note_taking_app/features/note/domain/usecases/note_usecases.dart';
import 'package:flutter_note_taking_app/features/note/presentation/pages/note_page.dart';
import 'package:flutter_note_taking_app/state_management/note_state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final noteRepository = NoteRepositoryImpl(
    sharedPreferences: sharedPreferences,
  );
  final getNotes = GetNotes(noteRepository);
  final createNote = CreateNote(noteRepository);
  final updateNote = UpdateNote(noteRepository);
  final deleteNote = DeleteNoteById(noteRepository);
  runApp(
    ChangeNotifierProvider(
      create:
          (_) => NoteState(
            getNotes: getNotes,
            createNote: createNote,
            updateNote: updateNote,
            deleteNote: deleteNote,
          ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Note Taking App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const NotePage(),
    );
  }
}
