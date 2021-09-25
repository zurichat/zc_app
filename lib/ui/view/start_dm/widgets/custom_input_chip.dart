import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utilities/utilities.dart';

//CustomInputChip
class CustomInputChip extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Key key;

  CustomInputChip({
    required this.imageUrl,
    required this.name,
    required this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
            child: Material(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFE3EEFF),
                child: InkWell(
                    key: key,
                    hoverColor: Colors.red,
                    splashColor: Colors.red,
                    onTap: () => print('i'),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                          height: 32,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              image: DecorationImage(
                                  image: makeNetworkImage(imageUrl),
                                  fit: BoxFit.cover))),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(name,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w700, fontSize: 16)))
                    ])))));
  }
}
