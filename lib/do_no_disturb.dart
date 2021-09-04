import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_app/Home.dart';

void main() {
  runApp(MaterialApp(
    title: "Exploring Widgets",

    home: Scaffold(
      body: getListView(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

Widget getListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Image.asset("images/icons8-x-40.png"),
        title: Text(
          "Do not disturb",
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          "Save",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black26),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          children: <Widget>[
            Text(
              "Turn off",
              style: TextStyle(color: Colors.red, fontSize: 20.0),
            ),
          ],
        ),
      ),
      ListTile(
        leading: Image.asset("images/icons8-round-30.png"),
        title: Text(
          "30 mins",
          style: TextStyle(fontSize: 15.0, color: Colors.black87),
        ),
      ),
      ListTile(
        leading: Image.asset("images/icons8-0-percent-30.png"),
        title: Text(
          "1 hour",
          style: TextStyle(fontSize: 15.0, color: Colors.black87),
        ),
      ),
      ListTile(
        leading: Image.asset("images/icons8-0-percent-30.png"),
        title: Text(
          "2 hour",
          style: TextStyle(fontSize: 15.0, color: Colors.black87),
        ),
      ),
      ListTile(
        leading: Image.asset("images/icons8-0-percent-30.png"),
        title: Text(
          "Until tomorrow",
          style: TextStyle(fontSize: 15.0, color: Colors.black87),
        ),
      ),
      ListTile(
        leading: Image.asset("images/icons8-0-percent-30.png"),
        title: Text(
          "Custom",
          style: TextStyle(fontSize: 15.0, color: Colors.black87),
        ),
      ),
    ],
  );
  return listView;
}
