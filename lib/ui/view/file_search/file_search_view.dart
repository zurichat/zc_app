// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/shared.dart';

import 'widgets/tab_bar.dart';
import 'widgets/search_bar.dart';
import 'widgets/file_tile.dart';
import 'file_search_viewmodel.dart';

class FileSearchView extends StatefulWidget {
  const FileSearchView({Key? key}) : super(key: key);

  @override
  State<FileSearchView> createState() => _FileSearchViewState();
}

class _FileSearchViewState extends State<FileSearchView> {
  final Widget _divider =
      const Divider(height: 5, color: AppColors.borderColor);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FileSearchViewModel>.reactive(
        viewModelBuilder: () => FileSearchViewModel(),
        builder: (context, viewModel, child) => SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.whiteColor,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(150),
                  child: AppBar(
                    backgroundColor: AppColors.greenColor,
                    automaticallyImplyLeading: false,
                    title: const CustomSearchBar(
                      searchFilter: 'designers',
                    ),
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(49),
                      child: CustomTabBar(tab1: 'Messages', tab2: 'Files'),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 49,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Positioned(
                                left: 12,
                                child: Text('50 Results',
                                    style: AppTextStyles.normalGrey)),
                            Expanded(child: SizedBox(width: 1000)),
                            Positioned(
                              right: 12,
                              child: Row(
                                children: [
                                  Text('Newest',
                                      style: AppTextStyles.normalGrey),
                                  Image.asset('assets/images/arrows.png'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      _divider,
                      const CustomFileListTile(
                          imagelink: 'assets/images/file_image.png',
                          fileName: 'image.png',
                          subtitle: '550KB png'),
                      _divider,
                      const CustomFileListTile(
                          imagelink: 'assets/images/file_image.png',
                          fileName: 'image.png',
                          subtitle: '550KB png'),
                      _divider,
                    ],
                  ),
                ),
              ),
            ));
  }
}

//* Custom Widgets




