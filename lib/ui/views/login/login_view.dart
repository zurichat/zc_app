import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

// UI CODE ONLY

class LoginView extends StatelessWidget {
 const LoginView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<LoginViewModel>.reactive(
     builder: (context, model, child) => Scaffold(),
     viewModelBuilder: () => LoginViewModel(),
   );
 }
}