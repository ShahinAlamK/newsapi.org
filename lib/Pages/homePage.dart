import 'package:flutter/material.dart';
import 'package:newsapi/Models/newsModel.dart';
import 'package:newsapi/Pages/body.dart';
import 'package:newsapi/Services/ApiService.dart';
import 'package:newsapi/Widgets/newsCard.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<NewsModel?>getData;

  @override
  void initState() {
   getData=NewsApiService().fetchingApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("NewsApp"),
      ),

      body:  FutureBuilder<NewsModel?>(
          future: getData,
          builder: (context,snapshot){
        if(snapshot.hasData){
          final data=snapshot.data!;

          return Body(newsModel:data);
        }
        return Center(child:CircularProgressIndicator(),);
      }),

    );
  }
}
