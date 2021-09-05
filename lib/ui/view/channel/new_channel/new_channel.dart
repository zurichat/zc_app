import 'package:flutter/material.dart';
import 'package:hng/ui/nav_pages/home_page/home_page_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/ui_helpers.dart';

class NewChannel extends StatefulWidget {
  const NewChannel({Key? key}) : super(key: key);
  @override
  State<NewChannel> createState() => _NewChannelState();
}

class _NewChannelState extends State<NewChannel> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                backgroundColor: AppColors.whiteColor,
                elevation: 2.0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.blackColor,
                  ),
                  onPressed: () {},
                ),
                title: Text(
                  'New Channel',
                  style: AppTextStyles.heading7,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Create',
                      style: AppTextStyles.heading8,
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          ' Channel Name',
                          style: AppTextStyles.heading9,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      //controller: _channelName,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          prefixIcon: RichText(
                            text: TextSpan(
                                text: '  #',
                                style: AppTextStyles.body3Medium,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' e.g team Uhciha',
                                    style: AppTextStyles.body2Medium,
                                  ),
                                ]),
                          ),
                          suffixIcon: Text(
                            '80 ',
                            style: AppTextStyles.body2Medium,
                          )),
                    ),
                  ),
                  UIHelper.verticalSpaceMedium,
                  const Divider(
                    thickness: 2.0,
                  ),
                  SwitchListTile(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    title: Text(
                      'Make channel private',
                      style: AppTextStyles.heading9,
                    ),
                    subtitle: Text(
                      'Private channel can only be viewed or joined by\ninvitation.',
                      style: AppTextStyles.body2Medium,
                    ),
                  ),
                  const Divider(
                    thickness: 2.0,
                  ),
                ]),
              ),
            ));
  }
}
