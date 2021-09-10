import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'saved_items_viewmodel.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedItemsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text("Saved Items"),
        ),
      ),
      viewModelBuilder: () => SavedItemsViewModel(),
    );
  }
}
