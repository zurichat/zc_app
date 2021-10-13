import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../shared/shared.dart';
import 'add_people_viewmodel.dart';
import 'widgets/custom_people_list_tile.dart';

class AddPeopleView extends StatelessWidget {
  const AddPeopleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPeopleViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.arrow_back_ios,
          leadingPress: () => model.goBack(),
          orgTitle: Text(
            AddPeople,
            style: AppTextStyle.darkGreySize20Bold,
          ),
          whiteBackground: true,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                Add,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF00B87C),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Material(
                  elevation: 5.0,
                  shadowColor: Colors.grey,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      hintText: SearchPeople,
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
                title: const Text(AddEveryone,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF333333),
                      fontSize: 16,
                    )),
                subtitle: const Text(EveryoneWillBeAdded),
                trailing: Checkbox(
                    checkColor: Colors.white,
                    value: true,
                    onChanged: (bool? value) {}),
              ),
              const Divider(),
              const CustomPeopleListTile(
                imagelink: FemaleUser,
                userName: PaulEke,
                isOnline: true,
              ),
              const SizedBox(height: 16),
              const CustomPeopleListTile(
                imagelink: Female,
                userName: Quwaysim,
                isOnline: false,
              ),
              const SizedBox(height: 16),
              const CustomPeopleListTile(
                imagelink: FemaleUser,
                userName: BlazeBrain,
                isOnline: false,
              ),
              const SizedBox(height: 16),
              const CustomPeopleListTile(
                imagelink: Female,
                userName: FreshFish,
                isOnline: true,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AddPeopleViewModel(),
    );
  }
}
