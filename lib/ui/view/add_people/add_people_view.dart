import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../shared/shared.dart';
import 'add_people_viewmodel.dart';
import 'widgets/custom_people_list_tile.dart';

class AddPeopleView extends StatelessWidget {
  final navigator = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPeopleViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              navigator.back();
            },
            icon: const Icon(Icons.close, color: Colors.black),
          ),
          title: const Text('Add People',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
                fontSize: 16,
              )),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Add',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF00B87C),
                    fontSize: 14,
                  )),
            ),
          ],
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Material(
                    elevation: 5.0,
                    shadowColor: Colors.grey,
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Search people to add',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                ListTile(
                  title: Text('Add Everyone',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF333333),
                        fontSize: 16,
                      )),
                  subtitle: Text('Everyone will be added to channel'),
                  trailing: Checkbox(
                      checkColor: Colors.white,
                      value: true,
                      onChanged: (bool? value) {}),
                ),
                const Divider(),
                const CustomPeopleListTile(
                  imagelink: 'assets/channel_page/femaleuser.png',
                  userName: 'Caleb',
                  isOnline: true,
                ),
                const SizedBox(height: 16),
                const CustomPeopleListTile(
                  imagelink: 'assets/channel_page/female.png',
                  userName: 'Lisa',
                  isOnline: false,
                ),
                const SizedBox(height: 16),
                const CustomPeopleListTile(
                  imagelink: 'assets/channel_page/femaleuser.png',
                  userName: 'Jennie',
                  isOnline: false,
                ),
                const SizedBox(height: 16),
                const CustomPeopleListTile(
                  imagelink: 'assets/channel_page/female.png',
                  userName: 'Zigga',
                  isOnline: true,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AddPeopleViewModel(),
    );
  }
}
