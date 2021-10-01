import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../channel_info/widgets/textstyles.dart';

class SearchResult extends StatelessWidget {
  final String? profileImage, userName, fullName;
  bool? onlineStatus;

  SearchResult(
      {this.profileImage,
      required this.userName,
      required this.fullName,
      this.onlineStatus,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        child: profileImage!.isEmpty
            ? Image(image: AssetImage('assets/images/user.png'))
            : Image(image: NetworkImage(profileImage!)),
      ), //user Image
      // subtitle: Container(
      //   child: Positioned(
      //     top: 5,
      //     left: 36,
      //     child: Container(
      //       height: 4,
      //       width: 4,
      //       color: AppColors.zuriPrimaryColor,
      //     ),
      //   ),
      // ), //online Dot
      title: Text(
        '$userName',
        style: nameStyle(),
      ),
      trailing: Text(
        '$fullName',
        style: nameStyle(),
      ), //userName
    );
  }
}
