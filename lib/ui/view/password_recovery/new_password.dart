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
    body: SafeArea(child: SingleChildScrollView(
          child: Column(
          children: [
              SizedBox(height: 15),
              Image.asset('assets/zuri_chat_logo.png'),
              SizedBox(height: 20),
              Text('Forgot Password', style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black),),
              SizedBox(height: 10,),
              Text('Your new password must be different from\n'
              'previously used password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14)),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomTextField(
                    keyboardType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                    autoCorrect: false,
                    autoFocus: false,
                obscureText: true,
                labelText: 'Password',
                hintText: 'Enter Password'),),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomTextField(
                  keyboardType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.done,
                  obscureText: true,
                  autoCorrect: false,
                  autoFocus: true,
                  labelText: 'Confirm Password',
                  hintText: 'Re-enter Password'
            ),
          ),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){},
                  child: Text('Continue'),
                  style: ElevatedButton.styleFrom(
                  primary: Color(0xff00B87C),
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  minimumSize: Size(340.0, 48.0),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))
              ),)
              ],),
              ),
          ),)
    );
  }
}