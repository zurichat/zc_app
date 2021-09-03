import 'package:flutter/material.dart';
import 'package:hng/ui/nav_pages/you_page/you_page_viewmodel.dart';
import 'package:stacked/stacked.dart';

class YouPage extends StatelessWidget {
  const YouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<YouPageViewModel>.reactive(
      viewModelBuilder: () => YouPageViewModel(),
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Container(
          alignment: Alignment.center,
          child: const Text('You Page'),
        );
      },
    );
  }
}
