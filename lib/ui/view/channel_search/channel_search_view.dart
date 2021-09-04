import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel_search/widgets/textfield_style.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/services.dart';

import 'channel_search_view_model.dart';
import 'widgets/appBar.dart';
import 'widgets/search_result.dart';

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
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: appBarMain()),
        // ignore: avoid_unnecessary_containers
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
