import 'package:flutter/material.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/custom_text.dart';
import '../../shared/colors.dart';
import 'saved_items_viewmodel.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return ViewModelBuilder<SavedItemsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriTopBar(
          leading:
            Icons.close_rounded,
            whiteBackground: true,
            leadingPress: () => model.exitPage(),
          orgTitle: Text('Saved Items', style: AppTextStyles.heading7),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.bookmark_border_outlined,
                size: _size.height * .3,
                color: AppColors.greyishColor,
              ),
              const CustomText(
                text: 'No saved items',
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 10),
              const Text(
                'Add messages and files to easily \ncome back to them later.',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.greyishColor, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SavedItemsViewModel(),
    );
  }
}
