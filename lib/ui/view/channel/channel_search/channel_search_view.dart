import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/view/channel/channel_search/widgets/search_section.dart';
import 'package:stacked/stacked.dart';

import 'channel_search_view_model.dart';
import 'widgets/search_subsection.dart';

// import 'widgets/appBar.dart';
// import 'widgets/textfield_style.dart';

class ChannelSearchPageView extends StatefulWidget {
  final String channelId;
  final List<ChannelMemberModel> channelMembers;

  const ChannelSearchPageView(
      {Key? key, required this.channelId, required this.channelMembers})
      : super(key: key);

  @override
  _ChannelSearchPageViewState createState() => _ChannelSearchPageViewState();
}

class _ChannelSearchPageViewState extends State<ChannelSearchPageView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelSearchViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: _tabController.index == 0
            ? AppColors.greyBackgroundColor
            : Colors.white,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 140,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF00B87C),
          title: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Color(0xFF009B69),
                ),
                margin: EdgeInsets.only(bottom: 24),
                child: TextField(
                  controller: model.searchController,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      icon: model.searchController.text.isEmpty
                          ? const Icon(
                              Icons.search,
                              color: const Color(0xFFF4F4F4),
                            )
                          : const Icon(
                              Icons.arrow_back_ios_outlined,
                              color: const Color(0xFFF4F4F4),
                            ),
                      iconSize: 20,
                      onPressed: () => model.searchController.text.isEmpty
                          ? null
                          : model.navigateBack(),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.mic_none_outlined),
                      onPressed: () {},
                    ),
                    hintText: 'Search messages, files and users',
                    hintStyle: TextStyle(
                      color: AppColors.greyBackgroundColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
                kToolbarHeight), // AppBar().preferredSize.height
            child: Container(
              color: Colors.white,
              child: TabBar(
                automaticIndicatorColorAdjustment: false,
                controller: _tabController,
                indicatorColor: AppColors.zuriPrimaryColor,
                tabs: [
                  Tab(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Messages',
                        style: AppTextStyles.kTabTitleTextStyle,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Files',
                        style: AppTextStyles.kTabTitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            DefaultSearch(widget: widget, model: model),
            ZeroSearch(contentName: 'designers', contentType: 'file'),
          ],
        ),
      ),
      viewModelBuilder: () => ChannelSearchViewModel(),
    );
  }
}

class DefaultSearch extends StatelessWidget {
  const DefaultSearch({
    Key? key,
    required this.widget,
    required this.model,
  }) : super(key: key);

  final ChannelSearchPageView widget;
  final ChannelSearchViewModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SearchSubSection(
            leadingIcon: Icons.people,
            title: 'Browse people',
            trailingIcon: null,
            onTap: () {},
          ),
          SearchSubSection(
            leadingIcon: CupertinoIcons.money_pound,
            title: 'Browse channels',
            trailingIcon: null,
            onTap: () {},
          ),
          SearchSection(title: 'Recent searches'),
          SearchSubSection(
            leadingIcon: Icons.history_sharp,
            title: 'in:#project-socrates Search in Channel',
            trailingIcon: Icons.close,
            onTap: () {},
          ),
          SearchSubSection(
            leadingIcon: Icons.history_sharp,
            title: 'has:stage8',
            trailingIcon: Icons.close,
            onTap: () {},
          ),
          SearchSection(title: 'Narrow your search'),
          SearchSubSection(
            leadingIcon: Icons.add_box_outlined,
            subtitle: 'E.g. #project-socrates',
            title: 'in',
            trailingIcon: null,
            onTap: () {},
          ),
          SearchSubSection(
            leadingIcon: Icons.add_box_outlined,
            subtitle: 'E.g. Adediwura Emmanuel',
            title: 'from:',
            trailingIcon: null,
            onTap: () {},
          ),
          SearchSubSection(
            leadingIcon: Icons.add_box_outlined,
            subtitle: 'E.g. star',
            title: 'has:',
            trailingIcon: null,
            onTap: () {},
          ),
          SearchSubSection(
            leadingIcon: Icons.add_box_outlined,
            subtitle: 'Ex: 08-31-2021',
            title: 'after:',
            trailingIcon: null,
            onTap: () {},
          ),
          SearchSubSection(
            leadingIcon: Icons.add_box_outlined,
            subtitle: 'E.g. me',
            title: 'to:',
            trailingIcon: null,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ZeroSearch extends StatelessWidget {
  final String contentName, contentType;

  const ZeroSearch(
      {required this.contentName, required this.contentType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'No $contentType result(s) found for \"$contentName\"',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.greyColor,
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                // model.text.isEmpty
                // //TODO Change to brand colors
                // ? const Color(0xffBEBEBE) :
                AppColors.zuriPrimaryColor,
              ),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Container(
                alignment: Alignment.center,
                // height: 16,
                width: 140,
                child: Text(
                  'Start new search',
                  style: AppTextStyles.buttonText,
                ),
              ),
            )),
      ],
    );
  }
}
