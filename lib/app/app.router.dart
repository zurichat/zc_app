// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i63;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as _i64;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i71;
import 'package:zurichat/models/channel_members.dart' as _i68;
import 'package:zurichat/models/channel_model.dart' as _i69;
import 'package:zurichat/models/organization_model.dart' as _i70;
import 'package:zurichat/models/user_model.dart' as _i66;
import 'package:zurichat/models/user_post.dart' as _i67;
import 'package:zurichat/ui/nav_pages/dm_page/dm_search_find_page.dart' as _i20;
import 'package:zurichat/ui/nav_pages/home_page/home_page.dart' as _i15;
import 'package:zurichat/ui/nav_pages/nav_bar/nav_bar_view.dart' as _i3;
import 'package:zurichat/ui/nav_pages/plugin_page/plugin_view.dart' as _i22;
import 'package:zurichat/ui/view/add_people/add_people_view.dart' as _i16;
import 'package:zurichat/ui/view/advanced/advanced_view.dart' as _i30;
import 'package:zurichat/ui/view/channel/add_people/channel_add_people_view.dart'
    as _i2;
import 'package:zurichat/ui/view/channel/channel_info/channel_info_view.dart'
    as _i49;
import 'package:zurichat/ui/view/channel/channel_list/channels_view.dart'
    as _i9;
import 'package:zurichat/ui/view/channel/channel_notification/channel_notification_view.dart'
    as _i13;
import 'package:zurichat/ui/view/channel/channel_view/channel_page_view.dart'
    as _i48;
import 'package:zurichat/ui/view/channel/edit_channel/edit_channel_view.dart'
    as _i45;
import 'package:zurichat/ui/view/channel/new_channel/new_channel.dart' as _i14;
import 'package:zurichat/ui/view/channel/pinned_messages/pinned_messages_view.dart'
    as _i35;
import 'package:zurichat/ui/view/channel/share_message/share_message_view.dart'
    as _i58;
import 'package:zurichat/ui/view/clear_after/clear_after_view.dart' as _i31;
import 'package:zurichat/ui/view/direct_message/direct_message.dart' as _i50;
import 'package:zurichat/ui/view/dm_search/dm_search_view.dart' as _i17;
import 'package:zurichat/ui/view/dm_user/dm_user_view.dart' as _i19;
import 'package:zurichat/ui/view/do_not_disturb/do_not_disturb_view.dart'
    as _i32;
import 'package:zurichat/ui/view/draft/draft_view.dart' as _i41;
import 'package:zurichat/ui/view/edit_profile/edit_profile_view.dart' as _i33;
import 'package:zurichat/ui/view/file_search/file_search_view.dart' as _i40;
import 'package:zurichat/ui/view/forgot_password/forgot_password_email/forgot_password_email_view.dart'
    as _i10;
import 'package:zurichat/ui/view/forgot_password/forgot_password_new_password/forgot_password_newview.dart'
    as _i12;
import 'package:zurichat/ui/view/forgot_password/forgot_password_otp/forgot_password_otpview.dart'
    as _i11;
import 'package:zurichat/ui/view/general_search/general_search_view.dart'
    as _i39;
import 'package:zurichat/ui/view/jump_to_view/jump_to_view.dart' as _i18;
import 'package:zurichat/ui/view/language_and_region/language_and_region_view.dart'
    as _i27;
import 'package:zurichat/ui/view/login/login_view.dart' as _i5;
import 'package:zurichat/ui/view/notifications/notifications_view.dart' as _i29;
import 'package:zurichat/ui/view/onboarding/onboading_view.dart' as _i4;
import 'package:zurichat/ui/view/organization/add_organization/add_organization_view.dart'
    as _i37;
import 'package:zurichat/ui/view/organization/create_organization/create_organization.dart'
    as _i38;
import 'package:zurichat/ui/view/organization/invite_to_organization/admin_permissions/create_invite_link.dart'
    as _i56;
import 'package:zurichat/ui/view/organization/invite_to_organization/admin_permissions/invite_via_email.dart'
    as _i54;
import 'package:zurichat/ui/view/organization/invite_to_organization/invitation_sent.dart'
    as _i57;
import 'package:zurichat/ui/view/organization/invite_to_organization/invite_via_contact/import_contact.dart'
    as _i55;
import 'package:zurichat/ui/view/organization/invite_to_organization/invite_via_email/invite_via_email.dart'
    as _i53;
import 'package:zurichat/ui/view/organization/organization_different_email/different_email_organization_view.dart'
    as _i23;
import 'package:zurichat/ui/view/organization/organization_settings/organization_logo.dart'
    as _i61;
import 'package:zurichat/ui/view/organization/organization_settings/organization_name_url.dart'
    as _i60;
import 'package:zurichat/ui/view/organization/organization_settings/organization_settings_view.dart'
    as _i59;
