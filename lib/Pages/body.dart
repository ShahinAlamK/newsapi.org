import 'package:flutter/material.dart';
import 'package:newsapi/Utils/Colors.dart';
import 'package:newsapi/Widgets/carouselSlider.dart';
import 'package:newsapi/Widgets/everything.dart';


class Body extends StatefulWidget {

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
        CarouselPage(),

        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Category".toUpperCase(),style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: kTextColor),),
        ),


        SizedBox(height: 10,),

        EverythingPage(),


      ],
    );
  }
}
