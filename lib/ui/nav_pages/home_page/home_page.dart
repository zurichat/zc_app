import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_page_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          alignment: Alignment.center,
          child: const Text('Home Page'),
        );
      },
    );
  }
}
