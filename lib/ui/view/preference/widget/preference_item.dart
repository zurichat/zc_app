import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

Widget preferenceItem(
  String item,
  var action,
) {
  return InkWell(
    onTap: action,
    child: Container(
      padding: EdgeInsets.only(left: 16),
      height: 50,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: AppColors.textColor,
          ),
        ),
      ),
    ),
  );
}

Widget doublePreferenceItem(
  String item,
  String subText,
  var action,
) {
  return InkWell(
    onTap: action,
    child: Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              subText,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget preferenceWithSlider(
  String item,
  String subText,
  var switchAction,
  bool switchState,
) {
  return Container(
    height: 60,
    child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                subText,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: AppColors.textGrey,
                ),
              ),
            ],
          ),
          new Spacer(),
          Switch(
            value: switchState,
            onChanged: switchAction,
          )
        ],
      ),
    ),
  );
}
