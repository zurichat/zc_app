import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/preference/widget/preference_item.dart';
import 'package:stacked/stacked.dart';

import 'language_region_viewmodel.dart';

class LanguageRegionView extends StatefulWidget {
  const LanguageRegionView({Key? key}) : super(key: key);

  @override
  _LanguageRegionViewState createState() => _LanguageRegionViewState();
}

class _LanguageRegionViewState extends State<LanguageRegionView> {
  var val = false;

  onSwitchValueChange(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguageRegionViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                  'Language & Region',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.appBarTextColor,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    doublePreferenceItem('Language', 'English(UK)', () {
                      print('pressed me');
                    }),
                    Divider(),
                    preferenceWithSlider('Set time zone automatically',
                        '(UTC+01:00) West Central Afica', (newVal) {
                      onSwitchValueChange(newVal);
                    }, val),
                    Divider(),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => LanguageRegionViewModel());
  }
}
