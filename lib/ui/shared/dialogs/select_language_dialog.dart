import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';

import '../colors.dart';

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
    Size size = MediaQuery.of(context).size;
    int? _currentValue = widget.request.data['currentValue'];

    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        content: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .02, vertical: size.height * .02),
          color: Colors.white,
          width: size.width * .9,
          height: size.height * .8,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  SelectLang,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ),
              const Divider(thickness: 2),
              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                  itemCount: widget.request.data['languages'].length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(widget.request.data['languages'][index]),
                    leading: Radio(
                      activeColor: AppColors.zuriPrimaryColor,
                      value: index,
                      groupValue: _currentValue,
                      onChanged: (int? value) {
                        setState(() {
                          _currentValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MaterialButton(
                      onPressed: () =>
                          widget.completer(DialogResponse(confirmed: false)),
                      child: const Text(Cancel)),
                  MaterialButton(
                      onPressed: () => widget.completer(
                          DialogResponse(data: _currentValue, confirmed: true)),
                      child: const Text(Ok)),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
