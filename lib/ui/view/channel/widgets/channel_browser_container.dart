import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/view/channel/channel_list/channels_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ChannelBrowserContainer extends ViewModelWidget<ChannelListViewModel> {
  final String channelName;
  final String? channelId;
  const ChannelBrowserContainer(
      {required this.channelName, this.channelId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, ChannelListViewModel viewModel) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(hash,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      channelName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: const [
                        Text(YouAreAMember,
                            style: TextStyle(
                                color: Color(0xff00B87C), fontSize: 14)),
                        SizedBox(width: 5),
                        Icon(Icons.circle, color: Color(0xffbebebe), size: 10),
                        SizedBox(width: 5),
                        Text(
                          MembersCount,
                          style:
                              TextStyle(color: Color(0xffbebebe), fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
