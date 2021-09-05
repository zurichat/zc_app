import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:hng/ui/users_profile/user_profile.dart';
=======
import 'package:hng/ui/nav_pages/home_page/home_page_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:hng/ui/direct_message/direct_message.dart';
>>>>>>> 2738e2335b98f6a7c501a35afe04e3cf28f6a9d9

import '../../../shared/colors.dart';

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

  @override
<<<<<<< HEAD
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
=======
  Widget build(BuildContext context, HomePageViewModel model) {
    return InkWell(
<<<<<<< HEAD
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DirectMessage(username: userName))),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagelink),
            radius: 20.0,
>>>>>>> 2738e2335b98f6a7c501a35afe04e3cf28f6a9d9
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
=======
>>>>>>> ac0328ffbb9a2c62ca9472475977fa9ba309b80f
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
        Text(
          userName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.greyishColor,
            fontSize: 16,
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
