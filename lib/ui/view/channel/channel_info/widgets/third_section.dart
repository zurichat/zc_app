import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import 'package:hng/ui/view/channel/channel_members/channel_members_list.dart';
import 'package:stacked/stacked.dart';

import '../../../../shared/colors.dart';
import 'textstyles.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelInfoViewModel>.reactive(
      viewModelBuilder: () => ChannelInfoViewModel(),
      builder: (context, model, child) => Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 5, right: 5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          color: AppColors.whiteColor,
          elevation: 1.0,
          child: Column(
            children: [
              SizedBox(
                height: 18.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    child: SvgPicture.asset(
                      'assets/channel_page/members.svg',
                      width: 24,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        // model.navigatoToMembersList();
                      },
                      child: Text(
                        'Members (5)',
                        style: nameStyle(),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
                color: AppColors.deepBlackColor.withOpacity(0.5),
                indent: 65,
              ),
              SizedBox(
                height: 18.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    child: SvgPicture.asset(
                      'assets/channel_page/add_people.svg',
                      width: 24,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Container(
                    child: Text(
                      'Add People',
                      style: nameStyle(),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
                color: AppColors.deepBlackColor.withOpacity(0.5),
                indent: 65,
              ),
              SizedBox(
                height: 18.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    child: SvgPicture.asset(
                      'assets/channel_page/plugins.svg',
                      width: 24,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Container(
                    child: Text(
                      'Plugins (1)',
                      style: nameStyle(),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
                color: AppColors.deepBlackColor.withOpacity(0.5),
                indent: 65,
              ),
              SizedBox(
                height: 18.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    child: SvgPicture.asset(
                      'assets/channel_page/phone.svg',
                      width: 20,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Container(
                    child: Text(
                      'Start a call',
                      style: nameStyle(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
