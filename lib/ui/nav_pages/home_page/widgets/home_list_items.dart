import 'package:flutter/material.dart';
import 'package:hng/general_widgets/easy_container.dart';
import 'package:hng/general_widgets/ripple.dart';
import 'package:hng/general_widgets/svg_icon.dart';
import 'package:hng/ui/nav_pages/home_page/home_item_model.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:stacked/stacked.dart';

import '../../../../general_widgets/easy_container.dart';
import '../../../../general_widgets/ripple.dart';
import '../../../../general_widgets/svg_icon.dart';
import '../../../shared/colors.dart';
import '../../../shared/text_styles.dart';
import '../../../view/channel/channel_view/channel_page_view.dart';
import '../home_item_model.dart';
import '../home_page_viewmodel.dart';

class ThreadTextAndIcon extends StatelessWidget {
  const ThreadTextAndIcon({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return _TextAndIcon(
      text: 'Threads',
      unread: true,

      onTap: onTap,

      // onTap: () {
      //   //TODO threads screen
      //   // Navigate to threads screen
      // },

      icon: SvgIcon(svgIcon: SvgAssets.threads),
    );
  }
}

class AddChannelsTextAndIcon extends StatelessWidget {
  const AddChannelsTextAndIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TextAndIcon(
      text: 'Add channels',
      unread: false,
      onTap: () {
        // Navigate to add channels screens
      },
      icon: SvgIcon(
        svgIcon: SvgAssets.addChannels,
      ),
    );
  }
}

///Specify the noTopPad as true for all the first child
///
//Expanded tile don't allow sizing so we have to decrease
//the top pad of the first child to make it look visually ok
class DMTextAndIcon extends ViewModelWidget<HomePageViewModel> {
  final HomeItemModel data;
  final bool? noTopPad;

  const DMTextAndIcon({
    Key? key,
    required this.data,
    this.noTopPad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, vmodel) {
    bool isUnread = false;
    if (data.unreadCount != null && data.unreadCount != 0) {
      isUnread = true;
    }

    return _TextAndIcon(
      text: data.name ?? '',
      unread: isUnread,
      onTap: () {
        //Navigate to dm screen
        //Todo: pass the navigation Id
        vmodel.navigateToDmUser();
      },
      icon: Container(
        alignment: Alignment.centerLeft,
        child: EasyContainer(
          height: 23,
          width: 23,
          radius: 3,
          color: AppColors.paleGreen,
        ),
      ),
    );
  }
}

///Specify the noTopPad as true for all the first child
///
//Expanded tile don't allow sizing so we have to decrease
//the top pad of the first child to make it look visually ok
class ChannelTextAndIcon extends ViewModelWidget<HomePageViewModel> {
  final HomeItemModel data;
  final bool? noTopPad;
  bool isUnread = false;

  ChannelTextAndIcon({
    Key? key,
    required this.data,
    this.noTopPad,
  }) : super(key: key);

  Widget prefixIcon() {
    if (data.public) {
      if (isUnread) {
        return SvgIcon(
          svgIcon: SvgAssets.hashTag,
          color: Colors.grey[800],
        );
      }

      return SvgIcon(
        svgIcon: SvgAssets.hashTag,
        color: Colors.grey[600],
      );
    }

    if (isUnread) {
      return SvgIcon(
        svgIcon: SvgAssets.locked,
        color: Colors.grey[800],
      );
    }

    return SvgIcon(
      svgIcon: SvgAssets.lockedOutline,
      color: Colors.grey[600],
    );
  }

  @override
  Widget build(BuildContext context, vmodel) {
    if (data.unreadCount != null && data.unreadCount != 0) {
      isUnread = true;
    }

    return _TextAndIcon(
      text: data.name ?? '',
      unread: isUnread,
      icon: prefixIcon(),
      onTap: () {
        //Navigate to channels and pass the channels id
        ChannelPageView.name = data.name ?? '';
        vmodel.navigateToChannelPage();
      },
    );
  }
}

///Specify the noTopPad as true for all the first child
///
///Expanded tile don't allow sizing so we have to remove
///the top pad of the first child to make it look visually ok
///Shows text and Icon together in a Row
class _TextAndIcon extends StatelessWidget {
  final String text;
  final bool unread;
  final Widget icon;
  final Function() onTap;
  // final bool? noTopPad;

  const _TextAndIcon({
    Key? key,
    required this.text,
    required this.unread,
    required this.icon,
    // this.noTopPad,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Expanded tile don't allow sizing so we have to decrease
    //the top pad of the first child to make it look visually ok
    // double topPad = 14;
    // if (noTopPad == true) {
    //   topPad = 5;
    // }

    //Todo: make text thickness change based on the unreads and read
    return Ripple(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
        child: Row(
          children: [
            Container(
              width: 25,
              alignment: Alignment.center,
              child: icon,
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: unread
                  ? ZuriTextStyle.unreadText()
                  : ZuriTextStyle.mediumNormal(
                      color: Colors.grey[600],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
