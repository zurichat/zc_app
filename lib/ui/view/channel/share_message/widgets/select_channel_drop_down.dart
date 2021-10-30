import 'package:flutter/material.dart';
import 'package:zurichat/ui/nav_pages/home_page/home_item_model.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';

class SelectChannelDropDown extends StatelessWidget {
  final List<HomeItemModel> values;
  final ValueChanged<HomeItemModel?>? onChanged;
  final HomeItemModel value;

  const SelectChannelDropDown(
      {Key? key,
      required this.values,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      width: _mediaQuery.width,
      height: 45,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.dividerColor),
          borderRadius: BorderRadius.circular(6)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<HomeItemModel>(
          value: value,
          onChanged: onChanged,
          items: values
              .map((item) => DropdownMenuItem(
                    child: Text(
                      item.name!,
                      style: AppTextStyle.darkGreySize14,
                    ),
                    value: item,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
