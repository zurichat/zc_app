import 'package:flutter/material.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import 'channel_search_view_model.dart';
import 'widgets/app_bar_main.dart';
import 'widgets/search_result.dart';
import 'widgets/textfield_style.dart';

class ChannelSearchPageView extends StatefulWidget {
  const ChannelSearchPageView({Key? key}) : super(key: key);

  @override
  _ChannelSearchPageViewState createState() => _ChannelSearchPageViewState();
}

class _ChannelSearchPageViewState extends State<ChannelSearchPageView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelSearchViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriTopBar(
          isSearchBar: true,
          hintText: 'Search for people here',
          searchBarIcon: Icons.arrow_back_ios,
          leadingWidth: true,
          /// THERE ARE OTHER SEARCH BAR OPTIONS IN THIS WIDGET
          /// KINDLY CHECK THROUGH AND USE.
        ),
        body: SafeArea(
          // ignore: avoid_unnecessary_containers
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Column(
                children: [
                  //TextFIeld
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: TextFormField(
                        // style: textStyling(),
                        decoration:
                            textFormFields('Search people on #teamsocrates')),
                  ),

                  // ignore: avoid_unnecessary_containers
                  Container(child: const SearchResults()),
                  // ignore: avoid_unnecessary_containers
                  Container(child: const SearchResults()),
                  // ignore: avoid_unnecessary_containers
                  Container(child: const SearchResults()),
                  // ignore: avoid_unnecessary_containers
                  Container(child: const SearchResults()),
                  // ignore: avoid_unnecessary_containers
                  Container(child: const SearchResults()),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ChannelSearchViewModel(),
    );
  }
}
