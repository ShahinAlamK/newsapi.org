import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:newsapi/Models/newsModel.dart';
import 'package:newsapi/Services/ApiService.dart';
import 'package:provider/provider.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {

  late Future<NewsModel?>getData;

  void fetchData(){
    setState(() {
      getData=Provider.of<NewsApiService>(context,listen: false).SourcesApi();
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
          return carouselSlider(snapshot.data!);
        }else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }else{
          return Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueGrey
            ),
          );
        }
    });
  }
}



carouselSlider(NewsModel newsModel){

  return  Container(
    height: 170,
    width: double.infinity,
    child: CarouselSlider.builder(
      itemCount: newsModel.articles==null?0:newsModel.articles!.length.clamp(3,5),
      itemBuilder: (context,index,realIndex){
       final data=newsModel.articles![index];
        return GestureDetector(
          onTap: (){},
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    fit: BoxFit.cover,
                  image: NetworkImage(data.urlToImage!=null?data.urlToImage!:"",)
                )
              ),
              padding: EdgeInsets.symmetric(horizontal: 6),
              margin: EdgeInsets.symmetric(horizontal: 6),
              width: double.infinity,
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 0.9,
        aspectRatio: 14/9,
        enableInfiniteScroll: true,
        initialPage: 2,
        autoPlayAnimationDuration: Duration(milliseconds: 600),
        pageSnapping: true,
        pauseAutoPlayInFiniteScroll: true,
      ),
    ),
  );
}
