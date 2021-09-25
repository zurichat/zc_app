enum ConnectivityStatus { Wifi, Mobile, Online, Offline }

enum DialogType {
  skinTone,
  selectLanguage,
  feedback,
  themeMode,
  deleteChannel,
  deleteMessage
}

enum ChannelType { private, public, personal }

enum CustomUserProfileButtonType { normal, icon }

enum ThreadCardType { threadMain, threadDetail, threadPost, threadChannelMain }

enum BottomSheetType {
  user,
  emojiPicker,
  FloatingBox,
  threadOptions,
}

enum HomeListType {
  unreads,
  channels,
  messages,
}

enum OrganizationSwitchMethod {
  Create,
  SignIn,
  Join,
}

/// The type of snackbar to show
enum SnackbarType {
  success,
  failure,
}

enum HomeItemType {
  channels,
  dm,
}
