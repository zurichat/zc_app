import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:stacked/stacked.dart';

import 'email_confirmation_viewmodel.dart';

class EmailConfirmationView extends StatelessWidget {
  const EmailConfirmationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmailConfirmationViewModel>.reactive(
        viewModelBuilder: () => EmailConfirmationViewModel(),
        builder: (context, viewModel, child) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(CheckYourMail,
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(ToConfirmEmailAdd,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                            fontSize: 16)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      child: const Text(OpenEmail,
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
                        viewModel.openEmailApp();
                        // openEmailApp(context);
                      },
                    )
                  ]),
            ),
          );
        });
  }
}
