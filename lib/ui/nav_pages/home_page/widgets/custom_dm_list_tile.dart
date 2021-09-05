import 'package:flutter/material.dart';
import 'package:hng/ui/users_profile/user_profile.dart';

import '../../../shared/colors.dart';

class CustomDMListTile extends StatelessWidget {
  final imagelink;
  final userName;
  const CustomDMListTile({
    Key? key,
    this.imagelink,
    this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagelink),
          radius: 20.0,
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProfilePage()));
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
      ],
    );
  }
}
