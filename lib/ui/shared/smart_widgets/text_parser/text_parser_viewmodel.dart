import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:zurichat/utilities/utilities.dart';
import 'package:stacked/stacked.dart';

import '../../shared.dart';
import '../../styles.dart';

//To receive keywords
String keyword = '';

class TextParserViewModel extends BaseViewModel {
// To handle keywords a user would want to get notified about

  final parse = <MatchText>[
    //opens the mail app
    MatchText(
        type: ParsedType.EMAIL,
        style: AppTextStyles.messageTextButton,
        onTap: ((url) {
          launcher("mailto:" + url);
        })),
    //Opens a browser when an HTML is clicked
    MatchText(
        type: ParsedType.URL,
        style: AppTextStyles.messageTextButton,
        onTap: ((url) async {
          var canBrowse = await canLaunch(url);

          if (canBrowse) {
            launcher(url);
          }
        })),
    //passes a number as intent to a dialer
    MatchText(
        type: ParsedType.PHONE,
        style: AppTextStyles.messageTextButton,
        onTap: ((url) {
          launcher("tel:" + url);
        })),
    //To make a text bold using *...*
    MatchText(
        type: ParsedType.CUSTOM,
        pattern: r'(?<=\*)(.*)(\*)',
        style: AppTextStyles.archiveTextStyle),

// To call channels using the hashtag
    MatchText(
        type: ParsedType.CUSTOM,
        pattern: r'\B#+([\w-]+)\b',
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    //To alert user of words set as key words
    MatchText(
        //TODO change keyword to variable set by user
        type: ParsedType.CUSTOM,
        pattern: keyword,
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    //gets '@' mentions
    MatchText(
        type: ParsedType.CUSTOM,
        pattern: r'\B@+([\w]+)\b',
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
  ];
}