import 'package:zurichat/ui/view/organization/organization_url/organization_url_view.dart'
    as _i47;
import 'package:zurichat/ui/view/organization/organization_view/organization_view.dart'
    as _i8;
import 'package:zurichat/ui/view/organization/select_email/select_email_view.dart'
    as _i36;
import 'package:zurichat/ui/view/otp/otp_view.dart' as _i6;
import 'package:zurichat/ui/view/plugins/add_plugin_view.dart' as _i62;
import 'package:zurichat/ui/view/popup_notification/popup_notification.dart'
    as _i34;
import 'package:zurichat/ui/view/preference/preference_view.dart' as _i26;
import 'package:zurichat/ui/view/profile_page/profile_page_view.dart' as _i25;
import 'package:zurichat/ui/view/saved_items/saved_items_view.dart' as _i28;
import 'package:zurichat/ui/view/set_status/set_status_view.dart' as _i24;
import 'package:zurichat/ui/view/sign_up/sign_up_view.dart' as _i7;
import 'package:zurichat/ui/view/splashscreen/splashscreen.dart' as _i21;
import 'package:zurichat/ui/view/start_dm/start_dm_view.dart' as _i46;
import 'package:zurichat/ui/view/static_pages/terms_and_conditions/terms_and_conditions_view.dart'
    as _i51;
import 'package:zurichat/ui/view/threads/all_threads/threads_view.dart' as _i42;
import 'package:zurichat/ui/view/threads/thread_detail/thread_detail_view.dart'
    as _i43;
import 'package:zurichat/ui/view/user_search/user_search_view.dart' as _i44;
import 'package:zurichat/ui/view/webview_page/webview_page.dart' as _i52;
import 'package:zurichat/utilities/enums.dart' as _i65;

class Routes {
  static const channelAddPeopleView = '/channel-add-people-view';

  static const navBarView = '/nav-bar-view';

  static const onboardingView = '/onboarding-view';

  static const loginView = '/login-view';

  static const oTPView = '/o-tp-view';

  static const signUpView = '/sign-up-view';

  static const organizationView = '/organization-view';

  static const channelList = '/channel-list';

  static const forgotPasswordEmailView = '/forgot-password-email-view';

  static const forgotPasswordOtpView = '/forgot-password-otp-view';

  static const forgotPasswordNewView = '/forgot-password-new-view';

  static const channelNotificationView = '/channel-notification-view';

  static const newChannel = '/new-channel';

  static const homePage = '/home-page';

  static const addPeopleView = '/add-people-view';

  static const dmSearch = '/dm-search';

  static const jumpToView = '/jump-to-view';

  static const dmUserView = '/dm-user-view';

  static const dmScreen = '/dm-screen';

  static const splashview = '/';

  static const pluginPage = '/plugin-page';

  static const useDifferentEmailView = '/use-different-email-view';

  static const setStatusView = '/set-status-view';

  static const profilePageView = '/profile-page-view';

  static const preferenceView = '/preference-view';

  static const languageAndRegionModelView = '/language-and-region-model-view';

  static const savedItemsView = '/saved-items-view';

  static const notificationsView = '/notifications-view';

  static const advancedView = '/advanced-view';

  static const clearAfterView = '/clear-after-view';

  static const doNotDisturbView = '/do-not-disturb-view';

  static const editProfileView = '/edit-profile-view';

  static const popUpNotificationsView = '/pop-up-notifications-view';

  static const pinnedMessagesView = '/pinned-messages-view';

  static const selectEmail = '/select-email';

  static const addOrganizationView = '/add-organization-view';

  static const createOrganization = '/create-organization';

  static const generalSearchView = '/general-search-view';

  static const fileSearchView = '/file-search-view';

  static const draftView = '/draft-view';

  static const threadsView = '/threads-view';

  static const threadDetailView = '/thread-detail-view';

  static const userSearchView = '/user-search-view';

  static const editChannelPageView = '/edit-channel-page-view';

  static const startDmView = '/start-dm-view';

  static const organizationUrlView = '/organization-url-view';

  static const channelPageView = '/channel-page-view';

  static const channelInfoView = '/channel-info-view';

  static const directMessage = '/direct-message';

  static const termsAndConditionsView = '/terms-and-conditions-view';

  static const webViewPage = '/web-view-page';

  static const inviteViaEmail = '/invite-via-email';

  static const inviteViaEmailAdmin = '/invite-via-email-admin';

  static const importContacts = '/import-contacts';

  static const createInviteLink = '/create-invite-link';

  static const invitationSent = '/invitation-sent';

  static const shareMessageView = '/share-message-view';

  static const organizationSettingsView = '/organization-settings-view';

  static const organizationNameUrl = '/organization-name-url';

  static const organizationLogo = '/organization-logo';

