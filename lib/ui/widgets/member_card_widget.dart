import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MemberListItem extends StatefulWidget {
  final String avatarUrl;
  final String fullName;
  final String displayName;
  final Key key;
  final String status;
  bool isOnline = false;

  MemberListItem(
      {required this.avatarUrl,
      required this.fullName,
      required this.displayName,
      required this.key,
      this.isOnline = false,
      required this.status});

  @override
  _MemberListItemState createState() => _MemberListItemState();
}

class _MemberListItemState extends State<MemberListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Container(
              key: widget.key,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(widget.avatarUrl)))),
          SizedBox(width: 1),
          Flexible(
            child: Text(widget.fullName,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
          ),
          SizedBox(width: 12),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
                color: widget.isOnline == true ? Color(0xFF007952) : null,
                shape: BoxShape.circle,
                border: widget.isOnline == true
                    ? null
                    : Border.all(color: Color(0xFF424141))),
          ),
          SizedBox(width: 18),
          Text(widget.displayName,
              
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
          SizedBox(width: 12),
          Text(widget.status,
              
              ),
        ],
      ),
    );
  }
}
