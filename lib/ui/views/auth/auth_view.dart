import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'auth_viewmodel.dart';

// UI CODE ONLY

class AuthView extends StatelessWidget {
 const AuthView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<AuthViewModel>.reactive(
     builder: (context, model, child) => Scaffold(),
     viewModelBuilder: () => AuthViewModel(),
   );
 }
}