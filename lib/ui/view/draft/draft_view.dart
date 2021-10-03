import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';
import 'draft_viewmodel.dart';

class DraftView extends StatelessWidget {
  const DraftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DraftViewModel>.reactive(
      onModelReady: (model) {
        model.drafts;
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: IconButton(
                onPressed: (){
                  model.goBack();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          centerTitle: false,
          leadingWidth: 20,
          title: Text("Drafts", style: AppTextStyles.body1Bold),
        ),
        body: ListView.builder(
          itemCount: model.widgets.length,
          itemBuilder: (BuildContext context, int index) {
            return model.widgets[index];
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
