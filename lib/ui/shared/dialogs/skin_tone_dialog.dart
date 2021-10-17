import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:stacked_services/stacked_services.dart';

class SkinToneDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const SkinToneDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: _SkinToneDialogContent(request: request, completer: completer));
  }
}

class _SkinToneDialogContent extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _SkinToneDialogContent(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .05, vertical: size.height * .02),
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkThemePrimaryColor
          : AppColors.whiteColor,
      width: size.width * .9,
      height: size.height * .3,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              DefSkinTone,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    completer(DialogResponse(data: Emoji1DialogData)),
                icon: Image.asset(Emoji1),
              ),
              IconButton(
                  onPressed: () =>
                      completer(DialogResponse(data: Emoji2DialogData)),
                  icon: Image.asset(Emoji2)),
              IconButton(
                  onPressed: () =>
                      completer(DialogResponse(data: Emoji3DialogData)),
                  icon: Image.asset(Emoji3))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () =>
                      completer(DialogResponse(data: Emoji4DialogData)),
                  icon: Image.asset(Emoji4)),
              IconButton(
                  onPressed: () =>
                      completer(DialogResponse(data: Emoji5DialogData)),
                  icon: Image.asset(Emoji5)),
              IconButton(
                  onPressed: () =>
                      completer(DialogResponse(data: Emoji6DialogData)),
                  icon: Image.asset(Emoji6))
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
