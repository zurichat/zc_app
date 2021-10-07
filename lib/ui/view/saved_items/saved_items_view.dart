import 'package:flutter/material.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';
import 'saved_items_viewmodel.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedItemsViewModel>.reactive(
      onModelReady: (model) => model.savedItems,
      builder: (context, model, child) => Scaffold(
          appBar: ZuriAppBar(
            leading: Icons.close_rounded,
            whiteBackground: true,
            leadingPress: () => model.exitPage(),
            orgTitle: Text('Saved Items', style: AppTextStyles.heading4),
          ),
          body: ListView.separated(
            itemCount: model.savedBuilderList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.savedBuilderList[index].channelName!,
                        style: AppTextStyles.heading4),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              model.savedBuilderList[index].userImage!),
                        ),
                        const SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(model.savedBuilderList[index].userID!,
                                  style: AppTextStyles.heading7),
                              const SizedBox(height: 10),
                              Text(model.savedBuilderList[index].message!)
                            ]),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          )
          // body: SizedBox(
          //   width: double.infinity,
          //   child:
          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisSize: MainAxisSize.max,
          //     children: [
          //       Icon(
          //         Icons.bookmark_border_outlined,
          //         size: _size.height * .3,
          //         color: AppColors.greyishColor,
          //       ),
          //       const CustomText(
          //         text: 'No saved items',
          //         fontWeight: FontWeight.w600,
          //       ),
          //       const SizedBox(height: 10),
          //       const Text(
          //         'Add messages and files to easily \ncome back to them later.',
          //         maxLines: 2,
          //         textAlign: TextAlign.center,
          //         style: TextStyle(color: AppColors.greyishColor, fontSize: 16),
          //       ),
          //     ],
          //   ),
          // ),
          ),
      viewModelBuilder: () => SavedItemsViewModel(),
    );
  }
}
