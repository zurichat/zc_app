import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../general_widgets/custom_text.dart';
import '../colors.dart';

class SelectThemeDialog extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const SelectThemeDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  _SelectThemeDialogState createState() => _SelectThemeDialogState();
}

class _SelectThemeDialogState extends State<SelectThemeDialog> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int? _currentThemeValue = widget.request.data['currentThemeValue'];

    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        content: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .02, vertical: size.height * .02),
          color: Colors.white,
          width: size.width * .9,
          height: size.height * .4,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child:
                    CustomText(text: 'Dark mode', fontWeight: FontWeight.bold),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                  itemCount: widget.request.data['themes'].length,
                  itemBuilder: (context, index) => Container(
                    child: ListTile(
                      title: CustomText(
                          text: widget.request.data['themes'][index]),
                      leading: Radio(
                        activeColor: AppColors.zuriPrimaryColor,
                        value: index,
                        groupValue: _currentThemeValue,
                        onChanged: (int? value) {
                          setState(() {
                            _currentThemeValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MaterialButton(
                      onPressed: () =>
                          widget.completer(DialogResponse(confirmed: false)),
                      child: Text('CANCEL')),
                  MaterialButton(
                      onPressed: () => widget.completer(DialogResponse(
                          data: _currentThemeValue, confirmed: true)),
                      child: Text('SET')),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
