//keep Hng Project
import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import '../../../utilities/constants.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/custom_text.dart';
import 'direct_message_viewmodel.dart';

class DirectMessage extends StatelessWidget {
  final username;
  const DirectMessage({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ViewModelBuilder<DirectMessageViewModel>.reactive(
        viewModelBuilder: () => DirectMessageViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                          text: username.toString(), color: Colors.black),
                      const SizedBox(width: 20),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                      )
                    ],
                  ),
                  const CustomText(
                    color: Colors.black,
                    text: 'View details',
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.info, color: Colors.black),
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
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
                              child: Image.asset(
                                dummyUserImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                    ),
                                    const SizedBox(width: 20),
                                    CustomText(
                                      text: username.toString(),
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                const CustomText(
                                  text: 'Software Development',
                                  color: Colors.black,
                                ),
                                const SizedBox(height: 10),
                                CustomText(
                                  text: '''This is the very beginning of your'''
                                      ''' direct message history with @${username.toString()}. '''
                                      '''Only the two of you are in this conversation, and no one else can join it.''',
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                const SizedBox(height: 10),
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
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomText(
                                                      text: username.toString(),
                                                      color: Colors.black),
                                                  const SizedBox(width: 10),
                                                  CustomText(
                                                      text: DateFormat('hh:mm')
                                                          .format(
                                                              DateTime.now()))
                                                ],
                                              ),
                                              const CustomText(
                                                  text:
                                                      'Have you been Promtoed?')
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
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
                            child: CustomTextField(
                              keyboardType: TextInputType.text,
                              inputAction: TextInputAction.send,
                              autoCorrect: false,
                              obscureText: false,
                              onEditingComplete: () =>
                                  model.controller.clearComposing(),
                              controller: model.controller,
                              hintText: 'Write message...',
                              hintStyle: TextStyle(color: Colors.black54),
                            ),

                            //  TextField(
                            //   controller: model.controller,
                            //   decoration: const InputDecoration(
                            //     hintText: 'Write message...',
                            //     hintStyle: TextStyle(color: Colors.black54),
                            //   ),
                            //   onEditingComplete: () =>
                            //       model.controller.clearComposing(),
                            // ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(Icons.camera, color: Colors.black),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.file_upload,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          )
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
