import 'package:flutter/material.dart';
import 'package:newsapi/Models/newsModel.dart';
import 'package:newsapi/Widgets/carouselSlider.dart';
import 'package:newsapi/Widgets/newsCard.dart';

class Body extends StatefulWidget {
  final NewsModel?newsModel;
  Body({required this.newsModel});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 10,),
        carouselSlider(widget.newsModel!),

        SizedBox(height: 10,),

        Text("Category"),
        Container(
          height: 80,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.grey
          ),
        ),

        ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount:widget.newsModel!.articles!.length.clamp(5,20),
            itemBuilder: (context,index){
          return NewsCardView(widget.newsModel!.articles![index]);
        })

      ],
    );
  }
}
