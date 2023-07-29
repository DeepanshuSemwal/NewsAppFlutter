import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../modals/get_modal.dart';

class ApiService {

  Future<List<Article>> getArticle() async {

    final response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=bitcoin&apiKey=85940a4d7b23488ba7ecd9e9e7c6533e"));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
