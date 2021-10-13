import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'start_dm_view.form.dart';
import 'start_dm_viewmodel.dart';
import 'widgets/custom_chip_input.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'message'),
  ],
)
class StartDmView extends StatelessWidget with $StartDmView {
  StartDmView({Key? key}) : super(key: key);

  final _chipKey = GlobalKey<ChipsInputState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartDmViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => StartDmViewModel(),
      builder: (ctx, model, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: ZuriAppBar(
          orgTitle: Text(
            DM,
            style: AppTextStyles.heading4.copyWith(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          leading: Icons.arrow_back_ios,
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
          whiteBackground: true,
          leadingPress: () => model.navigateBack(),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(right: 16.0)),
              onPressed: () {},
              child: Text(
                Done,
                style: AppTextStyles.heading8.copyWith(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                      future: model.userResults,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return CustomChipInput(
                              chipKey: _chipKey, mockResults: snapshot.data);
                        } else {
                          return Container();
                        }
                      }),
                  const Divider(color: Colors.black, thickness: 0.1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
