import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/Models/newsModel.dart';


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
              ),
              padding: EdgeInsets.symmetric(horizontal: 6),
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(data.urlToImage!,fit: BoxFit.cover,))),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 0.9,
        aspectRatio: 16/9,
        enableInfiniteScroll: true,
        initialPage: 2,
        autoPlayAnimationDuration: Duration(milliseconds: 600),
        pageSnapping: true,
        pauseAutoPlayInFiniteScroll: true,
      ),
    ),
  );
}
