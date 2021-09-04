import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:io'; 
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_appavailability/flutter_appavailability.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

 void openEmailApp(BuildContext context){
     try{
         AppAvailability.launchApp(Platform.isIOS ? "message://" : "com.google.android.gm").then((_) {
                 print("App Email launched!");
               }).catchError((err) {
                 // ignore: deprecated_member_use
                 Scaffold.of(context).showSnackBar(SnackBar(
                     content: Text("App Email not found!")
                 ));
                 print(err);
               });
     } catch(e) {
       // ignore: deprecated_member_use
       Scaffold.of(context).showSnackBar(SnackBar(content: Text("Email App not found!")));
     }
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Check your mail',
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "To confirm your email address, tap the button in the email we sent to lukeskylwalker@gmai.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    child: Text('Open email app',
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor:HexColor('#00B87C'),
                      onSurface: HexColor('#00B87C'),
                    ),
                    onPressed: () {
                      print('Pressed');
                      openEmailApp(context);
                    },
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
