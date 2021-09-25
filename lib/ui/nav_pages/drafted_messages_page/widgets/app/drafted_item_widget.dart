import 'package:flutter/material.dart';

class DraftedItemWidget extends StatelessWidget {
  const DraftedItemWidget({
    this.username,
    this.message,
    this.time,
    Key? key,
  }) : super(key: key);
  final username, message, time;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: kPadding - 16),
      //padding: const EdgeInsets.all(10.0),
      /*decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
            offset: Offset(0, 2),
          ),
        ],
      ),*/
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        username,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  message,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
            //height: 3.0,
          ),
        ],
      ),
    );
  }
}
