import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/models/plugin_model.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';

import 'add_plugin_viewmodel.dart';

class AddPluginView extends StatelessWidget {
  const AddPluginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _dark = Theme.of(context).brightness == Brightness.dark;
    final local = AppLocalization.of(context);
    return ViewModelBuilder<AddPluginViewModel>.reactive(
      onModelReady: (model) => model.getPlugins(),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
            whiteBackground: true,
            leading: Icons.close,
            isDarkMode: _dark ? true : false,
            leadingPress: model.goBack,
            orgTitle: Text(
              local!.addPlugin,
              style: _dark
                  ? AppTextStyle.whiteSize18Bold
                  : AppTextStyle.blackSize18Bold,
            ),
            actions: [
              TextButton(
                  onPressed: () => model.goBack(),
                  child: Text('Add', style: AppTextStyle.greenSize16)),
            ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color:
                        !_dark ? AppColors.whiteColor : AppColors.darkModeColor,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 2.0,
                          color: AppColors.inactiveGreyColor,
                          offset: Offset(0, 1))
                    ]),
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: TextField(
                  cursorColor:
                      _dark ? AppColors.textLight20 : AppColors.blackColor,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  style: _dark
                      ? AppTextStyle.whiteSize16Bold
                      : AppTextStyle.darkGreySize16Bold,
                  decoration: InputDecoration(
                      hintText: 'Search plugin',
                      filled: true,
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      fillColor: !_dark
                          ? AppColors.whiteColor
                          : AppColors.darkModeColor),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return CheckboxListTile(
                      value: model.plugins[i].isCheck,
                      onChanged: (value) {
                        model.setChecked(value!, i, model.plugins[i].isCheck);
                      },
                      activeColor: AppColors.zuriPrimaryColor,
                      secondary: SvgPicture.asset(model.plugins[i].icon,
                          height: 25, width: 25),
                      title: Text(model.plugins[i].name,
                          style: AppTextStyle.darkGreySize16Bold),
                    );
                  },
                  itemCount: model.plugins.length),
              const SizedBox(height: 15),
              model.pluginsList.isEmpty
                  ? const SizedBox()
                  : Text("Added plugins", style: AppTextStyle.bigBlackText),
              for (PluginModel pluginModel in model.pluginsList)
                ListTile(
                  title: Text(pluginModel.name),
                  trailing: IconButton(
                      onPressed: () => model
                          .removePlugin(model.pluginsList.indexOf(pluginModel)),
                      icon:
                          const Icon(Icons.cancel_outlined, color: Colors.red)),
                ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AddPluginViewModel(),
    );
  }
}
