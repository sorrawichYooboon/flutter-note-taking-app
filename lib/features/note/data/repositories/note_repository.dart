import 'package:flutter_note_taking_app/features/note/domain/entities/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();
  Future<void> createNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNoteById(String id);
}
