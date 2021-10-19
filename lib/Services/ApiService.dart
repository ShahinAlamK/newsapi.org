import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapi/Models/newsModel.dart';

class NewsApiService extends ChangeNotifier{

  final String apiKay="3120fffd5de5418796fbab343da2dacc";
  static String mainUrl="https://newsapi.org/v2/";

  Dio dio=Dio();

  var getSources="$mainUrl/sources";
  var getHeadlines="$mainUrl/top-headlines";
  var getEverything="$mainUrl/everything";


  Future<NewsModel?>SourcesApi()async{
    var params={
      "apiKey":apiKay,
      "country":"us",
      "language":"en"
    };
    try{
      final response=await dio.get(getHeadlines,queryParameters: params);
      if(response.statusCode==200){
         NewsModel newsModel=NewsModel.fromJson(response.data);
         //print(newsModel.articles!.first.title);
         return newsModel;
      }
    }catch(e){
      print(e.toString());
    }
  }

  Future<NewsModel?>HeadlinesApi()async{
    var params={
      "apiKey":apiKay,
      "country":"us",
      "language":"en"
    };
    try{
      final response=await dio.get(getHeadlines,queryParameters: params);
      if(response.statusCode==200){
        NewsModel newsModel=NewsModel.fromJson(response.data);
        return newsModel;
      }
    }catch(e){
      print(e.toString());
    }
  }

  Future<NewsModel?>EverythingApi()async{
    var params={
      "apiKey":apiKay,
      "country":"us",
      "language":"en"
    };
    try{
      final response=await dio.get(getEverything,queryParameters: params);
      if(response.statusCode==200){
         NewsModel newsModel=NewsModel.fromJson(response.data);
         return newsModel;
      }
    }catch(e){
      print(e.toString());
    }
  }




}