import 'package:flutter/material.dart';

import 'components/reuseable_text_button.dart';
import 'components/reuseable_textfield.dart';

class UseADifferentEmail extends StatefulWidget {
  @override
  _UseADifferentEmailState createState() => _UseADifferentEmailState();
}

class _UseADifferentEmailState extends State<UseADifferentEmail> {
  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 200.0,
        ),
        margin: EdgeInsets.all(19.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReuseableTextField(
                  hintText: "Your email address",
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "We’ll send you an email that will instantly sign you in",
                style: TextStyle(
                    color: Color(0xff424141), fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
            ]),
            const SizedBox(
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReuseableTextButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
