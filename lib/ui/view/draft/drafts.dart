import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';

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
    return InkWell(
      onTap: (){},
      child: ListTile(
        title: Text(
          text,
          style: AppTextStyles.heading6.copyWith(fontSize: 18),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.body1Bold,
        ),
        trailing: Text(
          'August 31 at 9:09 PM',
          style: AppTextStyles.body2Bold,
        ),
      ),
    );
  }
}
