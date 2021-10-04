import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart'as http;
import 'package:newsapi/Models/newsModel.dart';

class NewsApiService{

  static String mainUrl="https://newsapi.org/v2/";
  static String apiKey="3120fffd5de5418796fbab343da2dacc";

  var getSourceUrl="$mainUrl/sources";
  var getHeadingUrl="$mainUrl/top-headlines";
  var getEverythingUrl="$mainUrl/everything";

  Future<NewsModel?>fetchingApi()async{
    String url="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3120fffd5de5418796fbab343da2dacc";
    try{
      final response=await http.get(Uri.parse(url));
      if(response.statusCode==200){
        final decode=await jsonDecode(response.body);
        if(decode['status']=="ok"){
         NewsModel newsModel=NewsModel.fromJson(decode);
         return newsModel;
        }
      }
    }catch(e){
      print(e.toString());
    }
  }




}