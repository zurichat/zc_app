enum ConnectivityStatus { wifi, mobile, online, offline }

enum DialogType {
  skinTone,
  selectLanguage,
  feedback,
  themeMode,
  deleteChannel,
  deleteMessage,
  signOut,
  remindMe,
  deleteDraft,
  scheduleMessageDm,
  scheduleMessageChannel,
  imageSource,
}

enum ChannelType { private, public, personal }

enum CustomUserProfileButtonType { normal, icon }

enum ThreadCardType { threadMain, threadDetail, threadPost, threadChannelMain }

enum PostFileType { text, app }

enum BottomSheetType { user, emojiPicker, floatingBox, threadOptions, signOut }

enum HomeListType {
  unreads,
  channels,
  messages,
}

enum OrganizationSwitchMethod {
  create,
  signIn,
  join,
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
