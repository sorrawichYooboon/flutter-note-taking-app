import 'package:flutter/material.dart';
import 'package:flutter_note_taking_app/features/note/domain/entities/note.dart';
import 'package:flutter_note_taking_app/features/note/domain/usecases/note_usecases.dart';

class NoteState extends ChangeNotifier {
  final GetNotes getNotes;
  final CreateNote createNote;
  final UpdateNote updateNote;
  final DeleteNoteById deleteNote;

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  NoteState({
    required this.getNotes,
    required this.createNote,
    required this.updateNote,
    required this.deleteNote,
  });

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
}
