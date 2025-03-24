import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_note_taking_app/features/note/domain/entities/note.dart';
import 'package:flutter_note_taking_app/features/note/domain/usecases/note_usecases.dart';
import 'package:flutter_note_taking_app/features/quote/domain/entities/quote.dart';
import 'package:flutter_note_taking_app/features/quote/domain/usecases/quote_usecases.dart';

class NoteState extends ChangeNotifier {
  final GetNotes getNotes;
  final CreateNote createNote;
  final UpdateNote updateNote;
  final DeleteNoteById deleteNote;
  final FetchQuotes fetchQuotes;

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  List<Quote> _quotes = [];
  List<Quote> get quotes => _quotes;

  int _currentQuoteIndex = 0;
  int get currentQuoteIndex => _currentQuoteIndex;

  NoteState({
    required this.getNotes,
    required this.createNote,
    required this.updateNote,
    required this.deleteNote,
    required this.fetchQuotes,
  }) {
    fetchNotes();
    fetchQuotesProc();
    _startQuoteTimer();
  }

  Future<void> fetchNotes() async {
    _notes = await getNotes();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await createNote(note);
    await fetchNotes();
  }

  Future<void> updateNoteById(Note note) async {
    await updateNote(note);
    await fetchNotes();
  }

  Future<void> deleteNoteById(String id) async {
    await deleteNote(id);
    await fetchNotes();
  }

  Future<void> toggleNoteStatus(String id) async {
    final note = _notes.firstWhere((note) => note.id == id);
    final updatedNote = Note(
      id: note.id,
      title: note.title,
      content: note.content,
      createdAt: note.createdAt,
      updatedAt: DateTime.now(),
      isDone: !note.isDone,
    );
    await updateNoteById(updatedNote);
  }

  Future<void> fetchQuotesProc() async {
    try {
      _quotes = await fetchQuotes();
    } catch (e) {
      _quotes = [];
    }
    notifyListeners();
  }

  void _startQuoteTimer() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_quotes.isNotEmpty) {
        _currentQuoteIndex = (_currentQuoteIndex + 1) % _quotes.length;
        notifyListeners();
      }
    });
  }

  int get totalNotes => _notes.length;

  int get completedNotes => _notes.where((note) => note.isDone).length;

  int get pendingNotes => _notes.where((note) => !note.isDone).length;
}
