import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:zurichat/ui/shared/zuri_appbar.dart';
// import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked/stacked.dart';
import 'general_search_view.form.dart';
import 'general_search_viewmodel.dart';

@FormView(fields: [FormTextField(name: 'search')])
class GeneralSearchView extends StatelessWidget with $GeneralSearchView {
  GeneralSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final local = AppLocalization.of(context);
    return ViewModelBuilder<GeneralSearchViewModel>.reactive(
      onModelReady: (model) => model,
      viewModelBuilder: () => GeneralSearchViewModel(),
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          searchController: searchController,
          isSearchBar: true,
        ),
        body: Container(),
      ),
    );
  }
}
