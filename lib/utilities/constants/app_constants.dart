import 'package:flutter/cupertino.dart';

const apiBaseUrl = 'https://api.zuri.chat';
//* Client data

//* Messages
const serverErrorMessage = 'An error occured. Please try again.';
const networkErrorMessage = 'Please check your internet'
    ' connection and try again';
//* Defaults
const defaultAvatarAsset = 'assets/images/fire_cracker.png';
const defaultNetworkImage = 'https://placeimg.com/300/550/nature';
const mainAppBarLogo = AssetImage(
  'assets/background/appBarLogo.png',
);
const threadIcon = 'assets/icons/thread_icon.png';
const homeIcon = 'assets/icons/home_icon.png';
const draftIcon = 'assets/icons/draft_icon.png';
const integrateIcon = 'assets/icons/integrate_icon.png';
const dmIcon = 'assets/icons/message_icon.png';
const youIcon = 'assets/icons/user.png';
const lockIconShaded = 'assets/icons/lock_icon_shaded.png';
const lockIcon = 'assets/icons/lock_icon.png';

const appBarLogo = AssetImage('assets/logo/zuri_app_logo2.png');
const zuriWordLogo = AssetImage('assets/logo/Zuri_word_logo.png');
const dummyUserImage = 'assets/background/bga.png';

const double zSideMargin = 16;

const channelsBaseUrl = 'https://channels.zuri.chat/api/';
const dmsBaseUrl = 'https://dm.zuri.chat/dmapi';
const dmsBaseUrlSend = 'https://dm.zuri.chat/api';
const coreBaseUrl = 'https://api.zuri.chat/';
const websocketUrl = 'wss://realtime.zuri.chat/connection/websocket';

const String LOCALE_VAL = 'localeVal';
const int DEFAULT_LOCALE_VAL = 0;

Iterable<Locale> supportedLocalesList = const [
  Locale('en', 'US'),
  Locale('de', 'DE'),
  Locale('ar', 'SA'),
  Locale('zh', 'HK'),
  Locale('es', 'ES'),
  Locale('ja', 'JP'),
  Locale('he', 'IL'),
  Locale('it', 'IT'),
  Locale('pt', 'BR')
];
