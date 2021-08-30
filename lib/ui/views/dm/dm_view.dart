import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dm_viewmodel.dart';

// UI CODE ONLY

class DMView extends StatelessWidget {
 const DMView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<DMViewModel>.reactive(
     builder: (context, model, child) => Scaffold(),
     viewModelBuilder: () => DMViewModel(),
   );
 }
}