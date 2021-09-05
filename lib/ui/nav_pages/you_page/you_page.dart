import 'package:flutter/material.dart';

import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/nav_pages/you_page/you_page_viewmodel.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';

class YouPage extends StatelessWidget {
  const YouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<YouPageViewModel>.reactive(
        viewModelBuilder: () => YouPageViewModel(),
        disposeViewModel: true,
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: CustomText(text: "You", fontWeight: FontWeight.bold),
              backgroundColor: AppColors.whiteColor,
              elevation: 0,
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 100,
                            height: 100,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: AppColors.whiteColor,
                              child: Image.asset(
                                viewModel.profileImage,
                                fit: BoxFit.fill,
                              ),
                            )),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomText(
                                  text: viewModel.username,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              CustomText(
                                text: "Active",
                                color: AppColors.greyishColor,
                                fontSize: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5, color: AppColors.greyishColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.chat_bubble_outline_rounded),
                            suffixIcon: Icon(Icons.close)),
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Icon(Icons.notifications_off_outlined,
                            size: 20, color: AppColors.greyishColor),
                        SizedBox(width: 10),
                        CustomText(
                            text: "Pause Notifications", color: Colors.black87),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.circle_outlined,
                            size: 20, color: AppColors.greyishColor),
                        SizedBox(width: 10),
                        CustomText(text: "Go"),
                        Text(
                          "away",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Divider(
                      color: AppColors.greyishColor,
                      thickness: 0.5,
                      height: 1,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.bookmark_outline,
                            color: AppColors.greyishColor),
                        SizedBox(width: 10),
                        Text("Saved Items"),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.person_outline,
                            color: AppColors.greyishColor),
                        SizedBox(width: 10),
                        Text("View Profile"),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.circle_notifications_outlined,
                            color: AppColors.greyishColor),
                        SizedBox(width: 10),
                        Text("Notifications"),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.settings_outlined,
                            color: AppColors.greyishColor),
                        SizedBox(width: 10),
                        Text("Preferences"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