  static const addPluginView = '/add-plugin-view';

  static const all = <String>{
    channelAddPeopleView,
    navBarView,
    onboardingView,
    loginView,
    oTPView,
    signUpView,
    organizationView,
    channelList,
    forgotPasswordEmailView,
    forgotPasswordOtpView,
    forgotPasswordNewView,
    channelNotificationView,
    newChannel,
    homePage,
    addPeopleView,
    dmSearch,
    jumpToView,
    dmUserView,
    dmScreen,
    splashview,
    pluginPage,
    useDifferentEmailView,
    setStatusView,
    profilePageView,
    preferenceView,
    languageAndRegionModelView,
    savedItemsView,
    notificationsView,
    advancedView,
    clearAfterView,
    doNotDisturbView,
    editProfileView,
    popUpNotificationsView,
    pinnedMessagesView,
    selectEmail,
    addOrganizationView,
    createOrganization,
    generalSearchView,
    fileSearchView,
    draftView,
    threadsView,
    threadDetailView,
    userSearchView,
    editChannelPageView,
    startDmView,
    organizationUrlView,
    channelPageView,
    channelInfoView,
    directMessage,
    termsAndConditionsView,
    webViewPage,
    inviteViaEmail,
    inviteViaEmailAdmin,
    importContacts,
    createInviteLink,
    invitationSent,
    shareMessageView,
    organizationSettingsView,
    organizationNameUrl,
    organizationLogo,
    addPluginView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.channelAddPeopleView,
      page: _i2.ChannelAddPeopleView,
    ),
    _i1.RouteDef(
      Routes.navBarView,
      page: _i3.NavBarView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i4.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.oTPView,
      page: _i6.OTPView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i7.SignUpView,
    ),
    _i1.RouteDef(
      Routes.organizationView,
      page: _i8.OrganizationView,
    ),
    _i1.RouteDef(
      Routes.channelList,
      page: _i9.ChannelList,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordEmailView,
      page: _i10.ForgotPasswordEmailView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordOtpView,
      page: _i11.ForgotPasswordOtpView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordNewView,
      page: _i12.ForgotPasswordNewView,
    ),
    _i1.RouteDef(
      Routes.channelNotificationView,
      page: _i13.ChannelNotificationView,
    ),
    _i1.RouteDef(
      Routes.newChannel,
      page: _i14.NewChannel,
    ),
    _i1.RouteDef(
      Routes.homePage,
      page: _i15.HomePage,
    ),
    _i1.RouteDef(
      Routes.addPeopleView,
      page: _i16.AddPeopleView,
    ),
    _i1.RouteDef(
      Routes.dmSearch,
      page: _i17.DmSearch,
    ),
    _i1.RouteDef(
      Routes.jumpToView,
      page: _i18.JumpToView,
    ),
    _i1.RouteDef(
      Routes.dmUserView,
      page: _i19.DmUserView,
    ),
    _i1.RouteDef(
      Routes.dmScreen,
      page: _i20.DmScreen,
    ),
    _i1.RouteDef(
      Routes.splashview,
      page: _i21.Splashview,
    ),
    _i1.RouteDef(
      Routes.pluginPage,
      page: _i22.PluginPage,
    ),
    _i1.RouteDef(
      Routes.useDifferentEmailView,
      page: _i23.UseDifferentEmailView,
    ),
    _i1.RouteDef(
      Routes.setStatusView,
      page: _i24.SetStatusView,
    ),
    _i1.RouteDef(
      Routes.profilePageView,
      page: _i25.ProfilePageView,
    ),
    _i1.RouteDef(
      Routes.preferenceView,
      page: _i26.PreferenceView,
    ),
    _i1.RouteDef(
      Routes.languageAndRegionModelView,
      page: _i27.LanguageAndRegionModelView,
    ),
    _i1.RouteDef(
      Routes.savedItemsView,
      page: _i28.SavedItemsView,
    ),
    _i1.RouteDef(
      Routes.notificationsView,
      page: _i29.NotificationsView,
    ),
    _i1.RouteDef(
      Routes.advancedView,
      page: _i30.AdvancedView,
    ),
    _i1.RouteDef(
      Routes.clearAfterView,
      page: _i31.ClearAfterView,
    ),
    _i1.RouteDef(
      Routes.doNotDisturbView,
      page: _i32.DoNotDisturbView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i33.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.popUpNotificationsView,
      page: _i34.PopUpNotificationsView,
    ),
    _i1.RouteDef(
      Routes.pinnedMessagesView,
      page: _i35.PinnedMessagesView,
    ),
    _i1.RouteDef(
      Routes.selectEmail,
      page: _i36.SelectEmail,
    ),
    _i1.RouteDef(
      Routes.addOrganizationView,
      page: _i37.AddOrganizationView,
    ),
    _i1.RouteDef(
      Routes.createOrganization,
      page: _i38.CreateOrganization,
    ),
    _i1.RouteDef(
      Routes.generalSearchView,
      page: _i39.GeneralSearchView,
    ),
    _i1.RouteDef(
      Routes.fileSearchView,
      page: _i40.FileSearchView,
    ),
    _i1.RouteDef(
      Routes.draftView,
      page: _i41.DraftView,
    ),
    _i1.RouteDef(
      Routes.threadsView,
      page: _i42.ThreadsView,
    ),
    _i1.RouteDef(
      Routes.threadDetailView,
      page: _i43.ThreadDetailView,
    ),
    _i1.RouteDef(
      Routes.userSearchView,
      page: _i44.UserSearchView,
    ),
    _i1.RouteDef(
      Routes.editChannelPageView,
      page: _i45.EditChannelPageView,
    ),
    _i1.RouteDef(
      Routes.startDmView,
      page: _i46.StartDmView,
    ),
    _i1.RouteDef(
      Routes.organizationUrlView,
      page: _i47.OrganizationUrlView,
    ),
    _i1.RouteDef(
      Routes.channelPageView,
      page: _i48.ChannelPageView,
    ),
    _i1.RouteDef(
      Routes.channelInfoView,
      page: _i49.ChannelInfoView,
    ),
    _i1.RouteDef(
      Routes.directMessage,
      page: _i50.DirectMessage,
    ),
    _i1.RouteDef(
      Routes.termsAndConditionsView,
      page: _i51.TermsAndConditionsView,
    ),
    _i1.RouteDef(
      Routes.webViewPage,
      page: _i52.WebViewPage,
    ),
    _i1.RouteDef(
      Routes.inviteViaEmail,
      page: _i53.InviteViaEmail,
    ),
    _i1.RouteDef(
      Routes.inviteViaEmailAdmin,
      page: _i54.InviteViaEmailAdmin,
    ),
    _i1.RouteDef(
      Routes.importContacts,
      page: _i55.ImportContacts,
    ),
    _i1.RouteDef(
      Routes.createInviteLink,
      page: _i56.CreateInviteLink,
    ),
    _i1.RouteDef(
      Routes.invitationSent,
      page: _i57.InvitationSent,
    ),
    _i1.RouteDef(
      Routes.shareMessageView,
      page: _i58.ShareMessageView,
    ),
    _i1.RouteDef(
      Routes.organizationSettingsView,
      page: _i59.OrganizationSettingsView,
    ),
    _i1.RouteDef(
      Routes.organizationNameUrl,
      page: _i60.OrganizationNameUrl,
    ),
    _i1.RouteDef(
      Routes.organizationLogo,
      page: _i61.OrganizationLogo,
    ),
    _i1.RouteDef(
      Routes.addPluginView,
      page: _i62.AddPluginView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.ChannelAddPeopleView: (data) {
      final args = data.getArgs<ChannelAddPeopleViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i2.ChannelAddPeopleView(
            key: args.key,
            channelId: args.channelId,
            channelName: args.channelName),
        settings: data,
      );
    },
    _i3.NavBarView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i3.NavBarView(),
        settings: data,
      );
    },
    _i4.OnboardingView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i4.OnboardingView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i5.LoginView(key: args.key),
        settings: data,
      );
    },
    _i6.OTPView: (data) {
      final args = data.getArgs<OTPViewArguments>(
        orElse: () => const OTPViewArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i6.OTPView(key: args.key),
        settings: data,
      );
    },
    _i7.SignUpView: (data) {
      final args = data.getArgs<SignUpViewArguments>(
        orElse: () => const SignUpViewArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i7.SignUpView(key: args.key),
        settings: data,
      );
    },
    _i8.OrganizationView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i8.OrganizationView(),
        settings: data,
      );
    },
    _i9.ChannelList: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i9.ChannelList(),
        settings: data,
      );
    },
    _i10.ForgotPasswordEmailView: (data) {
      final args = data.getArgs<ForgotPasswordEmailViewArguments>(
        orElse: () => const ForgotPasswordEmailViewArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i10.ForgotPasswordEmailView(key: args.key),
        settings: data,
      );
    },
    _i11.ForgotPasswordOtpView: (data) {
      final args = data.getArgs<ForgotPasswordOtpViewArguments>(
        orElse: () => const ForgotPasswordOtpViewArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i11.ForgotPasswordOtpView(key: args.key),
        settings: data,
      );
    },
    _i12.ForgotPasswordNewView: (data) {
      final args = data.getArgs<ForgotPasswordNewViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i12.ForgotPasswordNewView(key: args.key, otp: args.otp),
        settings: data,
      );
    },
    _i13.ChannelNotificationView: (data) {
      final args = data.getArgs<ChannelNotificationViewArguments>(
        orElse: () => const ChannelNotificationViewArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i13.ChannelNotificationView(
            key: args.key, channelName: args.channelName),
        settings: data,
      );
    },
    _i14.NewChannel: (data) {
      final args = data.getArgs<NewChannelArguments>(
        orElse: () => const NewChannelArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i14.NewChannel(key: args.key),
        settings: data,
      );
    },
    _i15.HomePage: (data) {
      final args = data.getArgs<HomePageArguments>(
        orElse: () => const HomePageArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i15.HomePage(
            key: args.key, organizationLogo: args.organizationLogo),
        settings: data,
      );
    },
    _i16.AddPeopleView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i16.AddPeopleView(),
        settings: data,
      );
    },
    _i17.DmSearch: (data) {
      final args = data.getArgs<DmSearchArguments>(
        orElse: () => const DmSearchArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i17.DmSearch(key: args.key),
        settings: data,
      );
    },
    _i18.JumpToView: (data) {
      final args = data.getArgs<JumpToViewArguments>(
        orElse: () => const JumpToViewArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i18.JumpToView(key: args.key),
        settings: data,
      );
    },
    _i19.DmUserView: (data) {
      final args = data.getArgs<DmUserViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i19.DmUserView(key: args.key, friendID: args.friendID),
        settings: data,
      );
    },
    _i20.DmScreen: (data) {
      final args = data.getArgs<DmScreenArguments>(
        orElse: () => const DmScreenArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i20.DmScreen(key: args.key),
        settings: data,
      );
    },
    _i21.Splashview: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i21.Splashview(),
        settings: data,
      );
    },
    _i22.PluginPage: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i22.PluginPage(),
        settings: data,
      );
    },
    _i23.UseDifferentEmailView: (data) {
      final args = data.getArgs<UseDifferentEmailViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i23.UseDifferentEmailView(key: args.key, method: args.method),
        settings: data,
      );
    },
    _i24.SetStatusView: (data) {
      final args = data.getArgs<SetStatusViewArguments>(
        orElse: () => const SetStatusViewArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i24.SetStatusView(key: args.key),
        settings: data,
      );
    },
    _i25.ProfilePageView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i25.ProfilePageView(),
        settings: data,
      );
    },
    _i26.PreferenceView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i26.PreferenceView(),
        settings: data,
      );
    },
    _i27.LanguageAndRegionModelView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i27.LanguageAndRegionModelView(),
        settings: data,
      );
    },
    _i28.SavedItemsView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i28.SavedItemsView(),
        settings: data,
      );
    },
    _i29.NotificationsView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i29.NotificationsView(),
        settings: data,
      );
    },
    _i30.AdvancedView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i30.AdvancedView(),
        settings: data,
      );
    },
    _i31.ClearAfterView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i31.ClearAfterView(),
        settings: data,
      );
    },
    _i32.DoNotDisturbView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i32.DoNotDisturbView(),
        settings: data,
      );
    },
    _i33.EditProfileView: (data) {
      final args = data.getArgs<EditProfileViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i33.EditProfileView(key: args.key, user: args.user),
        settings: data,
      );
    },
    _i34.PopUpNotificationsView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i34.PopUpNotificationsView(),
        settings: data,
      );
    },
    _i35.PinnedMessagesView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i35.PinnedMessagesView(),
        settings: data,
      );
    },
    _i36.SelectEmail: (data) {
      final args = data.getArgs<SelectEmailArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i36.SelectEmail(key: args.key, method: args.method),
        settings: data,
      );
    },
    _i37.AddOrganizationView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i37.AddOrganizationView(),
        settings: data,
      );
    },
    _i38.CreateOrganization: (data) {
      final args = data.getArgs<CreateOrganizationArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i38.CreateOrganization(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i39.GeneralSearchView: (data) {
      final args = data.getArgs<GeneralSearchViewArguments>(
        orElse: () => const GeneralSearchViewArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i39.GeneralSearchView(key: args.key),
        settings: data,
      );
    },
    _i40.FileSearchView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i40.FileSearchView(),
        settings: data,
      );
    },
    _i41.DraftView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i41.DraftView(),
        settings: data,
      );
    },
    _i42.ThreadsView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i42.ThreadsView(),
        settings: data,
      );
    },
    _i43.ThreadDetailView: (data) {
      final args = data.getArgs<ThreadDetailViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i43.ThreadDetailView(args.userPost, key: args.key),
        settings: data,
      );
    },
    _i44.UserSearchView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i44.UserSearchView(),
        settings: data,
      );
    },
    _i45.EditChannelPageView: (data) {
      final args = data.getArgs<EditChannelPageViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i45.EditChannelPageView(
            key: args.key,
            channelName: args.channelName,
            channelId: args.channelId),
        settings: data,
      );
    },
    _i46.StartDmView: (data) {
      final args = data.getArgs<StartDmViewArguments>(
        orElse: () => const StartDmViewArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i46.StartDmView(key: args.key),
        settings: data,
      );
    },
    _i47.OrganizationUrlView: (data) {
      final args = data.getArgs<OrganizationUrlViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i47.OrganizationUrlView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i48.ChannelPageView: (data) {
      final args = data.getArgs<ChannelPageViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i48.ChannelPageView(
            key: args.key,
            channelName: args.channelName,
            channelId: args.channelId,
            membersCount: args.membersCount,
            public: args.public),
        settings: data,
      );
    },
    _i49.ChannelInfoView: (data) {
      final args = data.getArgs<ChannelInfoViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i49.ChannelInfoView(
            key: args.key,
            numberOfMembers: args.numberOfMembers,
            channelMembers: args.channelMembers,
            channelDetail: args.channelDetail,
            channelName: args.channelName),
        settings: data,
      );
    },
    _i50.DirectMessage: (data) {
      final args = data.getArgs<DirectMessageArguments>(
        orElse: () => const DirectMessageArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i50.DirectMessage(key: args.key, username: args.username),
        settings: data,
      );
    },
    _i51.TermsAndConditionsView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i51.TermsAndConditionsView(),
        settings: data,
      );
    },
    _i52.WebViewPage: (data) {
      final args = data.getArgs<WebViewPageArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i52.WebViewPage(name: args.name, url: args.url, key: args.key),
        settings: data,
      );
    },
    _i53.InviteViaEmail: (data) {
      final args = data.getArgs<InviteViaEmailArguments>(
        orElse: () => const InviteViaEmailArguments(),
      );
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => _i53.InviteViaEmail(key: args.key),
        settings: data,
      );
    },
    _i54.InviteViaEmailAdmin: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i54.InviteViaEmailAdmin(),
        settings: data,
      );
    },
    _i55.ImportContacts: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i55.ImportContacts(),
        settings: data,
      );
    },
    _i56.CreateInviteLink: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i56.CreateInviteLink(),
        settings: data,
      );
    },
    _i57.InvitationSent: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i57.InvitationSent(),
        settings: data,
      );
    },
    _i58.ShareMessageView: (data) {
      final args = data.getArgs<ShareMessageViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i58.ShareMessageView(userPost: args.userPost, key: args.key),
        settings: data,
      );
    },
    _i59.OrganizationSettingsView: (data) {
      final args =
          data.getArgs<OrganizationSettingsViewArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i59.OrganizationSettingsView(key: args.key, org: args.org),
        settings: data,
      );
    },
    _i60.OrganizationNameUrl: (data) {
      final args = data.getArgs<OrganizationNameUrlArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i60.OrganizationNameUrl(key: args.key, org: args.org),
        settings: data,
      );
    },
    _i61.OrganizationLogo: (data) {
      final args = data.getArgs<OrganizationLogoArguments>(nullOk: false);
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i61.OrganizationLogo(key: args.key, org: args.org),
        settings: data,
      );
    },
    _i62.AddPluginView: (data) {
      return _i63.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i62.AddPluginView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ChannelAddPeopleViewArguments {
  const ChannelAddPeopleViewArguments({
    this.key,
    required this.channelId,
    required this.channelName,
  });

  final _i64.Key? key;

  final String channelId;

  final String channelName;
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i64.Key? key;
}

class OTPViewArguments {
  const OTPViewArguments({this.key});

  final _i64.Key? key;
}

class SignUpViewArguments {
  const SignUpViewArguments({this.key});

  final _i64.Key? key;
}

class ForgotPasswordEmailViewArguments {
  const ForgotPasswordEmailViewArguments({this.key});

  final _i64.Key? key;
}

class ForgotPasswordOtpViewArguments {
  const ForgotPasswordOtpViewArguments({this.key});

  final _i64.Key? key;
}

class ForgotPasswordNewViewArguments {
  const ForgotPasswordNewViewArguments({
    this.key,
    required this.otp,
  });

  final _i64.Key? key;

  final String otp;
}

class ChannelNotificationViewArguments {
  const ChannelNotificationViewArguments({
    this.key,
    this.channelName,
  });

  final _i64.Key? key;

  final String? channelName;
}

class NewChannelArguments {
  const NewChannelArguments({this.key});

  final _i64.Key? key;
}

class HomePageArguments {
  const HomePageArguments({
    this.key,
    this.organizationLogo,
  });

  final _i64.Key? key;

  final _i64.Widget? organizationLogo;
}

class DmSearchArguments {
  const DmSearchArguments({this.key});

  final _i64.Key? key;
}

class JumpToViewArguments {
  const JumpToViewArguments({this.key});

  final _i64.Key? key;
}

class DmUserViewArguments {
  const DmUserViewArguments({
    this.key,
    required this.friendID,
  });

  final _i64.Key? key;

  final String friendID;
}

class DmScreenArguments {
  const DmScreenArguments({this.key});

  final _i64.Key? key;
}

class UseDifferentEmailViewArguments {
  const UseDifferentEmailViewArguments({
    this.key,
    required this.method,
  });

  final _i64.Key? key;

  final _i65.OrganizationSwitchMethod method;
}

class SetStatusViewArguments {
  const SetStatusViewArguments({this.key});

  final _i64.Key? key;
}

class EditProfileViewArguments {
  const EditProfileViewArguments({
    this.key,
    required this.user,
  });

  final _i64.Key? key;

  final _i66.UserModel user;
}

class SelectEmailArguments {
  const SelectEmailArguments({
    this.key,
    required this.method,
  });

  final _i64.Key? key;

  final _i65.OrganizationSwitchMethod method;
}

class CreateOrganizationArguments {
  const CreateOrganizationArguments({
    this.key,
    required this.email,
  });

  final _i64.Key? key;

  final String email;
}

class GeneralSearchViewArguments {
  const GeneralSearchViewArguments({this.key});

  final _i64.Key? key;
}

class ThreadDetailViewArguments {
  const ThreadDetailViewArguments({
    required this.userPost,
    this.key,
  });

  final _i67.UserPost? userPost;

  final _i64.Key? key;
}

class EditChannelPageViewArguments {
  const EditChannelPageViewArguments({
    this.key,
    required this.channelName,
    this.channelId,
  });

  final _i64.Key? key;

  final String channelName;

  final String? channelId;
}

class StartDmViewArguments {
  const StartDmViewArguments({this.key});

  final _i64.Key? key;
}

class OrganizationUrlViewArguments {
  const OrganizationUrlViewArguments({
    this.key,
    required this.email,
  });

  final _i64.Key? key;

  final String email;
}

class ChannelPageViewArguments {
  const ChannelPageViewArguments({
    this.key,
    required this.channelName,
    required this.channelId,
    required this.membersCount,
    required this.public,
  });

  final _i64.Key? key;

  final String? channelName;

  final String? channelId;

  final int? membersCount;

  final bool? public;
}

class ChannelInfoViewArguments {
  const ChannelInfoViewArguments({
    this.key,
    required this.numberOfMembers,
    required this.channelMembers,
    required this.channelDetail,
    required this.channelName,
  });

  final _i64.Key? key;

  final int numberOfMembers;

  final List<_i68.ChannelMember> channelMembers;

  final _i69.ChannelModel channelDetail;

  final String channelName;
}

class DirectMessageArguments {
  const DirectMessageArguments({
    this.key,
    this.username,
  });

  final _i64.Key? key;

  final String? username;
}

class WebViewPageArguments {
  const WebViewPageArguments({
    required this.name,
    required this.url,
    this.key,
  });

  final String name;

  final String url;

  final _i64.Key? key;
}

class InviteViaEmailArguments {
  const InviteViaEmailArguments({this.key});

  final _i64.Key? key;
}

class ShareMessageViewArguments {
  const ShareMessageViewArguments({
    required this.userPost,
    this.key,
  });

  final _i67.UserPost userPost;

  final _i64.Key? key;
}

class OrganizationSettingsViewArguments {
  const OrganizationSettingsViewArguments({
    this.key,
    required this.org,
  });

  final _i64.Key? key;

  final _i70.OrganizationModel org;
}

class OrganizationNameUrlArguments {
  const OrganizationNameUrlArguments({
    this.key,
    required this.org,
  });

  final _i64.Key? key;

  final _i70.OrganizationModel org;
}

class OrganizationLogoArguments {
  const OrganizationLogoArguments({
    this.key,
    required this.org,
  });

  final _i64.Key? key;

  final _i70.OrganizationModel org;
}

extension NavigatorStateExtension on _i71.NavigationService {
  Future<dynamic> navigateToChannelAddPeopleView({
    _i64.Key? key,
    required String channelId,
    required String channelName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.channelAddPeopleView,
        arguments: ChannelAddPeopleViewArguments(
            key: key, channelId: channelId, channelName: channelName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNavBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.navBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOTPView({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.oTPView,
        arguments: OTPViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signUpView,
        arguments: SignUpViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrganizationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.organizationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChannelList([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.channelList,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordEmailView({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.forgotPasswordEmailView,
        arguments: ForgotPasswordEmailViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordOtpView({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.forgotPasswordOtpView,
        arguments: ForgotPasswordOtpViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordNewView({
    _i64.Key? key,
    required String otp,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.forgotPasswordNewView,
        arguments: ForgotPasswordNewViewArguments(key: key, otp: otp),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChannelNotificationView({
    _i64.Key? key,
    String? channelName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.channelNotificationView,
        arguments: ChannelNotificationViewArguments(
            key: key, channelName: channelName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNewChannel({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.newChannel,
        arguments: NewChannelArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomePage({
    _i64.Key? key,
    _i64.Widget? organizationLogo,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homePage,
        arguments:
            HomePageArguments(key: key, organizationLogo: organizationLogo),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddPeopleView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addPeopleView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDmSearch({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.dmSearch,
        arguments: DmSearchArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToJumpToView({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.jumpToView,
        arguments: JumpToViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDmUserView({
    _i64.Key? key,
    required String friendID,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.dmUserView,
        arguments: DmUserViewArguments(key: key, friendID: friendID),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDmScreen({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.dmScreen,
        arguments: DmScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPluginPage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pluginPage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUseDifferentEmailView({
    _i64.Key? key,
    required _i65.OrganizationSwitchMethod method,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.useDifferentEmailView,
        arguments: UseDifferentEmailViewArguments(key: key, method: method),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSetStatusView({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.setStatusView,
        arguments: SetStatusViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfilePageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profilePageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPreferenceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.preferenceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLanguageAndRegionModelView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.languageAndRegionModelView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSavedItemsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.savedItemsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdvancedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.advancedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToClearAfterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.clearAfterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDoNotDisturbView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.doNotDisturbView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditProfileView({
    _i64.Key? key,
    required _i66.UserModel user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editProfileView,
        arguments: EditProfileViewArguments(key: key, user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPopUpNotificationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.popUpNotificationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPinnedMessagesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pinnedMessagesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSelectEmail({
    _i64.Key? key,
    required _i65.OrganizationSwitchMethod method,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.selectEmail,
        arguments: SelectEmailArguments(key: key, method: method),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddOrganizationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addOrganizationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateOrganization({
    _i64.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createOrganization,
        arguments: CreateOrganizationArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGeneralSearchView({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.generalSearchView,
        arguments: GeneralSearchViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFileSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.fileSearchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDraftView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.draftView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToThreadsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.threadsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToThreadDetailView({
    required _i67.UserPost? userPost,
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.threadDetailView,
        arguments: ThreadDetailViewArguments(userPost: userPost, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.userSearchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditChannelPageView({
    _i64.Key? key,
    required String channelName,
    String? channelId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editChannelPageView,
        arguments: EditChannelPageViewArguments(
            key: key, channelName: channelName, channelId: channelId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartDmView({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.startDmView,
        arguments: StartDmViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrganizationUrlView({
    _i64.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.organizationUrlView,
        arguments: OrganizationUrlViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChannelPageView({
    _i64.Key? key,
    required String? channelName,
    required String? channelId,
    required int? membersCount,
    required bool? public,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.channelPageView,
        arguments: ChannelPageViewArguments(
            key: key,
            channelName: channelName,
            channelId: channelId,
            membersCount: membersCount,
            public: public),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChannelInfoView({
    _i64.Key? key,
    required int numberOfMembers,
    required List<_i68.ChannelMember> channelMembers,
    required _i69.ChannelModel channelDetail,
    required String channelName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.channelInfoView,
        arguments: ChannelInfoViewArguments(
            key: key,
            numberOfMembers: numberOfMembers,
            channelMembers: channelMembers,
            channelDetail: channelDetail,
            channelName: channelName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDirectMessage({
    _i64.Key? key,
    String? username,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.directMessage,
        arguments: DirectMessageArguments(key: key, username: username),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTermsAndConditionsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.termsAndConditionsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWebViewPage({
    required String name,
    required String url,
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.webViewPage,
        arguments: WebViewPageArguments(name: name, url: url, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInviteViaEmail({
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.inviteViaEmail,
        arguments: InviteViaEmailArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInviteViaEmailAdmin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.inviteViaEmailAdmin,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToImportContacts([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.importContacts,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateInviteLink([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createInviteLink,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInvitationSent([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.invitationSent,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShareMessageView({
    required _i67.UserPost userPost,
    _i64.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.shareMessageView,
        arguments: ShareMessageViewArguments(userPost: userPost, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrganizationSettingsView({
    _i64.Key? key,
    required _i70.OrganizationModel org,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.organizationSettingsView,
        arguments: OrganizationSettingsViewArguments(key: key, org: org),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrganizationNameUrl({
    _i64.Key? key,
    required _i70.OrganizationModel org,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.organizationNameUrl,
        arguments: OrganizationNameUrlArguments(key: key, org: org),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrganizationLogo({
    _i64.Key? key,
    required _i70.OrganizationModel org,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.organizationLogo,
        arguments: OrganizationLogoArguments(key: key, org: org),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddPluginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addPluginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
