import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng/constants/local_keys.dart';
import 'package:hng/services/localization_service.dart';

class AppLocalization {
  ///TODO: Remove late
  late Map<String, String> _sentences;
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  Future<bool> load() async {
    final path = 'assets/language/${locale.languageCode}.json';
    final data = await rootBundle.loadString(path);
    final Map<String, dynamic> _result = json.decode(data);

    _sentences = <String, String>{};
    _result.forEach((String key, dynamic value) {
      _sentences[key] = value.toString();
    });

    return true;
  }

  String translate(String key) {
    return _sentences[key]!;
  }

  /// static member to have simple access to the delegate from Material App
  static const LocalizationsDelegate<AppLocalization> delegate =
      AppLocalizationDelegate();

  /// List of available local strings that the app can use
  /// translated from the corresponding .json language files
  String get threads => translate(LocalKeys.Threads);
  String get unreads => translate(LocalKeys.Unreads);
  String get channels => translate(LocalKeys.Channels);
  String get directMessages => translate(LocalKeys.DirectMessages);
  String get homeNavBar => translate(LocalKeys.HomeNavBar);
  String get pluginsNavBar => translate(LocalKeys.PluginsNavBar);
  String get dmNavBar => translate(LocalKeys.DmNavBar);
  String get youNavBar => translate(LocalKeys.YouNavBar);
  String get onboardingTitleOne => translate(LocalKeys.OnboardingTitleOne);
  String get onboardingSubtitleOne =>
      translate(LocalKeys.OnboardingSubtitleOne);
  String get onboardingTitleTwo => translate(LocalKeys.OnboardingTitleTwo);
  String get onboardingSubtitleTwo =>
      translate(LocalKeys.OnboardingSubtitleTwo);
  String get onboardingTitleThree => translate(LocalKeys.OnboardingTitleThree);
  String get onboardingSubtitleThree =>
      translate(LocalKeys.OnboardingSubtitleThree);
  String get getstarted => translate(LocalKeys.Getstarted);
  String get skip => translate(LocalKeys.Skip);
  String get next => translate(LocalKeys.Next);
  String get signUp => translate(LocalKeys.SignUp);
  String get pleaseSignUp => translate(LocalKeys.Pleasesignupuptocreateaccount);
  String get firstName => translate(LocalKeys.FirstName);
  String get firstNameHintText => translate(LocalKeys.John);
  String get lastName => translate(LocalKeys.LastName);
  String get lastNameHintText => translate(LocalKeys.Doe);
  String get emailAddress => translate(LocalKeys.EmailAddress);
  String get emailHintText => translate(LocalKeys.HintText);
  String get password => translate(LocalKeys.Password);
  String get passwordHintText => translate(LocalKeys.HintPassword);
  String get confirmPassword => translate(LocalKeys.ConfirmPassword);
  String get confirmPasswordHinText => translate(LocalKeys.HintConfirmPassword);
  String get tnC1 => translate(LocalKeys.TermsConditionsStatement);
  String get tnC2 => translate(LocalKeys.TermsAndConditions);
  String get createAccount => translate(LocalKeys.CreateAccount);
  String get alreadyHaveAcct => translate(LocalKeys.AlreadyHaveAccount);
  String get signIn => translate(LocalKeys.SignInText);
  String get signUpGoogle => translate(LocalKeys.SignUpGoogle);
  String get welcomeSignIn => translate(LocalKeys.SignInGreeting);
  String get forgotPassword => translate(LocalKeys.ForgotPassword);
  String get dontHaveAccount => translate(LocalKeys.DontHaveAccount);
  String get workspaces => translate(LocalKeys.Workspaces);
  String get addOrg => translate(LocalKeys.AddOrganization);
  String get preferences => translate(LocalKeys.Preferences);
  String get help => translate(LocalKeys.Help);
  String get signOutAccount => translate(LocalKeys.SignOutAllOrganization);
  String get signOut => translate(LocalKeys.SignOut);
  String get addOrganizations => translate(LocalKeys.AddOrganizations);
  String get signInWorkspace =>
      translate(LocalKeys.SignInToAnotherOrganization);
  String get joinWorkspace => translate(LocalKeys.JoinAnotherOrganization);
  String get createWorkspace => translate(LocalKeys.CreateNewOrganization);
  String get langAndRegion => translate(LocalKeys.LanguageAndRegions);
  String get darkMode => translate(LocalKeys.DarkMode);
  String get darkModeOff => translate(LocalKeys.DarkModeOff);
  String get darkModeOn => translate(LocalKeys.DarkModeOn);
  String get cancel => translate(LocalKeys.Cancel);
  String get apply => translate(LocalKeys.Apply);
  String get advanced => translate(LocalKeys.Advanced);
  String get sendFeedback => translate(LocalKeys.SendFeedback);
  String get helpCenter => translate(LocalKeys.HelpCenter);
  String get privacyNLicenses => translate(LocalKeys.PrivacyLicenses);
  String get language => translate(LocalKeys.Language);
  String get setTimezone => translate(LocalKeys.SetTimeZone);
  String get emojiDeluxe => translate(LocalKeys.EmojiDeluxe);
  String get emojiDeluxeSubititle => translate(LocalKeys.EmojiDeluxeSubititle);
  String get showPreviewsSubtitle => translate(LocalKeys.ShowPreviewsSubtitle);
  String get showPreviews => translate(LocalKeys.ShowPreviews);
  String get openWebPages => translate(LocalKeys.OpenWebPages);
  String get openWebPagesSubtitle => translate(LocalKeys.OpenWebPagesSubtitle);
  String get typingIndicator => translate(LocalKeys.TypingIndicator);
  String get typingIndicatorSubtitle =>
      translate(LocalKeys.TypingIndicatorSubtitle);
  String get animateEmoji => translate(LocalKeys.AnimateEmoji);
  String get animateEmojiSubtitle => translate(LocalKeys.AnimateEmojiSubtitle);
  String get optimiseImage => translate(LocalKeys.OptimiseImage);
  String get optimiseImageSubtitle =>
      translate(LocalKeys.OptimiseImageSubtitle);
  String get resetCache => translate(LocalKeys.ResetCache);
  String get forceStop => translate(LocalKeys.ForceStop);
  String get unsavedDataWarning => translate(LocalKeys.UnsavedDataWarning);
  String get composeFeedback => translate(LocalKeys.ComposeFeedback);
  String get feedbackHint => translate(LocalKeys.FeedbackExample);
  String get feedbackHelperText => translate(LocalKeys.FeedbackResponse);
  String get ok => translate(LocalKeys.Ok);
  String get jumpTo => translate(LocalKeys.JumpToHint);
  String get reply => translate(LocalKeys.Reply);
  String get plugins => translate(LocalKeys.Plugins);
  String get addPlugin => translate(LocalKeys.AddPlugin);
  String get todoPlugin => translate(LocalKeys.TodoPlugin);
  String get salesPlugin => translate(LocalKeys.SalesPlugin);
  String get noticeBoardPlugin => translate(LocalKeys.NoticeBoardPlugin);
  String get goalsPlugin => translate(LocalKeys.GoalsPlugin);
  String get musicPlugin => translate(LocalKeys.MusicPlugin);
  String get active => translate(LocalKeys.Active);
  String get away => translate(LocalKeys.Away);
  String get statusHint => translate(LocalKeys.StatusHint);
  String get pauseNotifications => translate(LocalKeys.PauseNotifications);
  String get getOnlineStatus => translate(LocalKeys.GetOnlineStatus);
  String get savedItems => translate(LocalKeys.SavedItems);
  String get viewProfile => translate(LocalKeys.ViewProfile);
  String get notifications => translate(LocalKeys.Notifications);
  String get dontClear => translate(LocalKeys.DontClear);
  String get thirtyMins => translate(LocalKeys.ThirtyMins);
  String get oneHour => translate(LocalKeys.OneHour);
  String get twoHours => translate(LocalKeys.TwoHours);
  String get fourHours => translate(LocalKeys.FourHours);
  String get thisWeek => translate(LocalKeys.ThisWeek);
  String get chooseDate => translate(LocalKeys.ChooseDate);
  String get clearAfter => translate(LocalKeys.ClearAfter);
  String get recent => translate(LocalKeys.Recent);
  String get inMeeting => translate(LocalKeys.InMeeting);
  String get commuting => translate(LocalKeys.Commuting);
  String get offSick => translate(LocalKeys.OffSick);
  String get onHoliday => translate(LocalKeys.OnHoliday);
  String get workingRemotely => translate(LocalKeys.WorkingRemotely);
  String get noSavedItems => translate(LocalKeys.NoSavedItems);
  String get noSavedItemsSubtitle => translate(LocalKeys.NoSavedItemsSubtitle);
  String get messageButton => translate(LocalKeys.MessageButton);
  String get editProfileButton => translate(LocalKeys.EditProfileButton);
  String get whatIDo => translate(LocalKeys.WhatIDo);
  String get displayName => translate(LocalKeys.DisplayName);
  String get status => translate(LocalKeys.Status);
  String get mobileNumber => translate(LocalKeys.MobileNumber);
  String get notifyAbout => translate(LocalKeys.NotifyAbout);
  String get notifyAboutSubtitle => translate(LocalKeys.NotifyAboutSubtitle);
  String get notifyOnMobile => translate(LocalKeys.NotifyOnMobile);
  String get notifyOnMobileSubtitle =>
      translate(LocalKeys.NotifyOnMobileSubtitle);
  String get ding => translate(LocalKeys.Ding);
  String get sound => translate(LocalKeys.Sound);
  String get vibrate => translate(LocalKeys.Vibrate);
  String get light => translate(LocalKeys.Light);
  String get troubleShootNotifs => translate(LocalKeys.TroubleShootNotifs);
  String get generalSettings => translate(LocalKeys.GeneralSettings);
  String get notificationSchedule => translate(LocalKeys.NotificationSchedule);
  String get everyday => translate(LocalKeys.Everyday);
  String get inAppNotify => translate(LocalKeys.InAppNotify);
  String get myKeyword => translate(LocalKeys.MyKeyword);
  String get myKeywordSubtitle => translate(LocalKeys.MyKeywordSubtitle);
  String get channelSpecificNotify =>
      translate(LocalKeys.ChannelSpecificNotify);
  String get markUnread => translate(LocalKeys.MarkUnread);
  String get remindMe => translate(LocalKeys.RemindMe);
  String get addSavedItems => translate(LocalKeys.AddSavedItems);
  String get replyInThread => translate(LocalKeys.ReplyInThread);
  String get followThread => translate(LocalKeys.FollowThread);
  String get shareMessage => translate(LocalKeys.ShareMessage);
  String get copyLinkToMessage => translate(LocalKeys.CopyLinkToMessage);
  String get copyText => translate(LocalKeys.CopyText);
  String get pinToConversation => translate(LocalKeys.PinToConversation);
  String get questionIntoPoll => translate(LocalKeys.QuestionIntoPoll);
  String get messageIn => translate(LocalKeys.MessageIn);
  String get addAReply => translate(LocalKeys.AddAReply);
  String get replies => translate(LocalKeys.Replies);
  String get saved => translate(LocalKeys.Saved);
  String get addedSuccessfully => translate(LocalKeys.AddedSuccessfully);
  String get noNewReplies => translate(LocalKeys.NoNewReplies);
  String get pluginIntroHeader => translate(LocalKeys.PluginIntroHeader);
  String get pluginIntroBody => translate(LocalKeys.PluginIntroBody);
  String get notJoinedOrg => translate(LocalKeys.NotJoinedOrg);
  String get selectEmailToUse => translate(LocalKeys.SelectEmailToUse);
  String get yourEmailAddress => translate(LocalKeys.YourEmailAddress);
  String get dontKnowWorkspaceUrl => translate(LocalKeys.DontKnowWorkspaceUrl);
  String get helpSignInEasily => translate(LocalKeys.HelpSignInEasily);
  String get enterWorkSpacesUrl => translate(LocalKeys.EnterWorkSpacesUrl);
  String get sendEmailForSignin => translate(LocalKeys.SendEmailForSignin);
  String get done => translate(LocalKeys.Done);
  String get invitedAsAZuriChatMember =>
      translate(LocalKeys.InvitedAsAZuriChatMember);
  String get invitationSent => translate(LocalKeys.InvitationSent);
  String get invite => translate(LocalKeys.Invite);
  String get sendRequest => translate(LocalKeys.SendRequest);
  String get chooseContacts => translate(LocalKeys.ChooseContacts);
  String get inviteForAdminApproval =>
      translate(LocalKeys.InviteForAdminApproval);
  String get send => translate(LocalKeys.Send);
  String get coworkersToJoin => translate(LocalKeys.CoworkersToJoin);
  String get addEmailAddress => translate(LocalKeys.AddEmailAddress);
  String get inviteFromContacts => translate(LocalKeys.InviteFromContacts);
  String get shareImage => translate(LocalKeys.SavedItems);
  String get shareInviteLink => translate(LocalKeys.ShareInviteLink);
  String get shareLinkText => translate(LocalKeys.ShareLinkText);
  String get knowAnyCoworkers => translate(LocalKeys.KnowAnyCoworkers);
  String get changeExpiryDateText => translate(LocalKeys.ChangeExpiryDateText);
  String get checkYourMail => translate(LocalKeys.CheckYourMail);
  String get confirmEmailText => translate(LocalKeys.ConfirmEmailText);
  String get openEmailApp => translate(LocalKeys.OpenEmailApp);
  String get companyName => translate(LocalKeys.CompanyName);
  String get companyAnd => translate(LocalKeys.CompanyAnd);
  String get cookiePolicy => translate(LocalKeys.CookiePolicy);
  String get customerAgreementText =>
      translate(LocalKeys.CustomerAgreementText);
  String get projectName => translate(LocalKeys.ProjectName);
  String get projectHint => translate(LocalKeys.ProjectHint);
  String get teammateNames => translate(LocalKeys.TeammateNames);
  String get addTeammates => translate(LocalKeys.AddTeammates);
  String get inAppNotifySubtitle => translate(LocalKeys.InAppNotifySubtitle);
  String get forgotPasswordHeader => translate(LocalKeys.ForgotPasswordHeader);
  String get invalidEmail => translate(LocalKeys.InvalidEmail);
  String get continueButton => translate(LocalKeys.Continue);
  String get backTo => translate(LocalKeys.BackTo);
  String get newPasswordHeader => translate(LocalKeys.NewPasswordHeader);
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return LocalizationService()
        .supportedLocalCodes
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    final localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}

class FallbackCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return LocalizationService()
        .supportedLocalCodes
        .contains(locale.languageCode);
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return DefaultCupertinoLocalizations.load(locale);
  }

  @override
  bool shouldReload(FallbackCupertinoLocalizationsDelegate old) => false;
}
