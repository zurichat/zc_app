import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/view/draft/drafts.dart';
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
          itemCount: model.widgetBuilderList.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomListTile(
              text: model.widgetBuilderList[index].text,
              subtitle: model.widgetBuilderList[index].subtitle,
              route: model.widgetBuilderList[index].route,
              time: model.widgetBuilderList[index].time,
              model: model,
            );},
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: AddDraft,
          child: const Icon(Icons.notes),
        ),
      ),
      viewModelBuilder: () => DraftViewModel(),
    );
  }
}
