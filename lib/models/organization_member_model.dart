class OrganizationMemberModel {
  final String id;
  final String bio;
  final bool deleted;
  final String deletedAt;
  final String displayName;
  final String email;
  final dynamic files;
  final String firstName;
  final dynamic globalSettings;
  final String imageUrl;
  final String joinedAt;
  final String language;
  final String lastName;
  final String name;
  final String orgId;
  final String phone;
  final String pluginSettings;
  final bool presence;
  final String pronouns;
  final String role;
  final dynamic settings;
  final String sidebars;
  final dynamic socials;
  final String status;
  final dynamic timeZone;
  final String userName;

  OrganizationMemberModel({
    required this.id,
    required this.bio,
    required this.email,
    required this.status,
    required this.phone,
    required this.deleted,
    required this.deletedAt,
    required this.displayName,
    required this.files,
    required this.firstName,
    required this.globalSettings,
    required this.imageUrl,
    required this.joinedAt,
    required this.language,
    required this.lastName,
    required this.name,
    required this.orgId,
    required this.pluginSettings,
    required this.presence,
    required this.pronouns,
    required this.role,
    required this.settings,
    required this.sidebars,
    required this.socials,
    required this.timeZone,
    required this.userName,
  });

  factory OrganizationMemberModel.fromJson(Map<String, dynamic> json) {
    return OrganizationMemberModel(
        id: json['_id'] ?? json['id'],
        bio: json['bio'],
        email: json['email'],
        status: json['status'],
        phone: json['phone'],
        deleted: json['deleted'],
        deletedAt: json['deleted_at'],
        displayName: json['display_name'],
        files: json['files'],
        firstName: json['first_name'],
        globalSettings: json['global_settings'],
        imageUrl: json['image_url'],
        joinedAt: json['joined_at'],
        language: json['language'],
        lastName: json['last_name'],
        name: json['name'],
        orgId: json['org_id'],
        pluginSettings: json['plugin_settings'],
        presence: json['presence'],
        pronouns: json['pronouns'],
        role: json['role'],
        settings: json['settings'],
        sidebars: json['sidebars'],
        socials: json['socials'],
        timeZone: json['time_zone'],
        userName: json['user_name']);
  }
}

class Settings {
  final String messagesAndMedia;
  final String notifications;
  final String sidebar;
  final String themes;
  final String chatSettings;

  Settings(
      {required this.messagesAndMedia,
      required this.notifications,
      required this.sidebar,
      required this.themes,
      required this.chatSettings});
}

class ChatSettings {
  final bool enterIsSend;
  final int fontSize;
  final bool mediaVisibility;
  final String theme;
  final String wallpaper;

  ChatSettings({
    required this.enterIsSend,
    required this.fontSize,
    required this.mediaVisibility,
    required this.theme,
    required this.wallpaper,
  });
}

class MessagesAndMedia {
  final String additionalOptions;
  final String bringEmailsIntoZuri;
  final bool convertEmotionsToEmoji;
  final bool custom;
  final String emoji;
  final bool emojiAsText;
  final bool frequentlyUsedEmoji;
  final String inlineMediaAndLinks;
  final String messagesOneClickReaction;
  final String names;
  final bool showJumbomoji;
  final String themes;

  MessagesAndMedia({
    required this.themes,
    required this.additionalOptions,
    required this.bringEmailsIntoZuri,
    required this.convertEmotionsToEmoji,
    required this.custom,
    required this.emoji,
    required this.emojiAsText,
    required this.frequentlyUsedEmoji,
    required this.inlineMediaAndLinks,
    required this.messagesOneClickReaction,
    required this.names,
    required this.showJumbomoji,
  });
}

class Notifications {
  final bool channelHurdleNotification;
  final String emailNotificationForMentionsAndDm;
  final bool messagePreviewInEachNotification;
  final bool muteAllSounds;
  final String myKeywords;
  final String notificationSchedule;
  final String notifyMeAbout;
  final bool threadRepliesNotification;
  final String useDifferentSettingsMobile;
  final String whenIamNotActiveOnDesktop;

  Notifications({
    required this.channelHurdleNotification,
    required this.emailNotificationForMentionsAndDm,
    required this.messagePreviewInEachNotification,
    required this.muteAllSounds,
    required this.myKeywords,
    required this.notificationSchedule,
    required this.notifyMeAbout,
    required this.threadRepliesNotification,
    required this.useDifferentSettingsMobile,
    required this.whenIamNotActiveOnDesktop,
  });
}

class Sidebar {
  final String alwaysShowInTheSidebar;
  final bool listPrivateChannelsSeperately;
  final bool organizeExternalConversations;
  final String showConversations;
  final bool showProfilePictureNextToDm;
  final String sidebarSort;

  Sidebar({
    required this.alwaysShowInTheSidebar,
    required this.listPrivateChannelsSeperately,
    required this.organizeExternalConversations,
    required this.showConversations,
    required this.showProfilePictureNextToDm,
    required this.sidebarSort,
  });
}

class Themes {
  final String colors;
  final String themes;

  Themes({
    required this.themes,
    required this.colors,
  });
}

class Sidebars {
  final String checkSpelling;

  Sidebars({required this.checkSpelling});
}

class GlobalSettings {
  final bool allowOnlyAdminInvite;
  final bool allowUserAddPlugins;

  GlobalSettings({
    required this.allowOnlyAdminInvite,
    required this.allowUserAddPlugins,
  });
}

class PluginSettings {
  final String chessPlugin;

  PluginSettings({
    required this.chessPlugin,
  });
}
