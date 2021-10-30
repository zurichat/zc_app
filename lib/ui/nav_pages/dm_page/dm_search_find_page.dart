import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../shared/shared.dart';
import 'dm_page_viewmodel.dart';

class DmScreen extends StatelessWidget {
  DmScreen({Key? key}) : super(key: key);

  final _chipKey = GlobalKey<ChipsInputState>();

  //Hardcoded list of users
  final List<UserProfile> _userResults = [
    UserProfile(username: Mark, isOnline: true),
    UserProfile(username: Naza, isOnline: true),
    UserProfile(username: OyinkanUA, isOnline: true),
    UserProfile(username: Xclusivecyborg),
    UserProfile(username: Fierce, isOnline: true),
    UserProfile(username: BlazeBrain),
    UserProfile(username: FreshFish, isOnline: true),
    UserProfile(username: Ekpess),
    UserProfile(username: Protector, isOnline: true),
    UserProfile(username: BusyBee, isOnline: true),
    UserProfile(username: Abroad),
    UserProfile(username: Kristie),
    UserProfile(username: Kara, isOnline: true),
  ];
  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<DmPageViewModel>.reactive(
      viewModelBuilder: () => DmPageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
          whiteBackground: true,
          leading: Icons.arrow_back_ios_new,
          leadingPress: model.goBack,
          orgTitle: Text(
            local!.directMessages,
            style: AppTextStyle.blackSize18Bold.copyWith(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                model.navigateToDmUserView();
              },
              child: Text(
                local.done,
                style: const TextStyle(color: AppColors.borderColor),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    width: 0.5,
                    color: AppColors.greyishColor,
                  ),
                  vertical: BorderSide.none,
                ),
              ),
              child: ChipInputTextField(
                  chipKey: _chipKey, mockResults: _userResults),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _userResults.length,
                itemBuilder: (_, index) => CustomSearchTile(
                  username: _userResults[index].username,
                  userOnline: _userResults[index].isOnline,
                  checkBoxValue: _userResults[index].checked,
                  onChange: (bool? value) {
                    _userResults[index].checked = value;
                    if (value == true) {
                      _chipKey.currentState!.selectSuggestion(UserProfile(
                        username: _userResults[index].username,
                      ));
                    } else if (value == false) {
                      _chipKey.currentState!.deleteChip(UserProfile(
                        username: _userResults[index].username,
                      ));
                    }
                  },
                ),
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//The Input chip Widget used for searching for users
class ChipInputTextField extends StatelessWidget {
  const ChipInputTextField({
    Key? key,
    required GlobalKey<ChipsInputState> chipKey,
    required this.mockResults,
  })  : _chipKey = chipKey,
        super(key: key);

  final GlobalKey<ChipsInputState> _chipKey;
  final List<UserProfile> mockResults;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ChipsInput(
      key: _chipKey,
      keyboardAppearance: Brightness.dark,
      textCapitalization: TextCapitalization.words,
      textStyle: const TextStyle(height: 1.5, fontSize: 16),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10),
        border: InputBorder.none,
        hintText: local!.dmHint,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greyishColor,
          ),
        ),
      ),
      findSuggestions: (String query) {
        if (query.isNotEmpty) {
          var lowercaseQuery = query.toLowerCase();
          return mockResults.where((profile) {
            return profile.username!
                .toLowerCase()
                .contains(query.toLowerCase());
          }).toList(growable: false)
            ..sort(
              (a, b) =>
                  a.username!.toLowerCase().indexOf(lowercaseQuery).compareTo(
                        b.username!.toLowerCase().indexOf(lowercaseQuery),
                      ),
            );
        }

        return mockResults;
      },
      onChanged: (data) {},
      chipBuilder: (context, state, UserProfile profile) {
        return Chip(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
          ),
          key: ObjectKey(profile),
          label: Text(profile.username!),
          avatar: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(profile.imageUrl!),
              ),
            ),
          ),

          // onDeleted: () => state.deleteChip(profile),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      },
      suggestionBuilder: (context, state, UserProfile profile) {
        return ListTile(
          key: ObjectKey(profile),
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(profile.imageUrl!),
              ),
            ),
          ),
          title: Text(profile.username!),
          onTap: () => state.selectSuggestion(profile),
        );
      },
    );
  }
}

//Listtile that contains each user value
class CustomSearchTile extends StatelessWidget {
  final String? username;
  final bool? checkBoxValue;
  final bool? userOnline;
  final Function(bool?)? onChange;
  const CustomSearchTile({
    Key? key,
    @required this.username,
    this.checkBoxValue,
    this.userOnline,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(UserAvatar),
          ),
        ),
      ),
      title: Row(
        children: [
          Text(username!),
          const SizedBox(
            width: 15,
          ),
          onlineStatusDot(isOnline: userOnline!),
        ],
      ),
      trailing: Checkbox(value: checkBoxValue, onChanged: onChange),
    );
  }
}

//The dot that indicates if a user is online or not
Container onlineStatusDot({bool isOnline = false}) {
  return Container(
    height: 8,
    width: 8,
    decoration: BoxDecoration(
        color: isOnline ? AppColors.zuriPrimaryColor : Colors.transparent,
        shape: BoxShape.circle,
        border: isOnline
            ? Border.all(color: Colors.transparent)
            : Border.all(color: AppColors.deepBlackColor)),
  );
}

//The class used for building each User profile
class UserProfile {
  String? username;
  bool? isOnline;
  bool? checked;
  final String? imageUrl;

  UserProfile(
      {this.imageUrl = UserAvatar,
      this.checked = false,
      this.username,
      this.isOnline = false});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfile &&
          runtimeType == other.runtimeType &&
          username == other.username;

  @override
  int get hashCode => username.hashCode;

  @override
  String toString() {
    return username!;
  }
}
