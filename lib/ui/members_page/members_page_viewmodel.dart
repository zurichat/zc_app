import 'package:hng/models/members_model.dart';
import 'package:stacked/stacked.dart';

class MembersPageViewModel extends BaseViewModel {
  List<MemberModel> _members = [
    MemberModel(
      id: 001,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      fullName: 'Light Yagami',
      displayName: 'Kira',
      isOnline: true,
      status: '4️⃣',
    ),
    MemberModel(
      id: 002,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      fullName: 'Ichigo Kurosaki',
      displayName: "Shingami",
      isOnline: false,
      status: '4️⃣',
    ),
    MemberModel(
      id: 003,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      fullName: 'Levi Ackerman',
      displayName: "Levi",
      isOnline: false,
      status: '4️⃣',
    ),
    MemberModel(
      id: 004,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      fullName: 'Aomine Daiki',
      displayName: 'Ace',
      isOnline: false,
      status: '4️⃣',
    ),
    MemberModel(
      id: 005,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      fullName: 'Eren Yeager',
      displayName: 'AttackTitan',
      isOnline: false,
      status: '4️⃣',
    ),
    MemberModel(
      id: 006,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      fullName: 'Thorfinn',
      displayName: 'Thorfinn',
      isOnline: true,
      status: '4️⃣',
    ),
    MemberModel(
      id: 007,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      fullName: 'Isaac',
      displayName: 'Forgemaster',
      isOnline: true,
      status: '4️⃣',
    ),
    MemberModel(
        id: 008,
        avatarUrl:
            'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
        fullName: 'Isaac',
        displayName: 'Forgemaster',
        isOnline: true,
        status: '4️⃣'),
    MemberModel(
        id: 009,
        avatarUrl:
            'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
        fullName: 'Meliodas',
        displayName: 'SinOfWrath',
        isOnline: false,
        status: '4️⃣'),
    MemberModel(
      id: 010,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      fullName: 'Naruto Uzumaki',
      displayName: 'YellowHairedShinobi',
      isOnline: false,
      status: '4️⃣',
    ),
    MemberModel(
      id: 011,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      fullName: 'Kageyama Shigo',
      displayName: 'Mob',
      isOnline: false,
      status: '4️⃣',
    ),
    MemberModel(
      id: 011,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      fullName: 'Saitama',
      displayName: 'OnePunch',
      isOnline: false,
      status: '4️⃣',
    ),
    MemberModel(
      id: 012,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      fullName: 'Asta',
      displayName: 'Asta',
      isOnline: false,
      status: '4️⃣',
    ),
  ];

  List<MemberModel> get members {
    return [..._members];
  }

  void it() {
    foundmembers = members;
    notifyListeners();
  }

  static List<MemberModel> foundmembers = [];

  static List<MemberModel> results = [];

  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      results = _members;
    } else {
      results = _members
          .where((member) => member.fullName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }

    foundmembers = results;
    notifyListeners();
  }
}
