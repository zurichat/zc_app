import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:stacked/stacked.dart';

import '../../shared.dart';
import '../../styles.dart';

class TextParserViewModel extends BaseViewModel {
// To handle keywords a user would want to get notified about
  String keyword = '';

  final parse = <MatchText>[
    //opens the mail app
    MatchText(
        type: ParsedType.EMAIL,
        style: AppTextStyles.messageTextButton,
        onTap: ((url) {
          //launch("mailto:" + url);
        })),
    //Opens a browser when an HTML is clicked
    MatchText(
        type: ParsedType.URL,
        style: AppTextStyles.messageTextButton,
        onTap: ((url) async {
          //var canBrowse = await canLaunch(url);

          //if (canBrowse) {
          // launch(url);
          //}
        })),
    //passes a number as intent to a dialer
    MatchText(
        type: ParsedType.PHONE,
        style: AppTextStyles.messageTextButton,
        onTap: ((url) {
          // launch("tel:" + url);
        })),
    //To make a text bold using *...*
    MatchText(
        type: ParsedType.CUSTOM,
        pattern: r'(?<=\*)(.*)(\*)',
        style: AppTextStyles.archiveTextStyle),

// To call channels using the hashtag
    MatchText(
        pattern: r'\B#+([\w]+)\b',
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    //To alert user of words set as key words
    MatchText(
        //TODO change keyword to variable set by user

        pattern: 'keyword',
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    //gets '@' mentions
    MatchText(
        pattern: r'\B@+([\w]+)\b',
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
  ];
}
