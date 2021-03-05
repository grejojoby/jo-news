import 'dart:convert';

import 'package:jo_news/models/articleModel.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news = [];
Future<void> getNews() async{
  // String url = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=b69c685e9cdd4032a1cc7911982bf477";
print("Loading news");
 var Url =  Uri.https('newsapi.org', '/v2/top-headlines', {'country': 'in','category': 'business','apiKey': 'b69c685e9cdd4032a1cc7911982bf477'});
 // print(Url);
 var response = await http.get(Url);
  // print(response);
  var jsonData = jsonDecode(response.body);
  // print(jsonData);

  if(jsonData['status']=="ok"){
    jsonData["articles"].forEach((element){
      if(element["urlToImage"] != null && element['description'] != null){
        ArticleModel articleModel = ArticleModel(
          title: element["title"],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          // publishedAt: element['publishedAt'],
          content: element['content']
        );
        news.add(articleModel);
      }
    });
  }
}

}