import 'package:flutter/material.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/services/connectivity_service.dart';
import 'package:zurichat/ui/shared/colors.dart';

import 'package:zurichat/ui/shared/text_styles.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget(
    this.icon, {
    Key? key,
  }) : super(key: key);
  final IconData icon;

  Stream<bool> get stream => checkConnectivity();
  Stream<bool> checkConnectivity() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 300));
      yield await locator<ConnectivityService>().checkConnection();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: locator<ConnectivityService>().hasConnection,
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.data!) {
          return Container();
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 17,
                color: AppColors.greyishColor,
              ),
              const SizedBox(width: 20),
              Text("Zuri chat is trying to connect",
                  style: AppTextStyle.lightGreySize14),
            ],
          ),
        );
      },
    );
  }
}
