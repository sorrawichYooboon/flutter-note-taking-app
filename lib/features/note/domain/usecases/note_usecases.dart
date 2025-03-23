import 'package:flutter_note_taking_app/features/note/data/repositories/note_repository.dart';
import 'package:flutter_note_taking_app/features/note/domain/entities/note.dart';

class GetNotes {
  final NoteRepository repository;

  GetNotes(this.repository);

  Future<List<Note>> call() {
    return repository.getNotes();
  }
}

class CreateNote {
  final NoteRepository repository;

  CreateNote(this.repository);

  Future<void> call(Note note) async {
    return await repository.createNote(note);
  }
}

class UpdateNote {
  final NoteRepository repository;

  UpdateNote(this.repository);

  Future<void> call(Note note) async {
    return await repository.updateNote(note);
  }
}

class DeleteNoteById {
  final NoteRepository repository;

  DeleteNoteById(this.repository);

  Future<void> call(String id) async {
    return await repository.deleteNoteById(id);
  }
}
