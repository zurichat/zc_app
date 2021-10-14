import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../general_widgets/custom_text.dart';
import '../colors.dart';

class SelectThemeDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const SelectThemeDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? _currentThemeValue = request.data['currentThemeValue'];

    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                        text: DarkMode, fontWeight: FontWeight.bold))),
            ListView.builder(
              shrinkWrap: true,
              itemCount: request.data['themes'].length,
              itemBuilder: (context, index) => ListTile(
                title: CustomText(text: request.data['themes'][index]),
                leading: Radio(
                  activeColor: AppColors.zuriPrimaryColor,
                  value: index,
                  groupValue: _currentThemeValue,
                  onChanged: (int? value) {
                    setState(() => _currentThemeValue = value);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () => completer(
                    DialogResponse(confirmed: false),
                  ),
                  child: const Text(Cancel),
                ),
                MaterialButton(
                  onPressed: () => completer(
                    DialogResponse(data: _currentThemeValue, confirmed: true),
                  ),
                  child: const Text(Apply),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      );
    });
  }
}
