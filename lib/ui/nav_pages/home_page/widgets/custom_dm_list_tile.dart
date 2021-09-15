import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/colors.dart';
import '../home_page_viewmodel.dart';

// import 'package:hng/ui/direct_message/direct_message.dart';

// import '../../../shared/colors.dart';

class CustomDMListTile extends ViewModelWidget<HomePageViewModel> {
  final imagelink;
  final userName;
  final String name;
  const CustomDMListTile({
    Key? key,
    this.imagelink,
    this.name = 'assets/background/status.png',
    this.userName,
  }) : super(key: key);

  showProfileDialog(BuildContext context) {
    // set up the AlertDialog
    final alert = AlertDialog(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      content: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagelink),
            radius: 20.0,
          ),
          const SizedBox(width: 8),
          Text(
            userName,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.greyishColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context, HomePageViewModel model) {
    return InkWell(
      onTap: () {
        model.navigateToDmUser();
      },
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    image: AssetImage(imagelink), fit: BoxFit.cover)),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onLongPress: () {
              showProfileDialog(context);
            },
            child: Text(
              userName,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.greyishColor,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 14,
            height: 14,
            child: Image.asset(name),
          )
        ],
      ),
    );
  }
}
