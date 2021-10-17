import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/utilities/enums.dart';

import '../../../shared/shared.dart';
import '../../../shared/text_field.dart';
import 'different_email_organization_viewmodel.dart';

class UseDifferentEmailView extends StatelessWidget {
   final OrganizationSwitchMethod method;
  const UseDifferentEmailView({Key? key, required this.method}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();

    return ViewModelBuilder<UseDifferentEmailViewModel>.reactive(
      viewModelBuilder: () => UseDifferentEmailViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.zuriPrimaryColor,
          title: const Text(UseAnotherEmail),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(19.8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BorderTextField(
                        onChanged: (String? value) {
                          if (value!.isEmpty) {
                            return InputRequired;
                          }
                        },
                        controller: email,
                        hint: EnterEmail,
                        autofocus: true,
                      ),
                      const Text(
                        WillSendEmail,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            //TODO Change brand colors
                            const Color(0xffBEBEBE),
                          ),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            Next,
                            style: AppTextStyle.longButtonStyle,
                          ),
                        ),
                      )
                    ],
                  )
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
