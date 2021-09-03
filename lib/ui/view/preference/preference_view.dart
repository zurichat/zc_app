import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/preference/language_region_view.dart';
import 'package:hng/ui/view/preference/preference_viewmodel.dart';
import 'package:hng/ui/view/preference/widget/preference_item.dart';
import 'package:stacked/stacked.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreferenceViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.close_outlined, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                  'Preference',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.appBarTextColor,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 0.3,
                      color: Colors.grey,
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        preferenceItem('Language & Region', () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LanguageRegionView()));
                          print('clicked Language & Region');
                        }),
                        Divider(),
                        doublePreferenceItem(
                          'Dark Mode',
                          'System Default',
                          () {
                            print('clicked Dark Mode');
                          },
                        ),
                        Divider(),
                        preferenceItem('Advanced', () {
                          print('clicked Advanced');
                        }),
                        Divider(),
                        preferenceItem('Send Feedback', () {
                          print('clicked Send Feedback');
                        }),
                        Divider(),
                        preferenceItem('Help Center', () {
                          print('clicked Help Center');
                        }),
                        Divider(),
                        preferenceItem('Privacy & licenses', () {
                          print('clicked licenses');
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => PreferenceViewModel());
  }
}
