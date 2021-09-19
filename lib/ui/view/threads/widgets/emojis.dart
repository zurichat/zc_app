import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';

// ignore: must_be_immutable
class Emojis extends StatefulWidget {
  Emojis({
    Key? key,
    this.emoji,
    this.number = 1,
  }) : super(key: key);
  int number;
  final IconData? emoji;
  @override
  _EmojisState createState() => _EmojisState();
}

class _EmojisState extends State<Emojis> with SingleTickerProviderStateMixin {
  Animation<double>? _sizeAnimation;
  AnimationController? _controller;
  bool hasReacted = false;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 14, end: 10), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 10, end: 14), weight: 50),
    ]).animate(_controller!);

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          hasReacted = true;
          widget.number += 1;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          hasReacted = false;
          widget.number -= 1;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () =>
            hasReacted ? _controller!.reverse() : _controller!.forward(),
        child: AnimatedBuilder(
            animation: _controller!,
            builder: (BuildContext context, _) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                height: 30,
                decoration: BoxDecoration(
                    color: hasReacted ? Colors.blueAccent : Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.emoji,
                      color: Colors.yellow,
                      size: _sizeAnimation!.value,
                    ),
                    SizedBox(width: 5),
                    CustomText(
                      text: widget.number.toString(),
                      fontSize: _sizeAnimation!.value,
                      fontWeight: FontWeight.bold,
                    ),
                    RichText(text: TextSpan())
                  ],
                ),
              );
            }));
  }
}
