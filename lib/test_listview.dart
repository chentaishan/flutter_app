import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/bean/girl_entity.dart';
import 'package:http/http.dart' as http;

//import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter get datas",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: AppHomePage(),
    );
  }
}

class AnimateCard extends StatelessWidget {
  GirlResult animate;

  AnimateCard(this.animate);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(

        children: <Widget>[
          Image.network(
            animate.url,

          ),
          Text(animate.desc),

        ],


//             child:
//             Image(image: NetworkImage(animate.url), height: 100.0,fit: BoxFit.cover,),
      ),
    );
  }
}

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  List movies;

  Future getMovies() async {
    final String url = "http://gank.io/api/data/%E7%A6%8F%E5%88%A9/20/1";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List top = json.decode(response.body)['results'];
      setState(() {
        movies = top.map((json) => GirlResult.fromJson(json)).toList();
      });
    } else {
      print("err code $response.statusCode");
    }
  }

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Animate Movies'),
      ),
      body: movies == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
              child: Scrollbar(

               child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimateCard(movies[index]);
                  },
                ),
              ),
            ),
    );
  }
}
