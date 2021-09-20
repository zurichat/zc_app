import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:stacked_services/stacked_services.dart';

Widget customAppBar() {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.close_outlined, color: Color(0xFF333333)),
      padding: EdgeInsets.zero,
      onPressed: () {
        NavigationService().navigateTo(Routes.channelPageView);
      },
      ),
      actions: [
      GestureDetector(
      onTap: () {},
      child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.0, vertical: 19),
      child: Icon(
      Icons.star,
      color: AppColors.zuriPrimaryColor,
      )),
      )
      ],
      backgroundColor: Colors.white,
      title: Text(
      'Channel Info',
      style: AppTextStyles.heading7,
      ),
    elevation: 1,
  );
  }
