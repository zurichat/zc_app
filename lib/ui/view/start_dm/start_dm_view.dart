import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Direct Message',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            TextButton(
              onPressed: (){},
              child: const Text('Done'),
            )
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
