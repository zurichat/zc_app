class OrganizationMemberModelList {
  final List<OrganizationMemberModel> data;
  final int? status;
  final String? message;

  OrganizationMemberModelList(
      {required this.data, required this.status, required this.message});

  factory OrganizationMemberModelList.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<OrganizationMemberModel> memberList =
        list.map((member) => OrganizationMemberModel.fromJson(member)).toList();
    return OrganizationMemberModelList(
        data: memberList,
        status: json['status'] as int?,
        message: json['message'] as String?);
  }
}

class OrganizationMemberModel {
  final String? id;
  final String? bio;
  final bool? deleted;
  final String? deletedAt;
  final String? displayName;
  final String? email;
  final String? firstName;
  final String? imageUrl;
  final String? joinedAt;
  final String? language;
  final String? lastName;
  final String? name;
  final String? orgId;
  final String? phone;
  final String? presence;
  final String? pronouns;
  final String? role;
  final String? socials;
  final List? status;
  final String? timeZone;
  final String? userName;

  OrganizationMemberModel({
    required this.id,
    required this.bio,
    required this.email,
    this.status,
    required this.phone,
    required this.deleted,
    required this.deletedAt,
    required this.displayName,
    required this.firstName,
    required this.imageUrl,
    required this.joinedAt,
    required this.language,
    required this.lastName,
    required this.name,
    required this.orgId,
    required this.presence,
    required this.pronouns,
    required this.role,
    required this.socials,
    required this.timeZone,
    required this.userName,
  });

  factory OrganizationMemberModel.fromJson(Map<String, dynamic> json) {
    return OrganizationMemberModel(
        id: json['_id'] ?? json['id'] as String?,
        bio: json['bio'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        deleted: json['deleted'] as bool?,
        deletedAt: json['deleted_at'] as String?,
        displayName: json['display_name'] as String?,
        firstName: json['first_name'] as String?,
        imageUrl: json['image_url'] as String?,
        joinedAt: json['joined_at'] as String?,
        language: json['language'] as String?,
        lastName: json['last_name'] as String?,
        name: json['name'] as String?,
        orgId: json['org_id'] as String?,
        presence: json['presence'] as String?,
        pronouns: json['pronouns'] as String?,
        role: json['role'] as String?,
        socials: json['socials'] as String?,
        timeZone: json['time_zone'] as String?,
        userName: json['user_name'] as String?);
  }
}

class Settings {
  final MessagesAndMedia? messagesAndMedia;
  final Notifications? notifications;
  final Sidebar? sidebar;
  final Themes? themes;
  final ChatSettings? chatSettings;

  Settings(
      {required this.messagesAndMedia,
      required this.notifications,
      required this.sidebar,
      required this.themes,
      required this.chatSettings});

  factory Settings.fromJson(Map<String?, dynamic> json) {
    return Settings(
      messagesAndMedia: MessagesAndMedia.fromJson(json['messages_and_media']),
      notifications: Notifications.fromJson(json['notifications']),
      sidebar: Sidebar.fromJson(json['sidebar']),
      themes: Themes.fromJson(json['themes']),
      chatSettings: ChatSettings.fromJson(json['chat_settings']),
    );
  }
}

class ChatSettings {
  final bool? enterIsSend;
  final int? fontSize;
  final bool? mediaVisibility;
  final String? theme;
  final String? wallpaper;

  ChatSettings({
    required this.enterIsSend,
    required this.fontSize,
    required this.mediaVisibility,
    required this.theme,
    required this.wallpaper,
  });

  factory ChatSettings.fromJson(Map<String?, dynamic> json) {
    return ChatSettings(
        enterIsSend: json['enter_is_send'] as bool?,
        fontSize: json['font_size'] as int?,
        mediaVisibility: json['media_visibility'] as bool?,
        theme: json['theme'] as String?,
        wallpaper: json['wallpaper'] as String?);
  }
}

class MessagesAndMedia {
  final String? additionalOptions;
  final String? bringEmailsIntoZuri;
  final bool? convertEmotionsToEmoji;
  final bool? custom;
  final String? emoji;
  final bool? emojiAsText;
  final bool? frequentlyUsedEmoji;
  final String? inlineMediaAndLinks;
  final String? messagesOnClickReaction;
  final String? names;
  final bool? showJumbomoji;
  final String? themes;

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
    required this.messagesOnClickReaction,
    required this.names,
    required this.showJumbomoji,
  });

  factory MessagesAndMedia.fromJson(Map<String?, dynamic> json) {
    return MessagesAndMedia(
        themes: json['themes'] as String?,
        additionalOptions: json['additional_options'] as String?,
        bringEmailsIntoZuri: json['bring_emails_into_zuri'] as String?,
        custom: json['custom'] as bool?,
        emoji: json['emoji'] as String?,
        emojiAsText: json['emoji_as_text'] as bool?,
        frequentlyUsedEmoji: json['frequently_used_emoji'] as bool?,
        inlineMediaAndLinks: json['inline_media_and_links'] as String?,
        messagesOnClickReaction: json['messages_on_click_reaction'] as String?,
        names: json['names'] as String?,
        showJumbomoji: json['show_jumbomoji'] as bool?,
        convertEmotionsToEmoji: json['convert_emoticons_to_emoji'] as bool?);
  }
}

