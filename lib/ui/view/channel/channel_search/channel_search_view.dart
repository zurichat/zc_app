import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';

import 'channel_search_view_model.dart';
import 'widgets/search_result.dart';
import 'widgets/textfield_style.dart';

class ChannelSearchPageView extends StatelessWidget {
  final String? channelName;
  const ChannelSearchPageView({Key? key, this.channelName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<ChannelSearchViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          isSearchBar: true,
          hintText: local!.searchPeopleHere,
          searchBarIcon: Icons.arrow_back_ios,
          leadingWidth: true,

          /// THERE ARE OTHER SEARCH BAR OPTIONS IN THIS WIDGET
          /// KINDLY CHECK THROUGH AND USE.
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //TextFIeld
                Container(
                  height: 40,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: TextFormField(
                      // style: textStyling(),
                      decoration: textFormFields(
                          '${local.searchPeopleOn} $channelName')),
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
