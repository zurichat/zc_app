import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_plugin_viewmodel.dart';

class AddPluginView extends StatelessWidget {
 const AddPluginView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<AddPluginViewModel>.reactive(
     builder: (context, model, child) => const Scaffold(),
     viewModelBuilder: () => AddPluginViewModel(),
   );
 }
}