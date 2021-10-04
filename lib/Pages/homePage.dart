import 'package:flutter/material.dart';
import 'package:newsapi/Models/newsModel.dart';
import 'package:newsapi/Pages/body.dart';
import 'package:newsapi/Services/ApiService.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<NewsModel?>getData;

  void fetchData(){
    setState(() {
      getData=NewsApiService().fetchingApi();
    });
  }


  Future _onRefresh()async{
    await Future.delayed(Duration(seconds: 3));
    fetchData();
  }

  @override
  void initState() {
    fetchData();
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

      body:  RefreshIndicator(
        onRefresh: _onRefresh,
        child: FutureBuilder<NewsModel?>(
            future: getData,
            builder: (context,snapshot){
          if(snapshot.hasData){
            final data=snapshot.data!;

            return Body(newsModel:data);
          }
          return Center(child:CircularProgressIndicator(),);
        }),
      ),

    );
  }
}
