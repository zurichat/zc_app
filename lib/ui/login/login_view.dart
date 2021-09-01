import 'package:flutter/material.dart';
import '../../app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../general_widgets/custom_text.dart';
import '../../services/local_storage_services.dart';
import 'login_viewmodel.dart';

// ignore: use_key_in_widget_constructors
class LoginView extends StatelessWidget {
  final text = locator<SharedPreferenceLocalStorage>();
  final navigator = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(text: 'Local Storage Tesing Page'),
                const SizedBox(height: 16),
                CustomText(
                  text: '''The previous value you entered is: '''
                      ''' ${text.getString('userInput') ?? 'No input yet'}''',
                ),

                // CustomText(text: text.getString('Kindly Type in a value')!),
                const SizedBox(height: 8),
                TextField(
                  controller: model.userText,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      model.saveUserData();
                      navigator.navigateTo(Routes.homeView);
                    },
                    child: const CustomText(text: 'Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
