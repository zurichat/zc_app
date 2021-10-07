import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../constants/app_strings.dart';
import '../../../shared/shared.dart';
import '../../../shared/zuri_appbar.dart';
import 'terms_and_conditions_view_model.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TermsAndConditionsViewModel>.nonReactive(
        viewModelBuilder: () => TermsAndConditionsViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: ZuriAppBar(
              leading: Icons.arrow_back,
              leadingColor: AppColors.whiteColor,
              orgTitle: Text(
                TnC2.toUpperCase(),
                style: const TextStyle(color: AppColors.whiteColor),
              ),
              leadingPress: () => model.popNavigation(),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Text(
                '''Lorem ipsum dolor sit amet, consectetur'''
                ''' adipiscing elit. Tincidunt dolor mi viverra felis '''
                '''viverra diam. Diam lorem orci maecenas dictum amet, '''
                '''massa est vitae mattis. Bibendum aenean ut eleifend et '''
                '''feugiat mi est quisque. Urna nibh blandit tincidunt'''
                ''' venenatis, facilisi feugiat tristique egestas. Sollicitudin'''
                ''' non, viverra egestas risus pulvinar sed id. Dolor'''
                ''' tempus a in diam sit et nibh et consectetur. Cras'''
                ''' ullamcorper turpis aliquet velit pellentesque. Quam '''
                '''nunc, quisque turpis morbi viverra tortor. Amet a id '''
                '''eget euismod quis.\n'''
                '''\nConsectetur adipiscing elit. Tincidunt dolor mi viverra'''
                ''' felis viverra diam. Diam lorem orci maecenas dictum amet,'''
                ''' massa est vitae mattis. Bibendum aenean ut eleifend et '''
                '''feugiat mi est quisque. Urna nibh blandit tincidunt'''
                ''' venenatis, facilisi feugiat tristique egestas. '''
                '''Sollicitudin non, viverra egestas risus pulvinar'''
                ''' sed id. Dolor tempus a in diam sit et nibh et '''
                '''consectetur. Cras ullamcorper turpis aliquet velit'''
                ''' pellentesque. Quam nunc, quisque turpis morbi '''
                '''viverra tortor. Amet a id eget euismod quis.'''
                '''Bibendum aenean ut eleifend et feugiat mi est'''
                ''' quisque. Urna nibh blandit tincidunt venenatis,'''
                ''' facilisi feugiat tristique egestas. Sollicitudin'''
                ''' non, viverra egestas risus pulvinar sed id. Dolor'''
                ''' tempus a in diam sit et nibh et consectetur. Cras '''
                '''ullamcorper turpis aliquet velit pellentesque. Quam '''
                '''nunc, quisque turpis morbi viverra tortor. Amet a '''
                '''id eget euismod quis.\n'''
                '''\nLorem ipsum dolor sit amet, consectetur'''
                ''' adipiscing elit. Tincidunt dolor mi viverra felis '''
                '''viverra diam. Diam lorem orci maecenas dictum amet, '''
                '''massa est vitae mattis. Bibendum aenean ut eleifend et '''
                '''feugiat mi est quisque. Urna nibh blandit tincidunt'''
                ''' venenatis, facilisi feugiat tristique egestas. Sollicitudin'''
                ''' non, viverra egestas risus pulvinar sed id. Dolor'''
                ''' tempus a in diam sit et nibh et consectetur. Cras'''
                ''' ullamcorper turpis aliquet velit pellentesque. Quam '''
                '''nunc, quisque turpis morbi viverra tortor. Amet a id '''
                '''eget euismod quis.\n'''
                '''\nConsectetur adipiscing elit. Tincidunt dolor mi viverra'''
                ''' felis viverra diam. Diam lorem orci maecenas dictum amet,'''
                ''' massa est vitae mattis. Bibendum aenean ut eleifend et '''
                '''feugiat mi est quisque. Urna nibh blandit tincidunt'''
                ''' venenatis, facilisi feugiat tristique egestas. '''
                '''Sollicitudin non, viverra egestas risus pulvinar'''
                ''' sed id. Dolor tempus a in diam sit et nibh et '''
                '''consectetur. Cras ullamcorper turpis aliquet velit'''
                ''' pellentesque. Quam nunc, quisque turpis morbi '''
                '''viverra tortor. Amet a id eget euismod quis.'''
                '''Bibendum aenean ut eleifend et feugiat mi est'''
                ''' quisque. Urna nibh blandit tincidunt venenatis,'''
                ''' facilisi feugiat tristique egestas. Sollicitudin'''
                ''' non, viverra egestas risus pulvinar sed id. Dolor'''
                ''' tempus a in diam sit et nibh et consectetur. Cras '''
                '''ullamcorper turpis aliquet velit pellentesque. Quam '''
                '''nunc, quisque turpis morbi viverra tortor. Amet a '''
                '''id eget euismod quis.\n'''
                '''\nLorem ipsum dolor sit amet, consectetur'''
                ''' adipiscing elit. Tincidunt dolor mi viverra felis '''
                '''viverra diam. Diam lorem orci maecenas dictum amet, '''
                '''massa est vitae mattis. Bibendum aenean ut eleifend et '''
                '''feugiat mi est quisque. Urna nibh blandit tincidunt'''
                ''' venenatis, facilisi feugiat tristique egestas. Sollicitudin'''
                ''' non, viverra egestas risus pulvinar sed id. Dolor'''
                ''' tempus a in diam sit et nibh et consectetur. Cras'''
                ''' ullamcorper turpis aliquet velit pellentesque. Quam '''
                '''nunc, quisque turpis morbi viverra tortor. Amet a id '''
                '''eget euismod quis.\n'''
                '''\nConsectetur adipiscing elit. Tincidunt dolor mi viverra'''
                ''' felis viverra diam. Diam lorem orci maecenas dictum amet,'''
                ''' massa est vitae mattis. Bibendum aenean ut eleifend et '''
                '''feugiat mi est quisque. Urna nibh blandit tincidunt'''
                ''' venenatis, facilisi feugiat tristique egestas. '''
                '''Sollicitudin non, viverra egestas risus pulvinar'''
                ''' sed id. Dolor tempus a in diam sit et nibh et '''
                '''consectetur. Cras ullamcorper turpis aliquet velit'''
                ''' pellentesque. Quam nunc, quisque turpis morbi '''
                '''viverra tortor. Amet a id eget euismod quis.'''
                '''Bibendum aenean ut eleifend et feugiat mi est'''
                ''' quisque. Urna nibh blandit tincidunt venenatis,'''
                ''' facilisi feugiat tristique egestas. Sollicitudin'''
                ''' non, viverra egestas risus pulvinar sed id. Dolor'''
                ''' tempus a in diam sit et nibh et consectetur. Cras '''
                '''ullamcorper turpis aliquet velit pellentesque. Quam '''
                '''nunc, quisque turpis morbi viverra tortor. Amet a '''
                '''id eget euismod quis.\n''',
                style: AppTextStyles.normal,
              ),
            ),
          );
        });
  }
}
