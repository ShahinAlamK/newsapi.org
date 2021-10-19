import 'package:flutter/material.dart';
import 'package:newsapi/Models/newsModel.dart';
import 'package:newsapi/Utils/Colors.dart';
import 'package:newsapi/Utils/component.dart';

Widget NewsCardView(Article article) {
  return Container(
    height: 125,
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: kCardColor),
    child: Row(
      children: [
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      article.urlToImage == null ? "" : article.urlToImage!))),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                article.title != null ? article.title! : "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    color: kTextColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                article.description != null ? article.description! : "",
                style: TextStyle(color: kText2Color),
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
              Spacer(),
              Row(
                children: [
                  Spacer(),
                  Text(dateFormat.format(article.publishedAt!),
                      style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
