import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'draft_viewmodel.dart';

class DraftView extends StatelessWidget {
  const DraftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DraftViewModel>.reactive(

      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
          leading: const Icon(Icons.arrow_back_ios),
        ),
        body: ListView.builder(
          itemCount: model.draft.length,
          itemBuilder: (BuildContext context, int index) {
            return model.draft[index];
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add draft',
          child: const Icon(Icons.notes),
        ),
      ),
      viewModelBuilder: () => DraftViewModel(),
    );
  }
}
