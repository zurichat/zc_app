import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'integrate_viewmodel.dart';

class IntegratePage extends StatelessWidget {
  const IntegratePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IntegrateViewModel>.reactive(
      viewModelBuilder: () => IntegrateViewModel(),
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Container(
          alignment: Alignment.center,
          child: const Text('Home Page'),
        );
      },
    );
  }
}
