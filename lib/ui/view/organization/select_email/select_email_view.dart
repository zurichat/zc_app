import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../utilities/enums.dart';
import '../../../shared/shared.dart';
import 'select_email_viewmodel.dart';

class SelectEmail extends StatelessWidget {
  final OrganizationSwitchMethod method;
  //The users email address can be passed in here from the api or database

  const SelectEmail({Key? key, required this.method}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectEmailViewModel>.nonReactive(
      viewModelBuilder: () => SelectEmailViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            model.getScreenTitle(method),
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.deepBlackColor,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            iconSize: 12,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_outlined),
            color: Colors.black,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 0.0),
          height: 137.0,
          width: 395.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ]),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  model.onEmailTap(method);
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 17.5, top: 24),
                      child: Icon(
                        Icons.email_outlined,
                        size: 20,
                        color: AppColors.deepBlackColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.5, top: 24),
                      child: Text(
                        model.userEmail ?? '',
                        style: const TextStyle(
                            color: AppColors.deepBlackColor, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 57.0, top: 24, bottom: 24),
                child: Divider(
                  thickness: 1,
                  height: 9,
                  color: AppColors.greyishColor,
                ),
              ),
              GestureDetector(
                onTap: () => model.navigateToDifferentEmail(method),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 17.5,
                      ),
                      child: Icon(
                        Icons.email_outlined,
                        size: 20,
                        color: AppColors.deepBlackColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25.5,
                      ),
                      child: Text(
                        model.anotherEmail,
                        style: const TextStyle(
                          color: AppColors.deepBlackColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
