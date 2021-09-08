import 'package:flutter/material.dart';
// import 'package:hng/app/app.locator.dart';
import '../../../general_widgets/custom_textfield.dart';
import 'recovery_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPassViewModel>.reactive(
      viewModelBuilder: () => ForgotPassViewModel(),
      builder: (context, model, child) => Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              Image.asset('assets/zuri_chat_logo.png'),
              SizedBox(height: 20),
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please enter the email used in registering\n'
                'this account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.done,
                  autoCorrect: true,
                  autoFocus: true,
                  labelText: 'Email Address',
                  hintText: 'Name@gmail.com',
                  obscureText: false,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Continue'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff00B87C),
                    onPrimary: Colors.white,
                    minimumSize: Size(340.0, 48.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
