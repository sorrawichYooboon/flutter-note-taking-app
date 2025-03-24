import 'package:flutter/material.dart';
import 'package:flutter_note_taking_app/features/note/domain/respositories/note_repository_impl.dart';
import 'package:flutter_note_taking_app/features/note/domain/usecases/note_usecases.dart';
import 'package:flutter_note_taking_app/features/note/presentation/pages/note_page.dart';
import 'package:flutter_note_taking_app/features/note/presentation/pages/stat_page.dart';
import 'package:flutter_note_taking_app/features/quote/data/services/quote_service.dart';
import 'package:flutter_note_taking_app/features/quote/domain/respositories/quote_repository.dart';
import 'package:flutter_note_taking_app/features/quote/domain/usecases/quote_usecases.dart';
import 'package:flutter_note_taking_app/state_management/note_state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final noteRepository = NoteRepositoryImpl(
    sharedPreferences: sharedPreferences,
  );
  final quoteService = QuoteService();
  final quoteRepository = QuoteRepositoryImpl(
    sharedPreferences: sharedPreferences,
    quoteService: quoteService,
  );
  final getNotes = GetNotes(noteRepository);
  final createNote = CreateNote(noteRepository);
  final updateNote = UpdateNote(noteRepository);
  final deleteNote = DeleteNoteById(noteRepository);
  final fetchQuotes = FetchQuotes(quoteRepository);
  runApp(
    ChangeNotifierProvider(
      create:
          (_) => NoteState(
            getNotes: getNotes,
            createNote: createNote,
            updateNote: updateNote,
            deleteNote: deleteNote,
            fetchQuotes: fetchQuotes,
          ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[NotePage(), StatPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Note Taking App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notes'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Stats',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
