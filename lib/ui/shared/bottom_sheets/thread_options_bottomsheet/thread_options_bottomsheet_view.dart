import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/general_widgets/menu_item_tile.dart';
import 'package:hng/ui/shared/bottom_sheets/thread_options_bottomsheet/widget/recent_emojis.dart';
import 'package:hng/ui/shared/shared.dart';

import 'package:stacked_services/stacked_services.dart';

import 'package:stacked/stacked.dart';

import 'thread_options_bottomsheet_viewmodel.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                        RecentEmojis("😘"),
                        RecentEmojis("😳"),
                        RecentEmojis("😭"),
                        RecentEmojis("🤣"),
                        RecentEmojis("🤔"),
                        RecentEmojis("😏"),
                        Container(
                          height: 50,
                          width: 50,
                          child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add_reaction_outlined,
                                size: 25,
                              )),
                          decoration: BoxDecoration(
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
                        text: Text("Mark unread")),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.access_time_rounded,
                        text: Text("Remind me")),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.bookmark_border_outlined,
                        text: Text("Add to saved items")),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.message,
                        text: Text("Reply in thread")),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.message,
                        text: Text("Unfollow thread")),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.forward_outlined,
                        text: Text("Share message")),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.message,
                        text: Text("Copy link to message")),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.copy_rounded,
                        text: Text("Copy text")),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.message,
                        text: Text("Pin to conversation")),
                    MenuItemTile(
                        topBorder: false,
                        icon: Icons.message,
                        text: Text("Turn question into poll")),
                  ],
                ),
              ),
            );
          }),
      viewModelBuilder: () => ThreadOptionsBottomSheetViewModel(),
    );
  }
}
