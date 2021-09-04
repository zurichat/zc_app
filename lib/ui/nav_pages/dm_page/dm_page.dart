import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/ui/shared/colors.dart';

import 'package:stacked/stacked.dart';

import 'dm_page_viewmodel.dart';
import 'widgets/dmmessage_read.dart';
import 'widgets/dmmessage_unread.dart';


class DmPage extends StatelessWidget {
  const DmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmPageViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xff00B87C),
            title: Text(
              "Direct Messages",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: false,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: AppColors.whiteColor,
            ),
            backgroundColor: AppColors.greenColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Jump to...',
                      hintStyle: GoogleFonts.lato(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DMMessageUnread(),
                  SizedBox(
                    height: 20,
                  ),
                  DMMessageRead(),
                  SizedBox(
                    height: 20,
                  ),
                  DMMessageUnread(),
                  SizedBox(
                    height: 20,
                  ),
                  DMMessageRead(),
                  SizedBox(
                    height: 20,
                  ),
                  DMMessageUnread(),
                  SizedBox(
                    height: 20,
                  ),
                  DMMessageRead(),
                  SizedBox(
                    height: 20,
                  ),
                  DMMessageRead(),
                  SizedBox(
                    height: 20,
                  ),
                  DMMessageRead(),
                  SizedBox(
                    height: 20,
                  ),
                  DMMessageUnread(),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => DmPageViewModel(),
    );
  }
}




