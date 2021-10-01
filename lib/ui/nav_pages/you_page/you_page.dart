import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/custom_text.dart';
import '../../shared/colors.dart';
import '../../shared/shared.dart';
import 'you_page_viewmodel.dart';

// ignore: todo
// TODO - NOT EXTRACTING STRINGS IN THIS FILE
//  Seems to be duplicated, NOT IN USE

class YouPage extends StatelessWidget {
  const YouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<YouPageViewModel>.reactive(
        viewModelBuilder: () => YouPageViewModel(),
        disposeViewModel: true,
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.zuriPrimaryColor,
                // Here we take the value from the
                // MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text(
                  You,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.whiteColor),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                height: 50,
                                child: Image(
                                  image: AssetImage('assets/images/naisu.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    CustomText(
                                        text: 'Oscar',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    CustomText(
                                      text: Active,
                                      color: AppColors.greyishColor,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5, color: AppColors.greyishColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: StatusHintText,
                              prefixIcon:
                                  Icon(Icons.chat_bubble_outline_rounded),
                              suffixIcon: Icon(Icons.close)),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: const [
                          Icon(Icons.notifications_off_outlined,
                              size: 20, color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          CustomText(text: PauseNotifs, color: Colors.black87),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Icon(Icons.circle_outlined,
                              size: 20, color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          CustomText(text: SetStatusText),
                          Text(
                            Away,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(
                        color: AppColors.greyishColor,
                        thickness: 0.5,
                        height: 1,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Icon(Icons.bookmark_outline,
                              color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          Text(SavedItems),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Icon(Icons.person_outline,
                              color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          Text(ViewProfile),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Icon(Icons.circle_notifications_outlined,
                              color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          Text(Notifs),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Icon(Icons.settings_outlined,
                              color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          Text(Preferences),
                        ],
                      ),
                    ]),
              ),
            ));
  }
}
