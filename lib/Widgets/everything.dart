import 'package:flutter/material.dart';
import 'package:newsapi/Models/newsModel.dart';
import 'package:newsapi/Services/ApiService.dart';
import 'package:newsapi/Widgets/newsCard.dart';
import 'package:provider/provider.dart';

class EverythingPage extends StatefulWidget {
  const EverythingPage({Key? key}) : super(key: key);

  @override
  _EverythingPageState createState() => _EverythingPageState();
}

class _EverythingPageState extends State<EverythingPage> {

  late Future<NewsModel?>getData;

  void fetchData(){
    setState(() {
      getData=Provider.of<NewsApiService>(context,listen: false).HeadlinesApi();
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel?>(
        future: getData,
        builder:(context,snapshot){
          if(snapshot.hasData){
            return _newsList(snapshot.data!);
          }else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }else{
            return Text("Loading...");
          }
        });
  }

  _newsList(NewsModel newsModel){
    return ListView.builder(
      shrinkWrap: true,
        physics: BouncingScrollPhysics(),
      itemCount: newsModel.articles!.length,
        itemBuilder: (context,index){
        final article=newsModel.articles![index];
      return NewsCardView(article);
    });
  }
}
