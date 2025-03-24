import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote_model.dart';

class QuoteService {
  Future<List<QuoteModel>> fetchQuotes() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/quotes'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['quotes'];
      return jsonList.map((json) => QuoteModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}
