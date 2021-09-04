import 'package:flutter/material.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class IntegratePage extends StatelessWidget {
  const IntegratePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text('Intergrate Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.nightlife),
        onPressed: () {
          NavigationService().navigateTo(Routes.useDifferentEmailView);
        },
      ),
    );
  }
}
