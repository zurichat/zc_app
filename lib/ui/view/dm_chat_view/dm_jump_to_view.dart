import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../general_widgets/custom_channel.dart';
import '../../../general_widgets/custom_channel_stage.dart';
import '../../../general_widgets/custom_user.dart';
import '../../../general_widgets/custom_user_channel.dart';
import 'dm_jump_to_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DmJumpToView extends StatelessWidget {
  const DmJumpToView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmJumpToViewModel>.reactive(
      onModelReady: (model) => model.fetchUsers(),
      disposeViewModel: false,
      viewModelBuilder: () => DmJumpToViewModel(),
      builder: (BuildContext context, DmJumpToViewModel model, Widget? child) =>
          Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            model.userSearch.isEmpty ? SizedBox() : Center(child: CircularProgressIndicator(),),
            GestureDetector(
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
                        // child: BorderTextField(onChanged: (value)
                        //{  }, hint: 'Jump to...', controller: controller,),
                        child: TextField(
                          controller: model.controller,
                          keyboardType: TextInputType.visiblePassword,
                          maxLines: 1,
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color(0xFF7B8794),
                                  width: 0.5,
                                  style: BorderStyle.solid),
                            ),
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
                    const SizedBox(height: 12),
                    Container(
                      height: 88,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          const CustomUser(
                            image: 'assets/images/Rectangle 1931.png',
                            text: 'Fierce',
                          ),
                          const SizedBox(width: 20.5),
                          const CustomUser(
                            image: 'assets/images/Rectangle 1931 (1).png',
                            text: 'Abd_Salam',
                          ),
                          const SizedBox(width: 20.5),
                          const CustomUser(
                            image: 'assets/images/Rectangle 1931 (2).png',
                            text: 'Souljaunt',
                          ),
                          const SizedBox(width: 20.5),
                          const CustomUser(
                            image: 'assets/images/Rectangle 1931 (3).png',
                            text: 'Princess',
                          ),
                          const SizedBox(width: 20.5),
                          const CustomUser(
                            image: 'assets/images/Rectangle 1931 (4).png',
                            text: 'Nudis',
                          ),
                          const SizedBox(width: 20.5),
                          const CustomUser(
                            image: 'assets/images/Rectangle 1931 (5).png',
                            text: 'Unknown',
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      height: 24,
                      width: 379,
                      child: const Text(
                        'Recent',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const CustomChannel(text: 'announcement'),
                            const CustomChannelStage(
                                leadingIcon: Icons.lock, text: 'stage4'),
                            const CustomUserChannel(
                                image: 'assets/images/Rectangle 138a.png',
                                text: 'OyinkanUA',
                                trailingIcon: Icons.circle_outlined),
                            const CustomChannel(text: 'general'),
                            const CustomChannelStage(
                              leadingIcon: Icons.lock,
                              text: 'design_stage10',
                            ),
                            const CustomUserChannel(
                              image: 'assets/images/Rectangle 138a.png',
                              text: 'Abd_Salam',
                              trailingIcon: Icons.circle,
                              iconColor: Color(0xff007952),
                            ),
                            const CustomChannel(text: 'announcement'),
                            const CustomChannelStage(
                                leadingIcon: Icons.lock, text: 'stage4'),
                            const CustomUserChannel(
                              image: 'assets/images/Rectangle 138a.png',
                              text: 'Blaze',
                              trailingIcon: Icons.circle,
                              iconColor: Color(0xff007952),
                            ),
                            const CustomChannel(text: 'announcement'),
                            const CustomChannelStage(
                                leadingIcon: Icons.lock, text: 'stage4'),
                            const CustomChannel(text: 'announcement'),
                            const CustomChannelStage(
                                leadingIcon: Icons.lock, text: 'stage4'),
                            const CustomUserChannel(
                              image: 'assets/images/Rectangle 138a.png',
                              text: 'Blaze',
                              trailingIcon: Icons.circle,
                              iconColor: Color(0xff007952),
                            ),
                            const CustomChannel(text: 'announcement'),
                            const CustomChannelStage(
                                leadingIcon: Icons.lock, text: 'stage4'),
                            const CustomChannel(text: 'announcement')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
