import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';

import 'integrate_viewmodel.dart';

class IntegratePage extends StatelessWidget {
  const IntegratePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IntegrateViewModel>.reactive(
      viewModelBuilder: () => IntegrateViewModel(),
      builder: (context, model, child) {
        return const IntegratePage2();
      },
    ); //
  }
}

class IntegratePage2 extends StatelessWidget {
  const IntegratePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.greenColor,
        title: Text(
          'Integrate',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.whiteColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            // ignore: deprecated_member_use
            child: TextButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.calendar_today),
              label: Text(
                'Holiday-Calender',
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.today),
              label: Text(
                'To-do',
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: Icon(FontAwesomeIcons.chessKnight),
              label: Text(
                'Chess Room',
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.meeting_room),
              label: Text(
                'Meeting Room',
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.notifications_none_sharp),
              label: Text(
                'Notice Board',
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: Icon(FontAwesomeIcons.music),
              label: Text(
                'Music Room',
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.donut_small),
              label: Text(
                'Duty Shift',
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.timer),
              label: Text(
                'Important Deadline',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
