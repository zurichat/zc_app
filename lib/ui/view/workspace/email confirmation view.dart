import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: unused_import

import 'email confirmation viewmodel.dart';

void main() => runApp(MyApp());
final EmailViewModel emailViewModel = EmailViewModel();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Check your mail',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                const Text('''
To confirm your email address, tap the button in the email we sent to lukeskylwalker@gmail.com''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  child: const Text('Open email app',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: HexColor('#00B87C'),
                    onSurface: HexColor('#00B87C'),
                  ),
                  onPressed: () {
                    print('Pressed');
                    emailViewModel.openEmailApp(context);
                    // openEmailApp(context);
                  },
                )
              ]),
        ),
      ),
    );
  }
}
