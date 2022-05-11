import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/NewsResponse.dart';
import 'package:news_app/data/SourcesRespone.dart';


class ApiManger{
 static  String baseUrl= "newsapi.org";
 static final String apiKey= "edf5083a5b40442e88026eb0ecff3234";

 static Future<SourcesResponse> getNewsSources(String categoryId)async{
  var url =  Uri.https(baseUrl, "/v2/top-headlines/sources",
    {"apikey":apiKey,
    "category": categoryId
    });

   var response = await http.get(url);
   try{
     var json = jsonDecode(response.body);
     var sourcesResponse = SourcesResponse.fromJson(json);
     return sourcesResponse;

   }catch(exception){
     throw exception;
   }
  }

  static Future<NewsResponse> getNews(
      {String? sourceId, String? searchKeyWord, int page =1})async{
   var url =Uri.https(baseUrl, "/v2/top-headlines",
       { "apiKye": apiKey, "sources": sourceId, "q":searchKeyWord,'page':"$page"}
   );
   var response = await http.get(url);
   try{
     var json = jsonDecode(response.body);
     var newsResponse = NewsResponse.fromJson(json);
     return newsResponse;
   }catch(exception){
     throw exception;
   }
  }
}