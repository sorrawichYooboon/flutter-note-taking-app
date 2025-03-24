import 'dart:convert';
import 'package:flutter_note_taking_app/features/quote/data/models/quote_model.dart';
import 'package:flutter_note_taking_app/features/quote/data/repositories/quote_repository.dart';
import 'package:flutter_note_taking_app/features/quote/data/services/quote_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final SharedPreferences sharedPreferences;
  final QuoteService quoteService;

  QuoteRepositoryImpl({
    required this.sharedPreferences,
    required this.quoteService,
  });

  @override
  Future<List<QuoteModel>> fetchQuotes() async {
    final quotes = await quoteService.fetchQuotes();
    await cacheQuotes(quotes);
    return quotes;
  }

  @override
  Future<void> cacheQuotes(List<QuoteModel> quotes) async {
    final jsonString = json.encode(
      quotes.map((quote) => quote.toJson()).toList(),
    );
    await sharedPreferences.setString('cached_quotes', jsonString);
  }

  @override
  List<QuoteModel> getCachedQuotes() {
    final jsonString = sharedPreferences.getString('cached_quotes');
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => QuoteModel.fromJson(json)).toList();
    }
    return [];
  }
}
