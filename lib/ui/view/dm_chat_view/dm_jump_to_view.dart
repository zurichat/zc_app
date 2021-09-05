import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hng/general_widgets/custom_channel.dart';
import 'package:hng/general_widgets/custom_channel_stage.dart';
import 'package:hng/general_widgets/custom_user_channel.dart';
import 'package:hng/ui/view/dm_chat_view/dm_jump_to_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DmJumpToView extends StatelessWidget {
  const DmJumpToView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmJumpToViewModel>.reactive(
      viewModelBuilder: () => DmJumpToViewModel(),
      builder: (BuildContext context, DmJumpToViewModel model, Widget? child) =>
          Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 60, 0, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 16, 12),
                      child: Container(
                        height: 40,
                        width: 379,
                        // child: BorderTextField(onChanged: (value) {  }, hint: 'Jump to...', controller: controller,),
                        child: TextField(
                          controller: model.controller,
                          keyboardType: TextInputType.visiblePassword,
                          maxLines: 1,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color(0xFF7B8794),
                                  width: 0.5,
                                  style: BorderStyle.solid),
                            ),
                            prefixIcon: Icon(Icons.arrow_back_ios_outlined),
                            hintText: 'Jump to...',
                            hintStyle: TextStyle(
                              color: Color(0xffA1A9B3),
                              fontSize: 14,
                              height: 3.2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 88,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          CustomUser(
                            image: 'assets/images/Rectangle 1931.png',
                            text: 'Fierce',
                          ),
                          SizedBox(width: 20.5),
                          CustomUser(
                            image: 'assets/images/Rectangle 1931 (1).png',
                            text: 'Abd_Salam',
                          ),
                          SizedBox(
                            width: 20.5,
                          ),
                          CustomUser(
                            image: 'assets/images/Rectangle 1931 (2).png',
                            text: 'Souljaunt',
                          ),
                          SizedBox(
                            width: 20.5,
                          ),
                          CustomUser(
                            image: 'assets/images/Rectangle 1931 (3).png',
                            text: 'Princess',
                          ),
                          SizedBox(
                            width: 20.5,
                          ),
                          CustomUser(
                            image: 'assets/images/Rectangle 1931 (4).png',
                            text: 'Nudis',
                          ),
                          SizedBox(
                            width: 20.5,
                          ),
                          CustomUser(
                            image: 'assets/images/Rectangle 1931 (5).png',
                            text: 'Unknown',
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(height: 32),
                    Container(
                      height: 24,
                      width: 379,
                      child: Text(
                        'Recent',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Container(
                      height: 515,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            CustomChannel(text: 'announcement'),
                            CustomChannelStage(
                                leadingIcon: Icons.lock, text: 'stage4'),
                            CustomUserChannel(
                                image: 'assets/images/Rectangle 138a.png',
                                text: 'OyinkanUA',
                                trailingIcon: Icons.circle_outlined),
                            CustomChannel(text: 'general'),
                            CustomChannelStage(
                                leadingIcon: Icons.lock, text: 'design_stage10'),
                            CustomUserChannel(
                                image: 'assets/images/Rectangle 138a.png',
                                text: 'Abd_Salam',
                                trailingIcon: Icons.circle_outlined),
                            CustomChannel(
                              text: 'announcement',
                            ),
                            CustomChannelStage(
                                leadingIcon: Icons.lock, text: 'stage4'),
                            CustomUserChannel(
                                image: 'assets/images/Rectangle 138a.png',
                                text: 'Blaze',
                                trailingIcon: Icons.circle_outlined),
                            CustomChannel(text: 'announcement'),
                            CustomChannelStage(
                                leadingIcon: Icons.lock, text: 'stage4'),
                            CustomChannel(text: 'announcement')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          ),
            ),
        ),
    );
  }
}

class CustomUser extends StatelessWidget {
  const CustomUser({Key? key, this.image, this.text}) : super(key: key);
  final text;
  final image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            // color: Color(0xFFC4C4C4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    ))),
          ),
          SizedBox(
            height: 8,
          ),
          Container(height: 17, child: Text(text))
        ],
      ),
    );
  }
}




