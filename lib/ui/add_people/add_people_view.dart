import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';
import 'add_people_viewmodel.dart';
import 'widgets/custom_people_list_tile.dart';

class AddPeopleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPeopleViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
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
                  height: 29,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      hintText: 'Search people to add',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7B8794)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7B8794)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Add Everyone',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF333333),
                                fontSize: 16,
                              )),
                          const Text('Everyone will be added to channel'),
                        ],
                      ),
                      Checkbox(
                          checkColor: Colors.white,
                          value: true,
                          onChanged: (bool? value) {}),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const CustomPeopleListTile(
                    imagelink: "https://via.placeholder.com/150/35185e",
                    userName: 'Caleb',
                    isOnline: true,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const CustomPeopleListTile(
                    imagelink: "https://via.placeholder.com/600/c70a4d",
                    userName: 'Caleb',
                    isOnline: false,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const CustomPeopleListTile(
                    imagelink: "https://via.placeholder.com/600/4d564d",
                    userName: 'Caleb',
                    isOnline: false,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const CustomPeopleListTile(
                    imagelink: "https://via.placeholder.com/600/121fa4",
                    userName: 'Caleb',
                    isOnline: true,
                  ),
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
