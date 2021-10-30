import 'package:flutter/material.dart';
import 'package:zurichat/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/constants/app_constants.dart';
import 'package:zurichat/utilities/enums.dart';

import '../home_item_model.dart';

///Expanded List allows list to be expanded and contracted
///if expand is specified as false then the expanded list
///would be fixed with all the children displayed
///
///For example unread has fixed expanded items
class HomeExpandedList extends StatelessWidget {
  final bool canExpand;
  final String title;
  final List<HomeItemModel> data;

  const HomeExpandedList({
    Key? key,
    this.canExpand = true,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(zSideMargin, 0, zSideMargin, 0),
      child: HomeExpansionTile(
        title: title,
        canExpand: canExpand,
        children: getExpansionList(),
      ),
    );
  }

  List<Widget> getExpansionList() {
    List<Widget> expansionList = List.generate(data.length, (i) {
      HomeItemModel item = data[i];
      if (item.type == HomeItemType.channels) {
        return ChannelTextAndIcon(
          data: data[i],
          channelId: data[i].id,
        );
      } else {
        return DMTextAndIcon(data: data[i]);
      }
    });

    if (title == 'Channels') {
      expansionList.add(const AddChannelsTextAndIcon());
    } else if (title == 'Direct Messages') {
      expansionList.add(const AddTeammatesTextAndIcon());
    }

    return expansionList;
  }
}

class HomeExpansionTile extends StatelessWidget {
  const HomeExpansionTile({
    Key? key,
    required this.canExpand,
    required this.children,
    required this.title,
  }) : super(key: key);

  final bool canExpand;
  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    //Unread messages do cannot expand so no expanded list tile is returned
    if (canExpand) {
      return Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: AppColors.textDark,
          ),
        ),
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).textTheme.caption!.color,
                ),
              ),
            ],
          ),
          children: children,
          tilePadding: EdgeInsets.zero,
          collapsedTextColor: AppColors.textLight10,
          initiallyExpanded: true,
          iconColor: AppColors.greyishColor,
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: AppTextStyle.darkGreySize16Bold,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ],
    );
  }
}
