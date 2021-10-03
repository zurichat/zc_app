import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';

// final drafts = [
//   CustomListTile(),
//   ListTile(
//     title: Text(
//       'Abd_salam',
//       style: AppTextStyles.heading6,
//     ),
//     subtitle: Text(
//       'No wahala',
//       style: AppTextStyles.body1Bold,
//     ),
//     trailing: Text(
//       'August 31 at 9:09 PM',
//       style: AppTextStyles.body2Bold,
//     ),
//   ),
//   ListTile(
//     title: Text(
//       '#random chat',
//       style: AppTextStyles.heading6,
//     ),
//     subtitle: Text(
//       'My oga',
//       style: AppTextStyles.body1Bold,
//     ),
//     trailing: Text(
//       'August 31 at 9:09 PM',
//       style: AppTextStyles.body2Bold,
//     ),
//   ),
// ];

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.text,
    required this.subtitle,
  }) : super(key: key);

  final String text;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: AppTextStyles.heading6,
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.body1Bold,
      ),
      trailing: Text(
        'August 31 at 9:09 PM',
        style: AppTextStyles.body2Bold,
      ),
    );
  }
}
