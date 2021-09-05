import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/custom_text.dart';
import '../../shared/colors.dart';
import '../../shared/shared.dart';
import 'widget_components/customtiles.dart';
import 'you_page_viewmodel.dart';

class YouPage extends StatelessWidget {
  const YouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => YouPageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.greenColor,
          // Here we take the value from the
          // MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("You"),
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
                      Container(
                          width: 100,
                          height: 100,
                          child: CircleAvatar(
                              radius: 10,
                              backgroundColor: AppColors.whiteColor,
                              child: Image(
                                image: AssetImage(
                                    'assets/background/appBarLogo.png'),
                              ))),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'Oscar',
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
                      border:
                          Border.all(width: 0.5, color: AppColors.greyishColor),
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
                        "Zuri",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Active",
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.messenger_outline_sharp, size: 18),
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(500, 20)),

                  // padding: MaterialStateProperty.all(EdgeInsets.only(right: 250)),

                  // elevation: MaterialStateProperty.all(3) ,
                  // backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Icon(Icons.messenger_outline_sharp),
                    SizedBox(
                      width: 50,
                    ),
                    Text("What\'s your status? ",
                        style: TextStyle(color: Colors.grey[700])),
                    SizedBox(
                      width: 110,
                    ),
                  ],
                ),
              ),
              ProfileButton(
                icon: Icons.notifications_off_outlined,
                label: "Notifications",
                onPressed: () {},
              ),
              ProfileButton(
                icon: Icons.circle,
                label: "Set yourself as ",
                onPressed: () {},
              ),
              Divider(
                color: Colors.grey,
              ),
              ProfileButton(
                icon: Icons.bookmark_outline_outlined,
                label: "Saved Item",
                onPressed: () {},
              ),
              ProfileButton(
                icon: Icons.account_circle_outlined,
                label: "View Profile",
                onPressed: () {},
              ),
              ProfileButton(
                icon: Icons.trip_origin,
                label: "Notification",
                onPressed: () {},
              ),
              ProfileButton(
                icon: Icons.settings,
                label: "Preferences",
                onPressed: () {},
              ),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
