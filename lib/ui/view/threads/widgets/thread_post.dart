import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/colors.dart';

class ThreadPost extends StatelessWidget {
  const ThreadPost(this.userThreadPost, {Key? key})
      : super(
          key: key,
        );

  final UserThreadPost userThreadPost;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("${userThreadPost.userImage}")),
                    )),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: CustomText(
                              text: '${userThreadPost.displayName}',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.looks_6,
                            color: Colors.blue,
                            size: 18,
                          ),
                          SizedBox(width: 2),
                          CustomText(
                            text: "${userThreadPost.lastSeen}",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RichText(text: userThreadPost.message),
                      SizedBox(height: 10),
                      // Wrap(
                      //   spacing: 5,
                      //   runSpacing: 5,
                      //   children: [
                      //     for (Widget item in userThreadPost.postEmojis ?? [])
                      //       item
                      //   ],
                      // ),
                      SizedBox(height: 15),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
