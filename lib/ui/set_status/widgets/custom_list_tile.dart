import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
   required this.leading,
   required this.title,
   this.trailing = const SizedBox(),
  }) : super(key: key);

  final Widget leading;
  final Widget title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: MediaQuery.of(context).size.width * 0.02,
      leading: IconButton(onPressed: () {}, icon: leading),
      title:  title,
      trailing: Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
                child: GestureDetector(
                  onTap: () {},
                  child: trailing,
                ),
              )
    );
  }
}