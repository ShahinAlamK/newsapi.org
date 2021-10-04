import 'package:flutter/material.dart';
import 'package:newsapi/Models/newsModel.dart';
import 'package:newsapi/Utils/component.dart';

Widget NewsCardView(Article article) {
    return Stack(
      children: [
      Container(
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[300]
      ),
      child: Row(
        children: [

          //NewsImage Poster
          //Poster Container
          Container(
            height: double.infinity,
            width: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(article.urlToImage==null?"":article.urlToImage!))
            ),
          ),
          SizedBox(width: 10,),

          Expanded(
            child: Column(
              children: [

                SizedBox(height: 10,),

                Text(article.title!=null?article.title!:"",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,),

                SizedBox(height: 5,),

                Text(article.description!=null?article.description!:"",style: TextStyle(
                    color: Colors.grey[600]
                ),maxLines: 2,
                  overflow: TextOverflow.fade,),
                Spacer(),

                Row(
                  children: [
                    Spacer(),
                    Text(dateFormat.format(article.publishedAt!),style: TextStyle(
                        color: Colors.grey[600]
                    )),
                  ],
                ),
                SizedBox(height: 5,),

              ],
            ),
          )
        ],
      ),
    ),
        Positioned(
          top: 6,
          left: 7,
          child: Container(
            height: 20,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft:Radius.circular(10),
                  bottomRight: Radius.circular(20)
              )
            ),
            child: Center(child: Text(article.source!.name!,style: TextStyle(fontSize: 12),)),
          ),
        )
      ],
    );
  }

