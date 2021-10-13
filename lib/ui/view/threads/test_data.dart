import 'package:hng/models/user_post.dart';
import 'package:hng/utilities/enums.dart';

List<UserThreadPost> thread1 = [
  UserThreadPost(
    channelId: "345",
    postEmojis: <PostEmojis>[],
    id: "1",
    displayName: "PrincessLiz",
    statusIcon: "6️⃣",
    moment: '4 hours ago',
    userImage: 'assets/images/chimamanda.png',
    message: 'Are you in team Socrates?',
  ),
  UserThreadPost(
    channelId: "345",
    postEmojis: <PostEmojis>[],
    id: "2",
    displayName: "PrincessLiz",
    statusIcon: "6️⃣",
    userImage: 'assets/images/chimamanda.png',
    moment: '4 hours ago',
    message: '[@Blazebrain:51515151]',
  ),
];

List<UserThreadPost> thread2 = [
  UserThreadPost(
    channelId: "345",
    postEmojis: <PostEmojis>[],
    id: "3",
    displayName: "PrincessLiz",
    statusIcon: "6️⃣",
    moment: '4 hours ago',
    userImage: 'assets/images/chimamanda.png',
    message: 'I am fine. You?',
  ),
  UserThreadPost(
    channelId: "345",
    postEmojis: <PostEmojis>[],
    id: "4",
    displayName: "Dee",
    statusIcon: "6️⃣",
    userImage: 'assets/images/chimamanda.png',
    moment: '4 hours ago',
    message: 'How are You',
  ),
];

List<UserThreadPost> thread3 = [
  UserThreadPost(
    channelId: "345",
    postEmojis: <PostEmojis>[],
    id: "12",
    displayName: "mark",
    statusIcon: "6️⃣",
    userImage: 'assets/images/user.png',
    moment: '4 hours ago',
    postDate: '20:23',
    message: 'I think you cans ask on help channel',
  ),
  UserThreadPost(
    channelId: "345",
    postEmojis: <PostEmojis>[],
    id: "13",
    displayName: "princess",
    statusIcon: "6️⃣",
    userImage: 'assets/images/user.png',
    moment: '4 hours ago',
    postDate: '20:23',
    message: 'Co ask',
  ),
  UserThreadPost(
    channelId: "345",
    postEmojis: <PostEmojis>[],
    id: "14",
    displayName: "pauleke65",
    statusIcon: "6️⃣",
    userImage: 'assets/images/user.png',
    moment: '4 hours ago',
    postDate: '20:23',
    message: "I'm also interested",
  ),
  UserThreadPost(
    channelId: "345",
    postEmojis: <PostEmojis>[],
    id: "15",
    displayName: "FreshFish",
    statusIcon: "6️⃣",
    userImage: 'assets/images/user.png',
    moment: '4 hours ago',
    postDate: '20:23',
    message: 'What track are you?',
  ),
  UserThreadPost(
    channelId: "345",
    postEmojis: <PostEmojis>[],
    id: "16",
    displayName: "Sticklo",
    statusIcon: "6️⃣",
    userImage: 'assets/images/user.png',
    moment: '4 hours ago',
    postDate: '20:23',
    message: 'Team',
  ),
  UserThreadPost(
    channelId: "345",
    postEmojis: <PostEmojis>[],
    id: "17",
    displayName: "EunicePops",
    statusIcon: "6️⃣",
    userImage: 'assets/images/user.png',
    moment: '4 hours ago',
    postDate: '20:23',
    message: '[@Abdul:51515151] is his Slack name',
  ),
];

List<PostEmojis> postEmoji1 = [
  PostEmojis(id: 1, postEmoji: '😀', postEmojiCount: 3, hasReacted: false),
];
List<PostEmojis> postEmoji2 = [
  PostEmojis(id: 5, postEmoji: '😀', postEmojiCount: 2),
];

List<UserPost> userPost = [
  UserPost(
      id: "11",
      displayName: "richieoscar",
      postDate: "Sept 19 at 9:56am",
      message:
          'Please who is the team lead for mobile track? I have some questions please',
      userImage: 'assets/images/1.png',
      statusIcon: "4️⃣",
      moment: '4 hours ago',
      postEmojis: <PostEmojis>[],
      userThreadPosts: thread3,
      channelType: ChannelType.private,
      channelName: 'team-app',
      channelId: ""),
  UserPost(
      id: "5",
      displayName: "Nonso",
      userImage: "assets/images/chimamanda.png",
      statusIcon: "6️⃣",
      moment: '4 hours ago',
      message: 'Designers and Developers in Mega...',
      postEmojis: postEmoji1,
      userThreadPosts: thread1,
      channelType: ChannelType.private,
      channelName: 'team-app',
      channelId: ""),
  UserPost(
      id: "6",
      displayName: "Dee",
      userImage: "assets/images/chimamanda.png",
      statusIcon: "6️⃣",
      moment: '4 hours ago',
      message: 'How are you',
      postEmojis: postEmoji2,
      userThreadPosts: thread2,
      channelType: ChannelType.personal,
      channelName: 'Dee',
      channelId: ""),
  UserPost(
    id: "7",
    displayName: "Mark",
    userImage: "assets/images/chimamanda.png",
    statusIcon: "6️⃣",
    moment: '4 hours ago',
    message: 'Fire on the MOUNTAINNNNN!!!!!, Run, Run Run, Runnnnnn',
    channelType: ChannelType.public,
    channelName: 'Announcement',
    postEmojis: <PostEmojis>[],
    channelId: "",
    userThreadPosts: <UserThreadPost>[],
  ),
];
