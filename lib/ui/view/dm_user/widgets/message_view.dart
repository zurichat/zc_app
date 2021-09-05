import 'package:flutter/material.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/Message.dart';
import 'package:intl/intl.dart';


class MessageView extends StatelessWidget {

  final Message _message;
  MessageView(this._message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 16),
      child: Row(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/avatar.png",
                width: 40.0, height: 40.0),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(_message.sender.username,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight:
                                FontWeight.w700)),
                        SizedBox(width: 4.35),
                        Text(_formatTime(_message.time),
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight:
                                FontWeight.w400))
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text(_message.message,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight:
                            FontWeight.w400))
                  ],
                ),
              ),
            )
          ]),
    );
  }

  String _formatTime(DateTime time) => DateFormat.Hm()
      .format(time);
}
