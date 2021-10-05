import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/long_button.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/shared.dart';
import '../../../shared/text_field.dart';
import 'different_email_organization_viewmodel.dart';

class UseDifferentEmailView extends StatelessWidget {
  const UseDifferentEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();

    return ViewModelBuilder<UseDifferentEmailViewModel>.reactive(
      viewModelBuilder: () => UseDifferentEmailViewModel(),
      builder: (context, model, child) => Scaffold(
        // appBar: AppBar(
        //   backgroundColor: AppColors.zuriPrimaryColor,
        //   title: const Text(UseAnotherEmail),
        // ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BorderLessTextField(
                        labelColor: AppColors.inactiveGreyColor,
                        onChanged: (String? value) {
                          model.updateColor();
                          if (value!.isEmpty) {
                            return InputRequired;
                          }
                        },
                        controller: email,
                        label: YourEmail,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        WillSendEmail,
                      ),
                    ],
                  ),
                  const Spacer(),
                  LongButton(
                    onPressed: () {},
                    label: Next,
                    labelColor: model.labelColor(),
                    outlineColor: model.btnColor(),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.nightlife),
          onPressed: () {},
        ),
      ),
    );
  }
}
