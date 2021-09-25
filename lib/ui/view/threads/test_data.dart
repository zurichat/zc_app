import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/utilities/enums.dart';

List<UserThreadPost> thread1 = [
  UserThreadPost(
    postEmojis: <PostEmojis>[],
    id: 1,
    displayName: 'PrincessLiz',
    statusIcon: Icons.looks_6,
    lastSeen: '4 hours ago',
    userImage: 'assets/images/chimamanda.png',
    message: 'Are you in team Socrates?',
  ),
  UserThreadPost(
    postEmojis: <PostEmojis>[],
    id: 2,
    displayName: 'PrincessLiz',
    statusIcon: Icons.looks_6,
    userImage: 'assets/images/chimamanda.png',
    lastSeen: '4 hours ago',
    message: '[@Blazebrain:51515151]',
  ),
];

List<UserThreadPost> thread2 = [
  UserThreadPost(
    postEmojis: <PostEmojis>[],
    id: 3,
    displayName: 'PrincessLiz',
    statusIcon: Icons.looks_6,
    lastSeen: '4 hours ago',
    userImage: 'assets/images/chimamanda.png',
    message: 'I am fine. You?',
  ),
  UserThreadPost(
    postEmojis: <PostEmojis>[],
    id: 4,
    displayName: 'Dee',
    statusIcon: Icons.looks_6,
    userImage: 'assets/images/chimamanda.png',
    lastSeen: '4 hours ago',
    message: 'How are You',
  ),
];

List<UserThreadPost> thread3 = [
  UserThreadPost(
    postEmojis: <PostEmojis>[],
    id: 12,
    displayName: 'mark',
    statusIcon: Icons.looks_6,
    userImage: 'assets/images/user.png',
    lastSeen: '4 hours ago',
    postDate: '20:23',
    message: 'I think you cans ask on help channel',
  ),
  UserThreadPost(
    postEmojis: <PostEmojis>[],
    id: 13,
    displayName: 'princess',
    statusIcon: Icons.looks_6,
    userImage: 'assets/images/user.png',
    lastSeen: '4 hours ago',
    postDate: '20:23',
    message: 'Co ask',
  ),
  UserThreadPost(
    postEmojis: <PostEmojis>[],
    id: 14,
    displayName: 'pauleke65',
    statusIcon: Icons.looks_6,
    userImage: 'assets/images/user.png',
    lastSeen: '4 hours ago',
    postDate: '20:23',
    message: "I'm also interested",
  ),
  UserThreadPost(
    postEmojis: <PostEmojis>[],
    id: 15,
    displayName: 'FreshFish',
    statusIcon: Icons.looks_6,
    userImage: 'assets/images/user.png',
    lastSeen: '4 hours ago',
    postDate: '20:23',
    message: 'What track are you?',
  ),
  UserThreadPost(
    postEmojis: <PostEmojis>[],
    id: 16,
    displayName: 'Sticklo',
    statusIcon: Icons.looks_6,
    userImage: 'assets/images/user.png',
    lastSeen: '4 hours ago',
    postDate: '20:23',
    message: 'Team',
  ),
  UserThreadPost(
    postEmojis: <PostEmojis>[],
    id: 17,
    displayName: 'EunicePops',
    statusIcon: Icons.looks_6,
    userImage: 'assets/images/user.png',
    lastSeen: '4 hours ago',
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
    id: 11,
    displayName: 'richieoscar',
    postDate: 'Sept 19 at 9:56am',
    message:
        'Please who is the team lead for mobile track? I have some questions please',
    userImage: 'assets/images/1.png',
    statusIcon: Icons.looks_4,
    lastSeen: '4 hours ago',
    postEmojis: <PostEmojis>[],
    userThreadPosts: thread3,
    channelType: ChannelType.private,
    channelName: 'team-app',
  ),
  UserPost(
    id: 5,
    displayName: 'Nonso',
    userImage: 'assets/images/chimamanda.png',
    statusIcon: Icons.looks_6,
    lastSeen: '4 hours ago',
    message: 'Designers and Developers in Mega...',
    postEmojis: postEmoji1,
    userThreadPosts: thread1,
    channelType: ChannelType.private,
    channelName: 'team-app',
  ),
  UserPost(
    id: 6,
    displayName: 'Dee',
    userImage: 'assets/images/chimamanda.png',
    statusIcon: Icons.looks_6,
    lastSeen: '4 hours ago',
    message: 'How are you',
    postEmojis: postEmoji2,
    userThreadPosts: thread2,
    channelType: ChannelType.personal,
    channelName: 'Dee',
  ),
  UserPost(
    id: 7,
    displayName: 'Mark',
    userImage: 'assets/images/chimamanda.png',
    statusIcon: Icons.looks_6,
    lastSeen: '4 hours ago',
    message: 'Fire on the MOUNTAINNNNN!!!!!, Run, Run Run, Runnnnnn',
    channelType: ChannelType.public,
    channelName: 'Announcement',
    postEmojis: <PostEmojis>[],
    userThreadPosts: <UserThreadPost>[],
  ),
];
