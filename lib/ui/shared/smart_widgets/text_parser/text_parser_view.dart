import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:stacked/stacked.dart';

import 'text_parser_viewmodel.dart';

class TextParser extends StatelessWidget {
  const TextParser(this.text, {Key? key}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TextParserViewModel>.reactive(
      builder: (context, model, child) => ParsedText(
        text: "$text",
        style: AppTextStyle.lightGreySize14.copyWith(
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
        parse: model.parse,
      ),
      viewModelBuilder: () => TextParserViewModel(),
    );
  }
}
