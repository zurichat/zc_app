import 'package:flutter/material.dart';

import '../../../../../general_widgets/custom_text.dart';
import '../../../../../models/user_post.dart';

// ignore: must_be_immutable
class Emojis extends StatefulWidget {
  Emojis(
    this.postEmoji, {
    Key? key,
    this.checkReact,
  }) : super(key: key);

  PostEmojis postEmoji;
  final void Function()? checkReact;

  @override
  _EmojisState createState() => _EmojisState();
}

class _EmojisState extends State<Emojis> with SingleTickerProviderStateMixin {
  Animation<double>? _sizeAnimation;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 14, end: 10), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 10, end: 14), weight: 50),
    ]).animate(_controller!);

    if (widget.postEmoji.hasReacted == true) {
      _controller!.forward();
    }
  }

  @override
  void dispose() {
    _controller!.dispose();

    super.dispose();
  }

  void react() {
    widget.postEmoji.hasReacted
        ? _controller!.reverse()
        : _controller!.forward();
    var checkReact = widget.checkReact;
    checkReact!();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: react,
      child: AnimatedBuilder(
          animation: _controller!,
          builder: (BuildContext context, _) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 30,
              decoration: BoxDecoration(
                  color: widget.postEmoji.hasReacted
                      ? Colors.blueAccent
                      : Colors.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${widget.postEmoji.postEmoji}",
                    style: TextStyle(fontSize: _sizeAnimation!.value),
                  ),
                  const SizedBox(width: 5),
                  CustomText(
                    text: widget.postEmoji.postEmojiCount.toString(),
                    fontSize: _sizeAnimation!.value,
                    fontWeight: FontWeight.bold,
                  ),
                  RichText(text: const TextSpan())
                ],
              ),
            );
          }),
    );
  }
}
