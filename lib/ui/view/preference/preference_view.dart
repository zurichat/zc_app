import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/general_widgets/app_tile.dart';
import 'package:hng/ui/view/preference/preference_viewmodel.dart';

import 'package:stacked/stacked.dart';

enum Mode { Sytem_mode, off, on }

class PreferenceView extends StatefulWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  _PreferenceViewState createState() => _PreferenceViewState();
}

class _PreferenceViewState extends State<PreferenceView> {
  Mode _mode = Mode.Sytem_mode;

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return ViewModelBuilder<PreferenceViewModel>.reactive(
              viewModelBuilder: () => PreferenceViewModel(),
              builder: (context, model, child) =>
                  StatefulBuilder(builder: (context, setState) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text("Dark mode"),
                          ),
                          ListTile(
                            title: Text('System default'),
                            leading: Radio(
                              activeColor: Colors.blue,
                              value: Mode.Sytem_mode,
                              groupValue: _mode,
                              onChanged:
                                  // model.switchtoDefaultLight()
                                  (Mode? value) {
                                setState(() {
                                  _mode = value!;
                                  model.switchtoDefaultLight();
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text('Off'),
                            leading: Radio(
                              activeColor: Colors.blue,
                              value: Mode.off,
                              groupValue: _mode,
                              onChanged: (Mode? value) {
                                setState(() {
                                  _mode = value!;
                                  model.switchtoLight();
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text('On'),
                            leading: Radio(
                              activeColor: Colors.blue,
                              value: Mode.on,
                              groupValue: _mode,
                              onChanged: (Mode? value) {
                                setState(() {
                                  _mode = value!;
                                  model.switchtoDark();
                                });
                              },
                              // model.switchtoDefaultLight()
                            ),
                          ),
                        ],
                      ),
                    );
                  }));
        });
  }

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
              AppTile(
                onPressed: () async {
                  await showInformationDialog(context);
                },
                title: 'Dark Mode',
                subtitle: '$Mode',
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
