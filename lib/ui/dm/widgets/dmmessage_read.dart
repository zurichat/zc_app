import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DMMessageRead extends StatelessWidget {
  const DMMessageRead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Color(0xff1A61DB),
              image: DecorationImage(
                image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.Obw6BUTUPdQGToOSCz5t8QHaHC?pid=ImgDet&w=549&h=522&rs=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pappin 4️⃣',
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'Can i have your number?',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1d',
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}