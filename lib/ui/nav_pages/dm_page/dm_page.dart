import 'package:flutter/material.dart';
import 'package:hng/ui/nav_pages/dm_page/dm_page_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DmPage extends StatelessWidget {
  const DmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmPageViewModel>.reactive(
      viewModelBuilder: () => DmPageViewModel(),
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Container(
            alignment: Alignment.center, child: const Text('Dm Page'));
      },
    );
  }
}
