
import 'package:flutter/material.dart';
import 'package:news_app/modals/artcile_model.dart';
import 'package:http/http.dart'as http;

import 'api_services/api_service.dart';
import 'custumWidgets/customListTile.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("News App", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold

            )),
            backgroundColor: Colors.white,
          ),

       body: FutureBuilder
         (
         future: client.getArticle(),
         builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
           if (snapshot.connectionState==ConnectionState.done && snapshot.hasData) {
             List<dynamic>? articles = snapshot.data;
             return ListView.builder(
               itemCount: articles?.length,
               itemBuilder: (context, index) =>
                   customListTile(articles?[index], context),
             );

           }
           else
           {
             return Center(
               child: CircularProgressIndicator(),
             );
           }
         },
       ),

      ),
    );


  }
}

