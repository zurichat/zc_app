import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/view/password_recovery/recovery_viewmodel.dart';

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
              const SizedBox(height: 15),
              Image.asset('assets/zuri_chat_logo.png'),
              const SizedBox(height: 20),
              const Text(
                'Forgot Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Please enter the email used in registering\n'
                'this account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.done,
                  autoCorrect: true,
                  labelText: 'Email Address',
                  hintText: 'Name@gmail.com',
                  obscureText: false,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Continue'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff00B87C),
                    onPrimary: Colors.white,
                    minimumSize: const Size(340.0, 48.0),
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
