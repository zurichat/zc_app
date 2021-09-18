import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/ui/shared/search_bar.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import '../home_page/home_page.dart';
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
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: AppColors.zuriPrimaryColor,
            title: Text(
              "Direct Messages",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.whiteColor),
            ),
            centerTitle: false,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: AppColors.whiteColor,
            ),
            backgroundColor: AppColors.zuriPrimaryColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () => model.navigateToJumpToScreen(),
                      child: searchBar()),
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
