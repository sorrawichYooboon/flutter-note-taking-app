import 'package:flutter_note_taking_app/features/quote/data/repositories/quote_repository.dart';
import 'package:flutter_note_taking_app/features/quote/domain/entities/quote.dart';

class FetchQuotes {
  final QuoteRepository repository;

  FetchQuotes(this.repository);

  Future<List<Quote>> call() async {
    final cacheQuotes = repository.getCachedQuotes();
    if (cacheQuotes.isNotEmpty) {
      final formQuote = cacheQuotes.map((quote) => quote.toEntity()).toList();
      return formQuote;
    }

    final quotes = await repository.fetchQuotes();
    repository.cacheQuotes(quotes);
    final formQuote = quotes.map((quote) => quote.toEntity()).toList();
    return formQuote;
  }
}
