import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/ui/shared/zuri_loader.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/colors.dart';
import 'channels_viewmodel.dart';
import '../widgets/channel_browser_container.dart';

class ChannelList extends StatelessWidget {
  const ChannelList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelListViewModel>.reactive(
      viewModelBuilder: () => ChannelListViewModel(),
      onModelReady: (model) => model.initViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: ZuriAppBar(
          leading: Icons.arrow_back_ios,
          leadingPress: () {},
          title: ChannelBrowser,
          subtitle: model.isBusy ? '0' : model.channelsList.length.toString(),
        ),
        body: SafeArea(
          child: model.isBusy
              ? const ZuriLoader()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.093,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.all(8.8),
                                labelText: SearchChannel,
                                labelStyle:
                                    const TextStyle(color: Color(0xffA1A9B3)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: GroupedListView<dynamic, String>(
                        elements: model.channelsList,
                        groupBy: (elements) => elements.name.toLowerCase()?[0],
                        groupSeparatorBuilder: (String value) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          child: Text(
                            value.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        itemBuilder: (context, element) {
                          return ChannelBrowserContainer(
                              channelName: element.name, channelId: element.id);
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
