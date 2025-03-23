import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_note_taking_app/features/note/data/models/note_model.dart';
import 'package:flutter_note_taking_app/features/note/data/repositories/note_repository.dart';
import 'package:flutter_note_taking_app/features/note/domain/entities/note.dart';

class NoteRepositoryImpl implements NoteRepository {
  final SharedPreferences sharedPreferences;

  NoteRepositoryImpl({required this.sharedPreferences});

  @override
  Future<List<Note>> getNotes() async {
    final jsonString = sharedPreferences.getString('notes');
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) => NoteModel.fromJson(json))
          .map((noteModel) => noteModel.toEntity())
          .toList();
    }

    return [];
  }

  @override
  Future<void> createNote(Note note) async {
    final notes = await getNotes();
    notes.add(note);
    final jsonString = json.encode(
      notes.map((note) => NoteModel.fromEntity(note).toJson()).toList(),
    );
    sharedPreferences.setString('notes', jsonString);
  }

  @override
  Future<void> updateNote(Note note) async {
    final notes = await getNotes();
    final index = notes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      notes[index] = note;
      final jsonString = json.encode(
        notes.map((note) => NoteModel.fromEntity(note).toJson()).toList(),
      );
      sharedPreferences.setString('notes', jsonString);
    }
  }

  @override
  Future<void> deleteNoteById(String id) async {
    final notes = await getNotes();
    notes.removeWhere((note) => note.id == id);
    final jsonString = json.encode(
      notes.map((note) => NoteModel.fromEntity(note).toJson()).toList(),
    );
    sharedPreferences.setString('notes', jsonString);
  }
}
