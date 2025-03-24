import 'package:flutter_note_taking_app/features/quote/data/models/quote_model.dart';

abstract class QuoteRepository {
  Future<List<QuoteModel>> fetchQuotes();
  Future<void> cacheQuotes(List<QuoteModel> quotes);
  List<QuoteModel> getCachedQuotes();
}
