import 'package:flutter/material.dart';

class AppTile extends StatelessWidget {
  final IconData? leading;
  final String? title;
  final String? subtitle;
  final IconData? trailing;
  final Function()? onPressed;

  const AppTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: ListTile(
                title: Text(
                  '$title',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text('$subtitle'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
