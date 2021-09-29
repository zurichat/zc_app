import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        appBar: AppBar(
          backgroundColor: AppColors.zuriPrimaryColor,
          title: const Text('Use a different email'),
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
                            return 'Input is required';
                          }
                        },
                        controller: email,
                        hint: 'Enter Email Address',
                        autofocus: true,
                      ),
                      const Text(
                        '''We’ll send you an email '''
                        '''that will instantly sign you in''',
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              // ignore: todo
                              //TODO Change brand colors
                              const Color(0xffBEBEBE),
                            ),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Next',
                              style: AppTextStyles.buttonText,
                            ),
                          ))
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
