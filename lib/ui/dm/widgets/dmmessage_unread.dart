import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DMMessageUnread extends StatelessWidget {
  const DMMessageUnread({
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
                    'https://th.bing.com/th/id/OIP.QHG-JO3iI1u8VQjSkpO0HwHaLH?pid=ImgDet&rs=1'),
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
                'OyinkaUA 4️⃣',
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'You: Have you been promoted?',
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
                '1m',
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              SizedBox(height: 5),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffB8003C),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
