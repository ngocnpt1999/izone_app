import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izone_app/view/listAlbumView.dart';
import 'package:izone_app/view/listMemberView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
          bottom: TabBar(
            tabs: <Widget>[
              Icon(Icons.account_circle),
              Icon(Icons.music_video),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListMemberView(),
            ListAlbumView(),
          ],
        ),
      ),
    );
  }
}
