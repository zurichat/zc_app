import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';
import 'clear_after_viewmodel.dart';
import 'widget/date_and_time.dart';

class ClearAfterView extends StatelessWidget {
  const ClearAfterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.height;
    return ViewModelBuilder<ClearAfterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: model.exitPage, icon: Icon(Icons.close_rounded)),
          title: Text("Clear after..."),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: model.clearAfterTimes.length,
                  itemBuilder: (context, index) => Container(
                    child: ListTile(
                      title: CustomText(text: model.clearAfterTimes[index]),
                      leading: Radio(
                        activeColor: AppColors.zuriPrimaryColor,
                        value: index,
                        groupValue: model.currentValue,
                        onChanged: model.changeTime,
                      ),
                    ),
                  ),
                ),
              ),
              model.lastIndex
                  ? Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: width * 0.15, right: width * 0.05),
                        child: DateAndTime(),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ClearAfterViewModel(),
    );
  }
}
