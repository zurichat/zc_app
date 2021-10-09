import 'package:flutter/material.dart';
// import 'package:flutter_dnd/flutter_dnd.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';
import '../../../general_widgets/custom_text.dart';
import '../../shared/shared.dart';
import 'do_not_disturb_viewmodel.dart';


// class DoNotDisturbView extends StatefulWidget {
//   const DoNotDisturbView({Key? key}) : super(key: key);
//
//   @override
//   _DoNotDisturbViewState createState() => _DoNotDisturbViewState();
// }
//
// class _DoNotDisturbViewState extends State<DoNotDisturbView> with WidgetsBindingObserver{
//
//  String _filterName = '';
//   bool _isNotificationPolicyAccessGranted = false;
//
//   @override
//   void initState() {
//     WidgetsBinding.instance!.addObserver(this);
//     super.initState();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     print(state.toString());
//     if (state == AppLifecycleState.resumed) {
//       DoNotDisturbViewModel();
//     }
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     DoNotDisturbViewModel();
//   }
//
//   void DoNotDisturbViewModel() async {
//     int filter = await FlutterDnd.getCurrentInterruptionFilter();
//     String filterName = FlutterDnd.getFilterName(filter);
//     bool isNotificationPolicyAccessGranted =
//     await FlutterDnd.isNotificationPolicyAccessGranted;
//
//     setState(() {
//       _isNotificationPolicyAccessGranted = isNotificationPolicyAccessGranted;
//       _filterName = filterName;
//     });
//   }
//
//   void setInterruptionFilter(int filter) async {
//     if (await FlutterDnd.isNotificationPolicyAccessGranted) {
//       await FlutterDnd.setInterruptionFilter(filter);
//       DoNotDisturbViewModel();
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<DoNotDisturbViewModel>.reactive(
//       builder: (context, model, child) => Scaffold(
//         appBar: ZuriAppBar(
//           leading: Icons.close_rounded,
//           leadingPress: () => model.exitPage(),
//           orgTitle: Text(
//             'Do not disturb',
//             style: AppTextStyles.heading7,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {},
//               child: const Text(
//                 'Save',
//                 style: TextStyle(color: AppColors.zuriPrimaryColor),
//               ),
//             )
//           ],
//         ),
//         body: Column(
//           children: [
//             Flexible(
//               fit: FlexFit.loose,
//               child: ListView.builder(
//                 itemCount: model.doNotDisturbTimes.length,
//                 itemBuilder: (context, index) => ListTile(
//                   title: CustomText(text: model.doNotDisturbTimes[index]),
//                   leading: Radio(
//                     activeColor: AppColors.zuriPrimaryColor,
//                     value: index,
//                     groupValue: model.currentValue,
//                     onChanged: model.changeTime,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       viewModelBuilder: () => DoNotDisturbViewModel(),
//     );
//
//   }
// }


class DoNotDisturbView extends StatelessWidget {


  const DoNotDisturbView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DoNotDisturbViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          leadingPress: () => model.exitPage(),
          orgTitle: Text(
            'Do not disturb',
            style: AppTextStyles.heading7,
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Save',
                style: TextStyle(color: AppColors.zuriPrimaryColor),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                itemCount: model.doNotDisturbTimes.length,
                itemBuilder: (context, index) => ListTile(
                  title: CustomText(text: model.doNotDisturbTimes[index]),
                  leading: Radio(
                    activeColor: AppColors.zuriPrimaryColor,
                    value: index,
                    groupValue: model.currentValue,
                    onChanged: model.changeTime,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => DoNotDisturbViewModel(),
    );

  }
}
