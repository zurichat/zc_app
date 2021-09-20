import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel/edit_channel/editChannelViewModel.dart';

class TextBox extends StatelessWidget {
  final String hint;
  final EditChannelViewModel model;
  TextBox({
    Key? key,
    required this.hint,
    required this.model,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      child: TextField(
        //maxLines: 9,
        controller: hint == 'Add a topic' ? model.topic : model.description,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.zuriDarkGrey),
          contentPadding: EdgeInsets.fromLTRB(25.0, 16.0, 25.0, 16.0),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
