import 'package:flutter/material.dart';
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
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .05, vertical: size.height * .02),
      color: Colors.white,
      width: size.width * .9,
      height: size.height * .3,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Default skin tone',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => completer(DialogResponse(data: '1')),
                icon: Image.asset('assets/icons/emojiHands/1.png'),
              ),
              IconButton(
                  onPressed: () => completer(DialogResponse(data: '2')),
                  icon: Image.asset('assets/icons/emojiHands/2.png')),
              IconButton(
                  onPressed: () => completer(DialogResponse(data: '3')),
                  icon: Image.asset('assets/icons/emojiHands/3.png'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => completer(DialogResponse(data: '4')),
                  icon: Image.asset('assets/icons/emojiHands/4.png')),
              IconButton(
                  onPressed: () => completer(DialogResponse(data: '5')),
                  icon: Image.asset('assets/icons/emojiHands/5.png')),
              IconButton(
                  onPressed: () => completer(DialogResponse(data: '6')),
                  icon: Image.asset('assets/icons/emojiHands/6.png'))
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
