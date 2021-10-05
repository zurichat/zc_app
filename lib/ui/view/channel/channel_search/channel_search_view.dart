import 'package:flutter/material.dart';
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
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: appBarMain()),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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

                const SizedBox(child: SearchResults()),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ChannelSearchViewModel(),
    );
  }
}
