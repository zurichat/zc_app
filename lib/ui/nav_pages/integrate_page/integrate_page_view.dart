import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/constants/app_strings.dart';
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
        backgroundColor: AppColors.zuriPrimaryColor,
        title: Text(
          Integrate,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.whiteColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            // ignore: deprecated_member_use
            child: TextButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.calendar_today),
              label: const Text(
                Calendar,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.today),
              label: const Text(
                Todo,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: const Icon(FontAwesomeIcons.chessKnight),
              label: const Text(
                Chess,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.meeting_room),
              label: const Text(
                Meeting,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.notifications_none_sharp),
              label: const Text(
                Board,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: const Icon(FontAwesomeIcons.music),
              label: const Text(
                Music,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.donut_small),
              label: const Text(
                Shifts,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.timer),
              label: const Text(
                Deadlines,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
