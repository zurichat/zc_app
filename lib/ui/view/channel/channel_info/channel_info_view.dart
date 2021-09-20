import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';
import 'channel_info_view_model.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/edit_button.dart';
import 'widgets/fifth_section.dart';
import 'widgets/first_section.dart';
import 'widgets/fourth_section.dart';
import 'widgets/second_section.dart';
import 'widgets/sixth_section.dart';
import 'widgets/textstyles.dart';
import 'widgets/third_section.dart';

const _margin = EdgeInsets.only(left: 16.0);

class ChannelInfoView extends StatefulWidget {
  const ChannelInfoView({Key? key}) : super(key: key);

  @override
  _ChannelInfoViewState createState() => _ChannelInfoViewState();
}

class _ChannelInfoViewState extends State<ChannelInfoView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.deepBlackColor));
    return ViewModelBuilder<ChannelInfoViewModel>.reactive(
        onModelReady: (model) {
          model.getChannelInfo();
        },
        viewModelBuilder: () => ChannelInfoViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: customAppBar(context)),
            // ignore: avoid_unnecessary_containers
            body: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FirstSection(
                      model: model,
                    ),
                    /*GestureDetector(
                  onTap: model.navigateToEditChannel,
                  child: const EditButton(),
                ),*/
                    const SecondSection(),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                        margin: _margin,
                        child: Text(
                          'You wont\'t  recieve any messages from a muted channel',
                          style: faintTextStyle(),
                        )),
                    SizedBox(
                      height: 18.0,
                    ),
                    const ThirdSection(),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      margin: _margin,
                      child: Text(
                        'Bookmarks',
                        style: faintTextStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    const FourthSection(),
                    SizedBox(
                      height: 16.0,
                    ),
                    const FifthSection(),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      margin: _margin,
                      child: Text(
                        'Advanced',
                        style: faintTextStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    const SixthSection(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
