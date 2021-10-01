import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/view/channel/channel_search/widgets/search_result.dart';
import 'package:hng/ui/view/channel/channel_search/widgets/search_section.dart';
import 'package:stacked/stacked.dart';

import 'channel_search_view_model.dart';
import 'widgets/search_subsection.dart';

// import 'widgets/appBar.dart';
// import 'widgets/textfield_style.dart';

class ChannelSearchPageView extends StatefulWidget {
  final String channelId;
  final List<ChannelMemberModel> channelMembers;
  late final List<UserSearch> organisationMembers;
  var searchResults;
  late int numberOfFileResults = 0, numberOfMessageResults = 0;

  ChannelSearchPageView(
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
      onModelReady: (ChannelSearchViewModel model) {
        model.fetchOrganisationMembers();
      },
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
                child: TypeAheadField<UserSearch>(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: model.searchController,
                    //
                    cursorColor: Colors.white,
                    onChanged: (pattern) {
                      model.searchUser(pattern);
                    },
                    onSubmitted: (query) {
                      widget.searchResults = model.searchContent(
                        widget.channelId,
                        '',
                        {
                          // 'user_id': '61533895582bef54d04efacd',
                          'content': '$query',
                        },
                      );
                      setState(() {
                        widget.numberOfFileResults = model.fileResults.length;
                        widget.numberOfMessageResults =
                            model.messageResults.length;
                      });
                    },
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    autofocus: true,
                    style: TextStyle(color: Colors.white),
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
                        icon: Icon(
                          Icons.mic_none_outlined,
                          color: const Color(0xFFF4F4F4),
                        ),
                        iconSize: 20,
                        onPressed: () {},
                      ),
                      hintText: 'Search messages, files and users',
                      hintStyle: TextStyle(
                        color: AppColors.greyBackgroundColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    return model.memberSearchResults;
                  },
                  itemBuilder: (context, suggestion) {
                    return SearchResult(
                      userName: suggestion.userName,
                      fullName:
                          '${suggestion.firstName} ${suggestion.lastName}',
                      profileImage: suggestion.imageUrl,
                      onlineStatus: true,
                    );
                  },
                  noItemsFoundBuilder: (context) {
                    return SizedBox();
                  },
                  onSuggestionSelected: (suggestion) {
                    model.parseUserName(
                        userId: suggestion.id!, userName: suggestion.userName!);
                    print('${suggestion.userName}');
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) {
                    //
                    //     }
                    // ));
                    print('Hey, you!');
                  },
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
            widget.searchResults.toString().isEmpty
                ? ZeroSearch(
                    contentName: '${model.searchController.text}',
                    contentType: 'message')
                : DefaultSearch(widget: widget, model: model),
            widget.searchResults.toString().isEmpty
                ? ZeroSearch(
                    contentName: '${model.searchController.text}',
                    contentType: 'file',
                  )
                : Visibility(
                    replacement: DefaultSearch(widget: widget, model: model),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Text(
                                        '${widget.numberOfFileResults} results')
                                  ],
                                ),
                              ),
                              ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    print('Builder:');
                                    return MessageResult(
                                      channelName:
                                          model.fileResults[index].userId!,
                                      imageUrl: '',
                                      message:
                                          model.fileResults[index].content!,
                                      userName: '',
                                      timeStamp:
                                          model.fileResults[index].timestamp!,
                                      date: '',
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(
                                            height: 20,
                                          ),
                                  itemCount: (model.fileResults.length +
                                      model.messageResults.length))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: SearchSection(title: 'Recent searches'),
          ),
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
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: SearchSection(title: 'Narrow your search'),
          ),
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

  ZeroSearch({required this.contentName, required this.contentType, Key? key})
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
          ),
        ),
      ],
    );
  }
}

class MessageResult extends StatelessWidget {
  final String channelName, imageUrl, message, userName, timeStamp, date;

  MessageResult(
      {Key? key,
      required this.channelName,
      required this.imageUrl,
      required this.message,
      required this.userName,
      required this.timeStamp,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(channelName),
          ListTile(
            leading: imageUrl.isEmpty
                ? Image.asset(
                    'assets/images/user.png',
                    fit: BoxFit.cover,
                  )
                : Image.network(imageUrl),
            title: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style:
                        AppTextStyles.archiveTextStyle2.copyWith(fontSize: 14),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Archiving the channel will remover it from the channel list, and close it from all members.',
                      style: AppTextStyles.body2_400.copyWith(fontSize: 14),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
