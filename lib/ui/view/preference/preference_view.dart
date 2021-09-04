import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/view/preference/preference_viewmodel.dart';

import 'package:stacked/stacked.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreferenceViewModel>.reactive(
      viewModelBuilder: () => PreferenceViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Preferences'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  model.switchtoDefaultLight();
                },
                child: Text(
                  'Default Light',
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () {
                  model.switchtoLight();
                },
                child: Text(
                  'Light',
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () {
                  model.switchtoDark();
                },
                child: Text(
                  'Dark',
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () {
                  model.switchtoKimbieDark();
                },
                child: Text(
                  'Kimbie Dark',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.nightlife),
          onPressed: () {
            model.switchtoKimbieDark();
          },
        ),
      ),
    );
  }
}
