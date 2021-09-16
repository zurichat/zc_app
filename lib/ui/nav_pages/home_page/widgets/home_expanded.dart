import 'package:flutter/material.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/utilities/constants.dart';

import '../home_item_model.dart';

enum HomeListType {
  unreads,
  channels,
  messages,
}

///Expanded List allows list to be expanded and contracted
///if expand is specified as false then the expanded list
///would be fixed with all the children displayed
///
///For example unread has fixed expanded items
class HomeExpandedList extends StatefulWidget {
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
  _HomeExpandedListState createState() => _HomeExpandedListState();
}

class _HomeExpandedListState extends State<HomeExpandedList> {
  @override
  Widget build(BuildContext context) {
    List<HomeItemModel> data = widget.data;
    return Padding(
      padding: const EdgeInsets.fromLTRB(zSideMargin, 0, zSideMargin, 0),
      child: expansionTile(
        children: List.generate(data.length, (i) {
          HomeItemModel item = data[i];
          if (item.type == HomeItemType.channels) {
            return ChannelTextAndIcon(text: item.name ?? '');
          } else {
            return DMTextAndIcon(text: item.name ?? '');
          }
        }),
      ),
    );
  }

  Widget expansionTile({required List<Widget> children}) {
    //Unread messages do cannot expand so no expanded list tile is returned
    if (widget.canExpand) {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: ZuriTextStyle.mediumBold(),
              ),
              Icon(
                Icons.add,
                size: 19,
                color: AppColors.greyishColor,
              ),
            ],
          ),
          children: children,
          tilePadding: EdgeInsets.zero,
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
            widget.title,
            style: ZuriTextStyle.mediumBold(),
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
