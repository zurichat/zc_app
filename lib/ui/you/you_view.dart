import 'package:flutter/material.dart';
import 'package:hng/ui/you/you_viewmodel.dart';
import 'package:stacked/stacked.dart';

class YouView extends StatelessWidget {
  const YouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<YouViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text("You View"),
          ),
        );
      },
      viewModelBuilder: () => YouViewModel(),
    );
  }
}
