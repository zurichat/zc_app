import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../utilities/constants/colors.dart';

class SelectLanguageDialog extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const SelectLanguageDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  _SelectLanguageDialogState createState() => _SelectLanguageDialogState();
}

class _SelectLanguageDialogState extends State<SelectLanguageDialog> {
  @override
  Widget build(BuildContext context) {
    int? currentValue = widget.request.data['currentValue'];

    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    SelectLang,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                )),
            const Divider(thickness: 2),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.request.data['languages'].length,
              itemBuilder: (context, index) => ListTile(
                title: Text(widget.request.data['languages'][index]),
                leading: Radio(
                  activeColor: AppColors.zuriPrimaryColor,
                  value: index,
                  groupValue: currentValue,
                  onChanged: (int? value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                ),
              ),
            ),
            const Divider(thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                    onPressed: () =>
                        widget.completer(DialogResponse(confirmed: false)),
                    child: const Text(Cancel)),
                MaterialButton(
                    onPressed: () => widget.completer(
                        DialogResponse(data: currentValue, confirmed: true)),
                    child: const Text(Ok)),
              ],
            ),
          ],
        ),
      );
    });
  }
}
