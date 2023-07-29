

import 'package:flutter/material.dart';

import '../modals/artcile_model.dart';


class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        appBar: AppBar(
          title: Text(article.title??""),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  //let's add the height

                  image: article.urlToImage!=null? DecorationImage(
                      image: NetworkImage(article.urlToImage??"https://www.dreamstime.com/photos-images/news.html"), fit: BoxFit.cover):null,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: article.urlToImage==null?Center(child: Text("No image Found")):null,
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  article.source?.name??"",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                article.description??"",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),

    );
  }
}
