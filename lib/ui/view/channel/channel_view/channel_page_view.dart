import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/view/channel/channel_view/widgets/custom_appbar.dart';
import 'package:hng/ui/view/channel/channel_view/widgets/custom_row.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.router.dart';
import '../../../../models/static_user_model.dart';
import '../../../shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';

import 'channel_page_viewmodel.dart';

class ChannelPageView extends StatelessWidget {
  const ChannelPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usermodel = [
      StaticUserModel(
        userName: 'Clutch',
        joinInfo: 'Joined #teamsocrates',
        time: '12:30pm',
        userimg: 'assets/channel_page/female.png',
      ),
      StaticUserModel(
        userName: 'Ali',
        joinInfo: 'Joined #teamsocrates',
        time: '12:30pm',
        userimg: 'assets/channel_page/femaleuser.png',
      )
    ];
    return ViewModelBuilder<ChannelPageViewModel>.reactive(
      //this parameter allows us to reuse the view model to persist the state
      //disposeViewModel: false,
      //initialise the view model only once
      //initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => ChannelPageViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBars(
            channelName: '#teamsocrates',
            numberOfMembers: '128',
            model: viewModel,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                channelName('#teamsocrates'),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: channelInfo('@mark',
                      ' created this channel on August 12, 2021. This is the very beginning of the #teamsocrates channel.'),
                ),
                const SizedBox(height: 20),
                CustomRow(model: viewModel),
                const SizedBox(height: 20),
                dateBuilder(context),
                const SizedBox(height: 7),
                ListTile(
                  leading: Image.asset('assets/channel_page/female.png'),
                  title: Row(
                    children: [
                      Text(
                        'Clutch',
                        style: AppTextStyles.nameStyle,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '12:30pm',
                        style: AppTextStyles.smallText,
                      ),
                    ],
                  ),
                  subtitle: const Text('Joined #teamsocrates'),
                ),
                ListTile(
                  leading: Image.asset('assets/channel_page/femaleuser.png'),
                  title: Row(
                    children: [
                      Text(
                        'Ali',
                        style: AppTextStyles.nameStyle,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '12:30pm',
                        style: AppTextStyles.smallText,
                      ),
                    ],
                  ),
                  subtitle: const Text('Joined #teamsocrates'),
                ),
              ],
            ),
          ),
          bottomSheet: sendMessageArea(),
        );
      },
    );
  }
}

Padding channelName(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 200),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.header6,
        )
      ],
    ),
  );
}

Container channelInfo(String text, String nexttext) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 1.0, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.clip,
              text: TextSpan(
                text: text,
                style: AppTextStyles.bodySmall,
                children: <TextSpan>[
                  TextSpan(
                    text: nexttext,
                    style: AppTextStyles.body1Grey,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

sendMessageArea() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    height: 70,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        const Expanded(
          child: TextField(
            decoration: InputDecoration.collapsed(
              //border: InputBorder.,
              hintText: 'Message #teamsocrates',
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.ZuriGrey,
              ),
            ),
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        const ImageIcon(AssetImage('assets/channel_page/light.png')),
        const SizedBox(width: 22),
        const Icon(CupertinoIcons.camera),
        const SizedBox(width: 22),
        const ImageIcon(AssetImage('assets/channel_page/attach.png')),
      ],
    ),
  );
}

dateBuilder(BuildContext context) {
  return Row(children: <Widget>[
    const Expanded(
        child: Divider(
      endIndent: 1,
      color: AppColors.borderColor,
    )),
    Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Container(
        width: 50,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            'today',
            //textAlign: TextAlign.center,
            style: AppTextStyles.smallTextGrey,
          ),
        ),
      ),
    ),
    const Expanded(
        child: Divider(
      indent: 1,
      color: AppColors.borderColor,
    )),
  ]);
}
