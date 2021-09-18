import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? labelText;

  static const OUTLINE = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF7B8794),
      width: 0.2,
    ),
  );

  SearchField({this.onChanged, this.labelText});

  @override
  Widget build(BuildContext context) => TextField(
        cursorColor: const Color(0xFF7B8794),
        decoration: InputDecoration(
          labelStyle: GoogleFonts.lato(color: const Color(0xFF727272)),
          contentPadding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
          alignLabelWithHint: true,
          enabledBorder: OUTLINE,
          focusedBorder: OUTLINE,
          labelText: labelText,
          border: OUTLINE,
        ),
        onChanged: onChanged,
        style: GoogleFonts.lato(
          color: const Color(0xFF7B8794),
          fontSize: 16.0,
        ),
      );
}
