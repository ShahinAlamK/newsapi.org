import 'package:flutter/material.dart';
import 'package:newsapi/Models/newsModel.dart';
import 'package:newsapi/Pages/body.dart';
import 'package:newsapi/Services/ApiService.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Global",style: TextStyle(color: Colors.blue),),
            SizedBox(width: 7,),
            Text("News",style: TextStyle(color: Colors.deepOrange),),
          ],
        ),
        actions: [
          Icon(Icons.search,size: 30,),
          SizedBox(width: 7,),
        ],
      ),

      body:Body(),

    );
  }
}
