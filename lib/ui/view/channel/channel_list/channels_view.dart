import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hng/constants/app_strings.dart';
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
        //TODO Change to brand Colors
        backgroundColor: const Color(0xfff4f4f4),
        appBar: AppBar(
          leadingWidth: 16,
          centerTitle: false,
          backgroundColor: AppColors.whiteColor,
          leading: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 15,
            ),
          ),
          titleSpacing: 0,
          title: ListTile(
            minLeadingWidth: 10,
            title: const Text(
              ChannelBrowser,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text(
              model.isBusy ? '0' : model.channelsList.length.toString(),
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ),
        body: SafeArea(
          child: model.isBusy
              ? const Center(child: CircularProgressIndicator())
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
