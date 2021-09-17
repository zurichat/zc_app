import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/colors.dart';
import '../../../shared/styles.dart';
import '../../../shared/ui_helpers.dart';
import 'new_channel_viewmodel.dart';

class NewChannel extends StatefulWidget {
  const NewChannel({Key? key}) : super(key: key);
  @override
  State<NewChannel> createState() => _NewChannelState();
}

class _NewChannelState extends State<NewChannel> {
  bool _value = false;
  int _maxLength = 80;
  bool _hasError = false;
  var _borderColor = AppColors.borderColor;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewChannelViewModel>.reactive(
      viewModelBuilder: () => NewChannelViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 2.0,
          leading: IconButton(
            icon: ImageIcon(
              AssetImage('assets/icons/back_arrow_icon.png'),
              size: 12.0,
            ),
            onPressed: () {},
          ),
          title: Text(
            'New Channel',
            style: AppTextStyles.heading7,
          ),
          actions: <Widget>[
            TextButton(
              style:
                  TextButton.styleFrom(padding: EdgeInsets.only(right: 16.0)),
              onPressed: () {},
              child: Text(
                'Create',
                style: AppTextStyles.heading8.copyWith(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 19, bottom: 10, top: 24),
                  child: Row(
                    children: [
                      Text(
                        ' Channel Name',
                        style: AppTextStyles.heading9,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.only(left: 12, right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: _borderColor,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '# ',
                        style: AppTextStyles.body2Medium.copyWith(
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          //controller: _channelName,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(80)
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'e.g team-uchiha',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFA1A9B2),
                            ),
                          ),

                          onChanged: (val) {
                            setState(() {
                              validateInput(val);
                              _maxLength = 80 - val.length;
                            });
                          },
                        ),
                      ),
                      Text(
                        '${_maxLength}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA1A9B2),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Visibility(
                    visible: _hasError,
                    child: Column(
                      children: [
                        UIHelper.verticalSpaceSmall,
                        Text(
                          'Error message',
                          style: AppTextStyles.body2Medium.copyWith(
                            color: AppColors.redColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Channel names must be lowercase, without spaces or\nperiods, and can\'nt be longer than 80 characters',
                    style: AppTextStyles.body2Medium,
                  ),
                ),
                UIHelper.verticalSpaceMedium,
                const Divider(
                  thickness: 0.5,
                  color: Color(0xFF7B8794),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16.0, bottom: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Make channel private',
                        style: AppTextStyles.heading9.copyWith(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                          height: 2.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'A private channel can only be viewed or joined',
                            style: AppTextStyles.body2Medium,
                          ),
                          SizedBox(
                            height: 20,
                            child: Switch(
                              inactiveTrackColor: Color(0XFFEBEBEB),
                              activeColor: AppColors.zuriPrimaryColor,
                              value: _value,
                              onChanged: (val) {
                                setState(() {
                                  _value = val;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      //add this part here because the Row widget won't align with just the upper part of the text when there's a new line
                      Text(
                        'by invitation.',
                        style: AppTextStyles.body2Medium,
                      )
                    ],
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: Color(0xFF7B8794),
                ),
              ]),
        ),
      ),
    );
  }

  void validateInput(String input) {
    final reg = RegExp(".*?[A-Z\\s\.].*");
    if (reg.hasMatch(input)) {
      updateView(true);
    } else {
      updateView(false);
    }
  }

  void updateView(bool validate) {
    if (validate) {
      setState(() {
        _hasError = validate;
        _borderColor = AppColors.redColor;
      });
    } else {
      setState(() {
        _hasError = validate;
        _borderColor = AppColors.borderColor;
      });
    }
  }
}
