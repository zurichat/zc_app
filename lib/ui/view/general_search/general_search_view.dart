import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/view/general_search/general_search_view.form.dart';
import 'package:zurichat/ui/view/general_search/general_search_viewmodel.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';

import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';

@FormView(fields: [FormTextField(name: 'search')])
class GeneralSearchView extends StatelessWidget with $GeneralSearchView {
  GeneralSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalization.of(context)!;
    return ViewModelBuilder<GeneralSearchViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model..init()),
      viewModelBuilder: () => GeneralSearchViewModel(),
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          isSearchBar: true,
          hintText: locale.searchAll,
          focusNode: searchFocusNode,
          onTap: model.notifyListeners,
          onChanged: (value) => model.notifyListeners(),
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
            model.search();
          },
          searchController: searchController,
          prefixIcon: model.searchValue?.isNotEmpty == true
              ? IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    searchController.clear();
                    model.clearResults();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.whiteColor,
                    size: 16.0,
                  ),
                )
              : const Icon(
                  Icons.search,
                  color: AppColors.whiteColor,
                  size: 20.0,
                ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (model.isShowingResults) {
              searchController.clear();
              model.clearResults();
              return false;
            }

            return true;
          },
          child: model.isShowingResults
              ? Center(
                  child: Text(
                    NoResultsFound,
                    style: AppTextStyle.darkGreySize16,
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 24.0),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!searchFocusNode.hasFocus) ...[
                        ListTile(
                          onTap: model.navigateToPeopleBrowser,
                          horizontalTitleGap: 0.0,
                          leading: const Icon(
                            Icons.people_outline,
                            color: AppColors.zuriDarkGrey,
                            size: 20.0,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
                          title: Text(locale.browsePeople,
                              style: AppTextStyle.darkGreySize16),
                          dense: true,
                        ),
                        ListTile(
                          onTap: model.navigateToChannelBrowser,
                          horizontalTitleGap: 0.0,
                          leading: const Icon(
                            Icons.tag,
                            color: AppColors.zuriDarkGrey,
                            size: 20.0,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
                          title: Text(locale.browseChannels,
                              style: AppTextStyle.darkGreySize16),
                          dense: true,
                        ),
                      ],
                      if (model.recentSearches.isNotEmpty) ...[
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(locale.recentSearches,
                              style: AppTextStyle.darkGreySize14Bold),
                        ),
                        const SizedBox(height: 8.0),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: min(model.recentSearches.length, 5),
                          itemBuilder: (context, index) {
                            final recentSearch = model.recentSearches[
                                model.recentSearches.length - index - 1];
                            return ListTile(
                              horizontalTitleGap: 0.0,
                              leading: const Icon(
                                Icons.access_time_outlined,
                                color: AppColors.zuriDarkGrey,
                                size: 20.0,
                              ),
                              contentPadding: const EdgeInsets.only(left: 12.0),
                              trailing: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () =>
                                      model.removeRecent(recentSearch),
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppColors.zuriDarkGrey,
                                    size: 20.0,
                                  )),
                              title: Text(recentSearch,
                                  style: AppTextStyle.darkGreySize16),
                              onTap: () {
                                searchController.text = recentSearch;
                                FocusScope.of(context).unfocus();
                                model.search();
                              },
                              dense: true,
                            );
                          },
                        ),
                      ],
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(locale.narrowYourSearch,
                            style: AppTextStyle.darkGreySize14Bold),
                      ),
                      const SizedBox(height: 8.0),
                      ListTile(
                        horizontalTitleGap: 0.0,
                        leading: const Icon(
                          Icons.add_box_outlined,
                          color: AppColors.zuriDarkGrey,
                          size: 20.0,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12.0),
                        trailing: Text(locale.inExample,
                            style: AppTextStyle.darkGreySize16),
                        title: Text(locale.inFilter,
                            style: AppTextStyle.darkGreySize16),
                        onTap: () {
                          searchController.text = "${locale.inFilter}#";
                          searchFocusNode.requestFocus();
                          model.notifyListeners();
                        },
                        dense: true,
                      ),
                      ListTile(
                        horizontalTitleGap: 0.0,
                        leading: const Icon(
                          Icons.add_box_outlined,
                          color: AppColors.zuriDarkGrey,
                          size: 20.0,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12.0),
                        trailing: Text(locale.fromExample,
                            style: AppTextStyle.darkGreySize16),
                        title: Text(locale.fromFilter,
                            style: AppTextStyle.darkGreySize16),
                        onTap: () {
                          searchController.text = "${locale.fromFilter}@";
                          searchFocusNode.requestFocus();
                          model.notifyListeners();
                        },
                        dense: true,
                      ),
                      ListTile(
                        horizontalTitleGap: 0.0,
                        leading: const Icon(
                          Icons.add_box_outlined,
                          color: AppColors.zuriDarkGrey,
                          size: 20.0,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12.0),
                        trailing: Text(locale.isExample,
                            style: AppTextStyle.darkGreySize16),
                        title: Text(locale.isFilter,
                            style: AppTextStyle.darkGreySize16),
                        onTap: () {
                          searchController.text = "${locale.isFilter}";
                          searchFocusNode.requestFocus();
                          model.notifyListeners();
                        },
                        dense: true,
                      ),
                      ListTile(
                        horizontalTitleGap: 0.0,
                        leading: const Icon(
                          Icons.add_box_outlined,
                          color: AppColors.zuriDarkGrey,
                          size: 20.0,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12.0),
                        trailing: Text(locale.afterExample,
                            style: AppTextStyle.darkGreySize16),
                        title: Text(locale.afterFilter,
                            style: AppTextStyle.darkGreySize16),
                        onTap: () {
                          searchController.text = "${locale.afterFilter}";
                          searchFocusNode.requestFocus();
                          model.notifyListeners();
                        },
                        dense: true,
                      ),
                      ListTile(
                        horizontalTitleGap: 0.0,
                        leading: const Icon(
                          Icons.add_box_outlined,
                          color: AppColors.zuriDarkGrey,
                          size: 20.0,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12.0),
                        trailing: Text(locale.toExample,
                            style: AppTextStyle.darkGreySize16),
                        title: Text(locale.toFilter,
                            style: AppTextStyle.darkGreySize16),
                        onTap: () {
                          searchController.text = "${locale.toFilter}";
                          searchFocusNode.requestFocus();
                          model.notifyListeners();
                        },
                        dense: true,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
