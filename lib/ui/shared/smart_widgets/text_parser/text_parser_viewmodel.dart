import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../utilities/enums.dart';
import '../../shared.dart';
import '../../styles.dart';

class TextParserViewModel extends BaseViewModel {
  final parse = <MatchText>[
    MatchText(
        type: ParsedType.EMAIL,
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    MatchText(
        type: ParsedType.URL,
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    MatchText(
        type: ParsedType.PHONE,
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    MatchText(
        type: ParsedType.CUSTOM,
        pattern:
            r'^(?:http|https):\/\/[\w\-_]+(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)',
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    MatchText(
        type: ParsedType.CUSTOM,
        pattern:
            '(---( )?(`)?spoiler(`)?( )?---)\n\n(.*?)\n( )?(---( )?(`)?spoiler(`)?( )?---)',
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    MatchText(
      pattern: r'\[(@[^:]+):([^\]]+)\]',
      style: AppTextStyles.messageTextButton,
      renderText: ({required pattern, required str}) {
        final customRegExp = RegExp(r'\[(@[^:]+):([^\]]+)\]');
        final Match match = customRegExp.firstMatch(str)!;

        return {'display': match[1]!};
      },
      onTap: (_) async {
        final _bottomSheetService = locator<BottomSheetService>();
        await _bottomSheetService.showCustomSheet(
          variant: BottomSheetType.user,
          isScrollControlled: true,
        );
      },
    ),
    MatchText(
        pattern: r'\B#+([\w]+)\b',
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    MatchText(
        pattern: r'lon',
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
  ];
}
