import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/view/password_recovery/recovery_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NewPassView extends StatelessWidget {
  const NewPassView({Key? key}) : super(key: key);

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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    'Your new password must be different from\n'
                    'previously used password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14)),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: CustomTextField(
                    keyboardType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                    autoCorrect: false,
                    obscureText: true,
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: CustomTextField(
                    keyboardType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.done,
                    obscureText: true,
                    autoCorrect: false,
                    labelText: 'Confirm Password',
                    hintText: 'Re-enter Password',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Continue'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff00B87C),
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    minimumSize: const Size(340.0, 48.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
