import 'package:flutter_note_taking_app/features/quote/domain/entities/quote.dart';

class QuoteModel {
  final int id;
  final String quote;
  final String author;

  QuoteModel({required this.id, required this.quote, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['id'],
      quote: json['quote'],
      author: json['author'],
    );
  }

  static QuoteModel fromEntity(Quote quote) {
    return QuoteModel(id: quote.id, quote: quote.quote, author: quote.author);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'quote': quote, 'author': author};
  }

  Quote toEntity() {
    return Quote(id: id, quote: quote, author: author);
  }
}
