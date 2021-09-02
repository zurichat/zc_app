import 'package:flutter/material.dart';
import 'package:hng/ui/integrate/integrate_viewmodel.dart';
import 'package:stacked/stacked.dart';

class IntegrateView extends StatelessWidget {
  const IntegrateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IntegrateViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text("Integrate View"),
          ),
        );
      },
      viewModelBuilder: () => IntegrateViewModel(),
    );
  }
}