class Notifications {
  final bool? channelHurdleNotification;
  final String? emailNotificationForMentionsAndDm;
  final bool? messagePreviewInEachNotification;
  final bool? muteAllSounds;
  final String? myKeywords;
  final String? notificationSchedule;
  final String? notifyMeAbout;
  final bool? threadRepliesNotification;
  final String? useDifferentSettingsMobile;
  final String? whenIamNotActiveOnDesktop;

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

  factory Notifications.fromJson(Map<String?, dynamic> json) {
    return Notifications(
        channelHurdleNotification: json['channel_hurdle_notification'] as bool?,
        emailNotificationForMentionsAndDm:
            json['email_notification_for_mention_and_dm'] as String?,
        messagePreviewInEachNotification:
            json['messages_preview_in_each_notification'] as bool?,
        muteAllSounds: json['mute_all_sound'] as bool?,
        myKeywords: json['my_keywords'] as String?,
        notificationSchedule: json['notification_schedule'] as String?,
        notifyMeAbout: json['notify_me_about'] as String?,
        threadRepliesNotification: json['thread_replies_notification'] as bool?,
        useDifferentSettingsMobile:
            json['use_different_settings_mobile'] as String?,
        whenIamNotActiveOnDesktop:
            json['when_i_am_not_active_on_desktop'] as String?);
  }
}

class Sidebar {
  final String? alwaysShowInTheSidebar;
  final bool? listPrivateChannelsSeperately;
  final bool? organizeExternalConversations;
  final String? showConversations;
  final bool? showProfilePictureNextToDm;
  final String? sidebarSort;

  Sidebar({
    required this.alwaysShowInTheSidebar,
    required this.listPrivateChannelsSeperately,
    required this.organizeExternalConversations,
    required this.showConversations,
    required this.showProfilePictureNextToDm,
    required this.sidebarSort,
  });

  factory Sidebar.fromJson(Map<String?, dynamic> json) {
    return Sidebar(
      alwaysShowInTheSidebar: json['channel_hurdle_notification'] as String?,
      listPrivateChannelsSeperately:
          json['list_private_channels_seperately'] as bool?,
      organizeExternalConversations:
          json['organize_external_conversations'] as bool?,
      showConversations: json['show_conversations'] as String?,
      showProfilePictureNextToDm:
          json['show_profile_picture_next_to_dm'] as bool?,
      sidebarSort: json['sidebar_sort'] as String?,
    );
  }
}

class Themes {
  final String? colors;
  final String? themes;

  Themes({
    required this.themes,
    required this.colors,
  });

  factory Themes.fromJson(Map<String?, dynamic> json) {
    return Themes(themes: json['themes'], colors: json['colors'] as String?);
  }
}

class Sidebars {
  final String? checkSpelling;

  Sidebars({required this.checkSpelling});

  factory Sidebars.fromJson(Map<String?, dynamic> json) {
    return Sidebars(
      checkSpelling: json['check_spelling'] as String?,
    );
  }
}

class GlobalSettings {
  final bool? allowOnlyAdminInvite;
  final bool? allowUserAddPlugins;

  GlobalSettings({
    required this.allowOnlyAdminInvite,
    required this.allowUserAddPlugins,
  });

  factory GlobalSettings.fromJson(Map<String?, dynamic> json) {
    return GlobalSettings(
        allowOnlyAdminInvite: json['allow_only_admin_invite'] as bool?,
        allowUserAddPlugins: json['allow_user_add_plugins'] as bool?);
  }
}

class PluginSettings {
  final String? chessPlugin;

  PluginSettings({
    required this.chessPlugin,
  });

  factory PluginSettings.fromJson(Map<String?, dynamic> json) {
    return PluginSettings(
      chessPlugin: json['chess_plugin'] as String?,
    );
  }
}
