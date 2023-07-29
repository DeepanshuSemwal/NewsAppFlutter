import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../modals/get_modal.dart';

class ApiService {

  final endPointUrl ="https://newsapi.org/v2/everything?q=bitcoin&apiKey=85940a4d7b23488ba7ecd9e9e7c6533e";
  Future<List<Article>> getArticle() async {
    //Response res = await http.get(endPointUrl as Uri);
    final uri=Uri.parse(endPointUrl);
    final res=await http.get(uri);
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
