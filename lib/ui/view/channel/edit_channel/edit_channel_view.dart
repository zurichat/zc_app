import 'package:flutter/material.dart';
import '../../../shared/colors.dart';
import 'package:stacked/stacked.dart';

import './editChannelViewModel.dart';

class EditChannelPageView extends StatelessWidget {
  const EditChannelPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditChannelViewModel>.reactive(
      viewModelBuilder: () => EditChannelViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              InkWell(
                child: Icon(Icons.arrow_back_ios, color: Colors.grey),
                onTap: () {},
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                child: Text(
                  'Edit Channel',
                  style:
                      TextStyle(color: AppColors.deepBlackColor, fontSize: 20),
                ),
                onTap: () {},
              ),
            ]),
            InkWell(
              child: Text(
                'Save',
                style:
                    TextStyle(color: AppColors.zuriPrimaryColor, fontSize: 16),
              ),
              onTap: () {},
            ),
          ]),
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 10),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xffF6F6F6)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10.0),
                    child: Text(
                      'Channel Name',
                      style: TextStyle(color: Color(0xff727272), fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 10.0),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '#teamsocrates',
                        style: TextStyle(
                            color: AppColors.deepBlackColor, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Color(0xffF6F6F6),
            ),
            Container(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 10.0),
                child: Text(
                  "Channel names must be lowercase, without spaces or periods, and can't be longer than 80 characters",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xffF6F6F6)),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 10.0),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Channel Topic',
                        style:
                            TextStyle(color: Color(0xff727272), fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 175,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 0,
                ),
                child: TextField(
                  maxLines: 9,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add a topic",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffF6F6F6),
              ),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 10.0),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Channel Description',
                        style:
                            TextStyle(color: Color(0xff727272), fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
                child: TextField(
                  maxLines: 9,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Set a description",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xffF6F6F6)),
              height: 90,
            ),
          ]),
        ),
      ),
    );
  }
}
