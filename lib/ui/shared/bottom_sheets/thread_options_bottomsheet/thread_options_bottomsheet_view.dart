import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zurichat/ui/shared/bottom_sheets/thread_options_bottomsheet/thread_option_bottomsheet_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../dumb_widgets/menu_item_tile.dart';
import '../../shared.dart';
//import 'thread_options_bottomsheet_viewmodel.dart';
import 'widget/recent_emojis.dart';

class ThreadOptionsBottomSheetView extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const ThreadOptionsBottomSheetView({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThreadOptionsBottomSheetViewModel>.reactive(
      builder: (context, model, child) => DraggableScrollableSheet(
          maxChildSize: 0.97,
          initialChildSize: 0.9,
          minChildSize: 0.5,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: AppColors.whiteColor,
              child: Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const RecentEmojis('😘'),
                        const RecentEmojis('😳'),
                        const RecentEmojis('😭'),
                        const RecentEmojis('🤣'),
                        const RecentEmojis('🤔'),
                        const RecentEmojis('😏'),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.greyBackgroundColor,
                          ),
                          child: const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add_reaction_outlined,
                                size: 25,
                              )),
                        )
                      ],
                    ),
                    const Divider(),
                    MenuItemTile(
                        topBorder: false,
                        icon: SvgPicture.asset(
                          'assets/icons/svg_icons/fluent_navigation-unread-24-regular.svg',
                          color: AppColors.darkGreyColor,
                          width: 18,
                          height: 18,
                        ),
                        text: const Text('Mark unread')),
                    MenuItemTile(
                        topBorder: false,
                        icon: SvgPicture.asset(
                          'assets/icons/svg_icons/gg_time.svg',
                          color: AppColors.darkGreyColor,
                          width: 18,
                          height: 18,
                        ),
                        text: const Text('Remind me')),
                    MenuItemTile(
                        topBorder: false,
                        icon: SvgPicture.asset(
                          'assets/icons/svg_icons/bookmark.svg',
                          color: AppColors.darkGreyColor,
                          width: 18,
                          height: 18,
                        ),
                        text: const Text('Add to saved items')),
                    MenuItemTile(
                        topBorder: false,
                        icon: SvgPicture.asset(
                          'assets/icons/svg_icons/reply_in_thread.svg',
                          color: AppColors.darkGreyColor,
                          width: 18,
                          height: 18,
                        ),
                        text: const Text('Reply in thread')),
                    MenuItemTile(
                        topBorder: false,
                        icon: SvgPicture.asset(
                          'assets/icons/svg_icons/bi_chat-text.svg',
                          color: AppColors.darkGreyColor,
                          width: 18,
                          height: 18,
                        ),
                        text: const Text('Unfollow thread')),
                    MenuItemTile(
                        topBorder: false,
                        icon: SvgPicture.asset(
                          'assets/icons/svg_icons/share.svg',
                          color: AppColors.darkGreyColor,
                          width: 18,
                          height: 18,
                        ),
                        text: const Text('Share message')),
                    MenuItemTile(
                        topBorder: false,
                        icon: SvgPicture.asset(
                          'assets/icons/svg_icons/akar-icons_link-chain.svg',
                          color: AppColors.darkGreyColor,
                          width: 18,
                          height: 18,
                        ),
                        text: const Text('Copy link to message')),
                    MenuItemTile(
                        topBorder: false,
                        icon: SvgPicture.asset(
                          'assets/icons/svg_icons/copy_text.svg',
                          color: AppColors.darkGreyColor,
                          width: 18,
                          height: 18,
                        ),
                        text: const Text('Copy text')),
                    MenuItemTile(
                        topBorder: false,
                        icon: SvgPicture.asset(
                          'assets/icons/svg_icons/pin_conversation.svg',
                          color: AppColors.darkGreyColor,
                          width: 18,
                          height: 18,
                        ),
                        text: const Text('Pin to conversation')),
                    const MenuItemTile(
                        topBorder: false,
                        ico: Icons.poll,
                        text: Text('Turn question into poll')),
                  ],
                ),
              ),
            );
          }),
      viewModelBuilder: () => ThreadOptionsBottomSheetViewModel(),
    );
  }
}
