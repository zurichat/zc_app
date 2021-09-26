//keep Hng Project
import 'package:flutter/material.dart';
import '../../../utilities/constants.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/custom_text.dart';
import 'direct_message_viewmodel.dart';

class DirectMessage extends StatelessWidget {
  final username;
  DirectMessage({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<DirectMessageViewModel>.reactive(
        viewModelBuilder: () => DirectMessageViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                          text: username.toString(), color: Colors.black),
                      SizedBox(width: 20),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                      )
                    ],
                  ),
                  CustomText(
                    color: Colors.black,
                    text: 'View details',
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.info, color: Colors.black),
                  onPressed: () {},
                )
              ],
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.all(size.height * 0.02),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.15,
                              width: size.height * 0.15,
                              decoration: BoxDecoration(color: Colors.grey),
                              child: Image.asset(
                                dummyUserImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                    ),
                                    SizedBox(width: 20),
                                    CustomText(
                                        text: this.username.toString(),
                                        color: Colors.black),
                                  ],
                                ),
                                CustomText(
                                  text: "Software Development",
                                  color: Colors.black,
                                ),
                                SizedBox(height: 10),
                                CustomText(
                                  text:
                                      "This is the very beginning of your direct message history with @${this.username.toString()}. Only the two of you are in this conversation, and no one else can join it.",
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                SizedBox(height: 10),
                                for (var i = 0; i < 7; i++)
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: size.height * 0.08,
                                            width: size.height * 0.08,
                                            child: Image.asset(
                                              dummyUserImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomText(
                                                      text: this
                                                          .username
                                                          .toString(),
                                                      color: Colors.black),
                                                  SizedBox(width: 10),
                                                  CustomText(
                                                      text: DateFormat('hh:mm')
                                                          .format(
                                                              DateTime.now()))
                                                ],
                                              ),
                                              CustomText(
                                                  text:
                                                      "Have you been Promtoed?")
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: size.height * 0.05,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: model.controller,
                              decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle: TextStyle(color: Colors.black54),
                              ),
                              onEditingComplete: () =>
                                  model.controller.clearComposing(),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          IconButton(
                              icon: Icon(Icons.camera, color: Colors.black),
                              onPressed: () {}),
                          IconButton(
                              icon:
                                  Icon(Icons.file_upload, color: Colors.black),
                              onPressed: () {})
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
