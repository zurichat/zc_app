import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberListItem extends StatelessWidget {
  final String avatarUrl;
  final String fullName;
  final String displayName;
  final Key key;
  bool isOnline = false;

  MemberListItem(
      {required this.avatarUrl,
      required this.fullName,
      required this.displayName,
      required this.key,
      this.isOnline = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Container(
              key: key,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(avatarUrl)))),
          SizedBox(width: 18),
          Text(fullName,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              )),
          SizedBox(width: 12),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
                color: isOnline == true ? Color(0xFF007952) : null,
                shape: BoxShape.circle,
                border: isOnline == true
                    ? null
                    : Border.all(color: Color(0xFF424141))),
          ),
          SizedBox(width: 12),
          Text(displayName,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
    );
  }
}
