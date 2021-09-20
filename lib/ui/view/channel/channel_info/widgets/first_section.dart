import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';

import '../../../../shared/colors.dart';
import 'edit_button.dart';
import 'textstyles.dart';

class FirstSection extends StatelessWidget {
  final ChannelInfoViewModel model;
  const FirstSection({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          color: AppColors.whiteColor,
          elevation: 1.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      child: Text(
                        '#teamsocrates',
                        style: headerStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Container(
                      child: Text(
                        'Description',
                        style: nameStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Text(
                        model.channelDescription,
                        style: descriptionStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Container(
                      child: Text(
                        'Mark created this channel on August 13.',
                        style: faintTextStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Container(
                      child: Text(
                        'Topic',
                        style: nameStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Text(
                        'Creating the zuri main app',
                        style: descriptionStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColors.borderColor,
              ),
              GestureDetector(
                onTap: () => model.navigateToEditChannel(),
                child: EditButton(model: model),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
