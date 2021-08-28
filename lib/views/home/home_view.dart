import 'dart:ui';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[900],
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background/bga.png"),
                  fit: BoxFit.cover)),
          foregroundDecoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage("assets/logo/zuri_chat_logo.png"),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 340),
                      child: Text('PROJECT NAME: ZURI CHAT APP',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 17))),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('TEAM NAME: SOCRATES',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17))),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                          'Team Socrates would be responsible for building the Zuri Chat Mobile Application.\n \n'
                          'This project is carried out during the HNGi8 and the application would be built with google flutter sdk. \n \n'
                          'The application would interact with plugins created with Go.',
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
