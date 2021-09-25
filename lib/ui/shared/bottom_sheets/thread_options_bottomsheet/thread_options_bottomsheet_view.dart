import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../general_widgets/menu_item_tile.dart';
import '../../shared.dart';
import 'thread_options_bottomsheet_viewmodel.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<ThreadOptionsBottomSheetViewModel>.reactive(
      builder: (context, model, child) => DraggableScrollableSheet(
          maxChildSize: 0.97,
          initialChildSize: 0.9,
          minChildSize: 0.5,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                          child: const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add_reaction_outlined,
                                size: 25,
                              )),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.greyBackgroundColor,
                          ),
                        )
                      ],
                    ),
                    Divider(),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.message,
                        text: Text('Mark unread')),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.access_time_rounded,
                        text: Text('Remind me')),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.bookmark_border_outlined,
                        text: Text('Add to saved items')),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.message,
                        text: Text('Reply in thread')),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.message,
                        text: Text('Unfollow thread')),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.forward_outlined,
                        text: Text('Share message')),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.message,
                        text: Text('Copy link to message')),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.copy_rounded,
                        text: Text('Copy text')),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.message,
                        text: Text('Pin to conversation')),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.message,
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
