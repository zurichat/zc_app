const String appName = 'Zuri Chat';
const String zuri = 'ZURI';

//Snackbar
const String noInternet = 'No internet connection, connect and try again.';
const String fillAllFields = 'Please fill all fields.';
const String errorEncounteredLogin = 'Error encountered during login.';
const String checkEmailForOTP =
    'Please check your email for your one-time password';
const String acceptTnC = 'You must accept T & C to signup';
const String errorEncounteredSignUp = 'Error encountered during signup.';
const String invalidEmailFormat = 'Invalid email format';
const String passwordsMustMatch = 'Passwords do not match';
const String passwordUpdated = 'Password Successfully Updated';
const String passwordNotUpdated = 'Password could not be updated';
const String errorOccurred = 'An Error Occurred';
const String errorOTP = 'OTP could not be validated';
const String wrongOTP = 'Wrong OTP, please check again';
const String UpdateSuccessful = 'Update successful';
const String UpdateFailed = 'Update failed';
const String FetchError = 'Error fetching info';
const String ChannelUpdateError = 'Error encountered during channel update';
const String DeleteOrgError = 'Delete organization failed';
const String ComingSoon = 'Coming soon!!';

//API Endpoints
const String loginEndpoint = '/auth/login';
const String signUpEndpoint = '/users';
const String resetPasswordEndpoint = '/account/update-password/';
const String requestOTPEndpoint = 'account/request-password-reset-code';
const String verifyOTPEndpoint = '/account/verify-reset-password';
const String verifyAcctEndpoint = 'account/verify-account';
const String ChannelInfoEndpoint = 'v1/1/channels/';

/// Full endpoint is users/{userID}
const String userDataEndpoint = 'users/';

//Auth Screens
const String SignIn = 'Sign In';
const String WelcomeSignIn = 'Welcome! Sign in to continue';
const String EmailAddress = 'Email Address';
const String EmailHintText = 'Name@gmail.com';
const String Password = 'Password';
const String PasswordHintText = 'Enter Password';
const String ForgotPasswordBtn = 'Forgot Password?';
const String ForgotPassword = 'Forgot Password';
const String DontHaveAccount = 'Don\'t have an account?';
const String SignUp = 'Sign Up';
const String PleaseSignUp = 'Please sign up to create account';
const String ConfirmPassword = 'Confirm Password';
const String ConfirmPasswordHinText = 'Re-enter password';
const String CreateAccount = 'Create Account';
const String AlreadyHaveAcct = 'Already  have an Account?';
const String Or = 'or';
const String SignUpGoogle = 'Sign Up with Google';
const String TnC1 = 'By selecting this box, you agreed to our';
const String TnC2 = 'terms and conditions';
const String NewPasswordHeader =
    'Your new password must be different from the previously used password';
const String NewPassword = 'New Password';
const String PasswordLengthWarning = 'Password Must be at least 6 characters';
const String Continue = 'Continue';
const String InvalidEmail = 'invalid email address';
const String BackTo = 'Back to ';
// ignore: todo
//TODO - appStr
const String Header = 'Please enter the email used in registering this account';
const String DidntRecieveOTP = 'Didn\'t receive any code? ';
const String Resend = 'Resend';
const String EnterOTP = 'Enter the 6-digit OTP sent to your email';
const String EnterNewPassword = 'Please enter a new password';
const String OTP = 'One-Time Password';
const String BackToLogin = 'Back to login';

//Home
const String Home = 'Home';
const String Unreads = 'Unreads';
const String Channels = 'Channels';
const String DMs = 'Direct Messages';
const String JumpTo = 'Jump to...';
const String hash = ' # ';
const String AddChannels = 'Add channels';
const String Threads = 'Threads';

//DM
const String DmTitle = 'Dm';
const String DM = 'Direct Message';
const String Done = 'Done';
const String UserSearchHint = 'To: Type the name of a person or channel';

//Plugins
const String Plugins = 'Plugins';
const String Calendar = 'Holiday-Calender';
const String Todo = 'To-do';
const String Chess = 'Chess Room';
const String Meeting = 'Meeting Room';
const String Board = 'Notice Board';
const String Music = 'Music Room';
const String Shifts = 'Duty Shift';
const String Deadlines = 'Important Deadline';

//You
const String You = 'You';
const String PauseNotifs = 'Pause Notifications';
const String Preferences = 'Preferences';
const String Notifs = 'Notifications';
const String ViewProfile = 'View Profile';
const String SavedItems = 'Saved Items';
const String SetStatusText = 'Set yourself as ';
const String Away = 'away';
const String StatusHintText = 'What\'s your status?';
const String Active = 'Active';

//Drafts
const String Draft = 'Draft';

//UI/Shared
const String Cancel = 'Cancel';
const String Archive = 'Archive';
const String CloseChannelWarning =
    'This will close the channel for anyone who has it open.';
const String moreReplies = 'more replies';
const String Show = 'Show';
const String DeleteMsg = 'Delete message';
const String DeleteMsgWarning =
    'Are you sure you want to delete this message?\nThis cannot be undone';
const String Delete = 'Delete';
const String Ok = 'Ok';
const String SelectLang = 'Select Language';
const String DarkMode = 'Dark mode';
const String Set = 'Set';
const String Apply = 'Apply';
const String ComposeFeedback = 'Compose feedback';
const String FeedbackHint = 'e.g I found a bug in the Dm’s';
const String FeedbackHelperText =
    'We will respond via email to feedback and questions.';
const String DefSkinTone = 'Default skin tone';
const String Emoji1 = 'assets/icons/emojiHands/1.png';
const String Emoji2 = 'assets/icons/emojiHands/2.png';
const String Emoji3 = 'assets/icons/emojiHands/3.png';
const String Emoji4 = 'assets/icons/emojiHands/4.png';
const String Emoji5 = 'assets/icons/emojiHands/5.png';
const String Emoji6 = 'assets/icons/emojiHands/6.png';
const String Emoji1DialogData = '1';
const String Emoji2DialogData = '2';
const String Emoji3DialogData = '3';
const String Emoji4DialogData = '4';
const String Emoji5DialogData = '5';
const String Emoji6DialogData = '6';
const String Msg = 'Message';
const String EditProfile = 'Edit Profile';
const String Number = 'Mobile Number';
const String StatusText = 'Status';
const String DisplayName = 'Display Name';

//Add People
const String AddEveryone = 'Add Everyone';
const String SearchPeople = 'Search people to add';
const String AddPeople = 'Add People';
const String Add = 'Add';
const String EveryoneWillBeAdded = 'Everyone will be added to channel';

//Advanced
const String Advanced = 'Advanced';
const String EmojiDeluxe = 'Emoji Deluxe';
const String EmojiDeluxeSubititle = 'Choose your default skin tone';
const String ShowPreviewsSubtitle = 'Image previews not displayed';
const String ShowPreviews = 'Show image previews';
const String OpenWebPages = 'Open web pages in app';
const String OpenWebPagesSubtitle = 'Link will open in Zuri Chat';
const String TypingIndicator = 'Display typing indicators';
const String TypingIndicatorSubtitle = 'Typing indicators will be displayed';
const String AnimateEmoji = 'Allow animated image and emoji';
const String AnimateEmojiSubtitle = 'Images and emoji can be animated';
const String OptimiseImage = 'Optimize image uploads';
const String OptimiseImageSubtitle =
    'Images are optimized for upload performance';
const String ResetCache = 'Reset Cache';
const String ForceStop = 'Force Stop';
const String UnsavedDataWarning = 'Unsaved data may be lost';

//Channel View
const String UnnamedChannel = 'Unnamed Channel';
const String NoDescription = 'No description Added';

//Channel Info
const String Bookmarks = 'Bookmarks';
const String MuteChannelWarning =
    'You wont\'t recieve any messages from a muted channel';
const String ChannelInfo = 'Channel Info';
const String Edit = 'Edit';
const String Leave = 'Leave';
const String Description = 'Description';
const String Topic = 'Topic';
const String Notifications = 'Notification';
const String EveryNewMessage = 'Every New Message';
const String MuteChannel = 'Mute Channel';
const String DeleteChannel = 'Delete Channel';
const String DeleteChannelWarning =
    'All messages from this channel will be removed from Zuri Chat. Any files uploaded to this channel would not be removed.';
const String StartCall = 'Start a call';

//Channels View
const String ChannelBrowser = 'Channel Browser';
const String SearchChannel = 'Search for channel...';
//Channel Notif
const String New = 'new';
const String ChannelNotifSubtitle = 'Settings for #teamsocrates';
const String ChannelNotifSettings =
    'This setting only applies to #teamsocrates channel.';
const String JustMentions = 'Just @mentions';
const String Mentions = 'mentions';
const String None = 'none';
const String Nothing = 'Nothing';

//Channel Search
const String TeamSocrates = '#teamsocrates';

//Channel View
const String AddDescription = 'Add Description';
const String Today = 'today';
const String AddReply = 'Add a Reply';

//Edit Channel
const String Save = 'Save';
const String EditChannel = 'Edit Channel';
const String ChannelName = 'Channel Name';
const String ChannelCreationWarning =
    'Channel names must be lowercase, without spaces or periods, and can\'t be longer than 80 characters';
const String ChannelTopic = 'Channel Topic';
const String AddTopic = 'Add a Topic';
const String ChannelDescription = 'Channel Description';
const String ChannelCreationHint = 'Set a description';

//New Channel
const String ErrorOccurredCreation = 'An error occured while creating channel';
const String Create = 'Create';
const String ErrorMsg = 'Error Message';
const String ChannelTextFieldHint = 'e.g team-uchiha';
const String ChannelCreationWarningMsg =
    'Channel names must be lowercase, without spaces or\nperiods, and can\'t be longer than 80 characters';
const String MakeChannelPrivate = 'Make channel private';
const String PrivateChannelDescription =
    'A private channel can only be viewed or joined';
const String YouAreAMember = 'You are a member';

//Clear After
const String DontClear = 'Don’t clear';
const String ThirtyMins = '30 minutes';
const String OneHour = '1 hour';
const String TwoHours = '2 hours';
const String FourHours = '4 hours';
const String ThisWeek = 'This week';
const String UntilTomorrow = 'Until Tomorrow';
const String ChooseDate = 'Choose date and time';
const String ClearAfter = 'Clear after...';
const String DateText = 'Date';
const String Time = 'Time';
const String Custom = 'Custom';

//Create Channel
const String Name = 'Name';
const String AboutChannel = 'What\'s this channel about?';
const String ChannelSettings = 'Channel Settings';
const String MakePrivate = 'Make Private';
const String PrivateDescription =
    'When channel is set to private, members of your organization can only view or join by invitation';

//DM dirs
const String ViewDetails = 'View details';
const String Recent = 'Recent';
const String DMHint = 'To: Type the name of a channel or person';
const String Yesterday = 'Yesterday';
const String CustomStartMsg1 =
    'This is the very beginning of your direct message history with ';
const String CustomStartMsgTwo =
    'Only the two of you are in this conversation, and no one else can join it.';
//Draft
const String AddDraft = 'Add draft';
//EditProfile
const String FullName = 'Full Name';
const String GettingYourData = 'Getting Your data...';
const String DisplayNameDescription =
    'This is how your name will show up in Zuri Chat. It’s best kept simple: whatever people call you in everyday conversation.';
const String Phone = 'Phone';
const String PhoneDescription = 'Enter your phone number';
const String TrackDescription = 'HNGi9 X I4G';

//Feedback
const String Alert = 'Alert';

//File Search
const String Messages = 'Messages';
const String Files = 'Files';
const String Designers = 'designers';
const String Newest = 'Newest';
const String FileImage = 'assets/images/file_image.png';
const String ImageFileName = 'image.png';
const String ImageDetails = '550KB png';

//Languages and region
const String LangAndRegion = 'Languages & Region';
const String Language = 'Language';
const String SetTimezone = 'Set time zone automatically';
const String Deutsch = 'Deutsch (Deutschland)';
const String EnglishUK = 'English (UK)';
const String EnglishUS = 'English (US)';
const String Espanol = 'Espanol (Espana)';
const String Francais = 'Francais (France)';
const String Italiano = 'Italiano (Italy)';
const String Portugues = 'Portugues (Brazil)';
const String Chinese = '陈摩托何';
const String Mandarin = '来 本 嗄';

//Notifications
const String NotifyAbout = 'On mobile, notify me about...';
const String NotifyAboutSubtitle = 'Direct messages, mentions & keywords';
const String NotifyOnMobile = 'Notify me on mobile...';
const String NotifyOnMobileSubtitle = "As soon as I'm active";
const String Ding = 'Ding';
const String Sound = 'Sound';
const String Vibrate = 'Vibrate';
const String Light = 'Light';
const String TroubleshootNotifs = 'Troubleshoot notifications';
const String GeneralSettings = 'General Settings';
const String NotificationSchedule = 'Notification Schedule';
const String Everyday = 'Everyday';
const String InAppNotif = 'In-app notification';
const String MyKeyword = 'My Keyword';
const String MyKeywordSubtitle = 'Get notified when people say...';
const String ChannelSPecificNotif = 'Channel-specific notifications (0)';

//Onboarding
const String Skip = 'Skip';
const String OnboardingOneTitle = 'Perfect Collaboration App For Teams';
const String OnboardingOneSubtitle =
    'Chat with other team members without any distractions from the world';
const String OnboardingTwoTitle = 'Music Room';
const String OnboardingTwoSubtitle =
    'Now you can listen to your favourite tracks right in the App';
const String OnboardingThreeTitle = 'Chess Room';
const String OnboardingThreeSubtitle =
    'Chat with other team members without any distractions from the world';
const String Next = 'Next';
const String GetStarted = 'Get Started';

//Organisation
const String UseAnotherEmail = 'Use another email address';
const String CreateWorkspace = 'Create a workspace';
const String SignInWorkspace = 'Sign in to a workspace';
const String JoinWorkspace = 'Join a workspace';
const String Organizations = 'Organizations';
const String NotJoinedOrgYet = 'You have not joined any organization yet!';
const String Help = 'Help';
const String AddOrg = 'Add an organisation';
const String EnterOrgUrl = 'Enter Organization URL';
const String EnterOrgUrlHint = 'https://organization.zuri.com';
const String OrgDesc1 =
    'If you don\'t know your Organization URL, we have sent an email to ';
const String OrgDesc2 = ' to help you sign in easily';
const String InputRequired = 'Input is required';
const String EnterEmail = 'Enter Email Address';
const String WillSendEmail =
    'We’ll send you an email that will instantly sign you in';
const String YourEmail = 'Your email address';
const String EmailAppNotFound = 'Email App not found';
const String OpenEmail = 'Open email app';
const String ToConfirmEmailAdd =
    'To confirm your email address, tap the button in the email we sent to lukeskylwalker@gmail.com';
const String CheckYourMail = 'Check your mail';
const String ProjectHint = 'Eg.  Q4 Budget, Website Update';
const String ProjectName = "What's a project your team is working on?";
const String AddTeammates = 'Add Teammates';
const String SampleEmail = 'name@example.com';
const String ShareInviteLink = 'Copy and share your invite link';
const String TeammateNames = 'Who else is working with you?';
const String CompanyName = "What's the name of the\ncompany or team?";
const String CompanyNameHint = 'Eg.  HNG I8 / Team Socrates';
const String CookiePolicy = 'Cookie Policy';
const String CustomerAgreementText =
    'It’s okay to send me email with Zuri Chat app, news and offer';
const String AddOrganisations = 'Add Organisations';
const String CreateNewOrg = 'Create a new organization';
const String SignInNewOrg = 'Sign in to another organization';
const String JoinAnotherOrg = 'Join another organization';
const String SplashScreen = 'assets/logo/splash_image.png';

//Pinned Messages
const String PinnedMsgs = 'Pinned Messages';

//View Profile
const String MessageText = 'Message';

//User
const String People = 'People';
const String PeopleCount = '2552 members';
const String SearchHint = 'Search for members';
const String NoResult = 'No result found';
const String StartNewSearch = 'Start new search';
const String MsgIn = 'Message In';
const String YouAndOthers = 'You, Jane and 2 others';
const String Reply = 'Reply';
const String NoNewReplies = 'No new replies';

//Start DM
const String To = 'To:';
const String StartDmHint = '    Type the name of a channel or person';

//Set Status
const String FormerStatus = 'Former Status';
const String WorkingRemotely = 'Working Remotely';
const String OnHoliday = 'On holiday';
const String OffSick = 'Off sick';
const String InMeeting = 'In a meeting';
const String Commuting = 'Commuting';

//Preferences
const String PrivacyNLicenses = 'Privacy & licences';
const String HelpCenter = 'Help Center';
const String SendFeedback = 'Send Feedback';

//Images and Logos
const String ZuriLogo = 'assets/logo/zuri_chat_logo.png';
const String ZuriAppbarLogo = 'assets/background/appBarLogo.png';
const String GoogleLogo = 'assets/logo/Google_logo.png';
const String statusBackground = 'assets/background/status.png';
const String FemaleUser = 'assets/channel_page/femaleuser.png';
const String Female = 'assets/channel_page/female.png';
const String Chimamanda = 'assets/images/chimamanda.png';
const String UserImage = 'assets/images/user.png';
const String EditLogo = 'assets/channel_page/edit.png';
const String ArrowIcon = 'assets/icons/back_arrow_icon.png';
const String Avatar = 'assets/images/avatar.png';
const String FileLogo = 'assets/images/file_image.png';
const String Arrows = 'assets/images/arrows.png';
const String CloseSearch = 'assets/images/close_search.png';
const String VoiceSearch = 'assets/images/voice_search.png';
const String OnboardingOne = 'assets/images/onboarding_screen_0.png';
const String OnboardingTwo = 'assets/images/onboarding_screen_1.png';
const String OnboardingThree = 'assets/images/onboarding_screen_2.png';
const String LinkLogo = 'assets/icons/svg_icons/link.svg';
const String CancelLogo = 'assets/icons/cancel.png';

//Temporary Placeholders and Dummy Data
const String DmUnreadAvatar =
    'https://th.bing.com/th/id/OIP.QHG-JO3iI1u8VQjSkpO0HwHaLH?pid=ImgDet&rs=1';
const String DmReadAvatar =
    'https://th.bing.com/th/id/OIP.Obw6BUTUPdQGToOSCz5t8QHaHC?pid=ImgDet&w=549&h=522&rs=1';
const String DMSearchAvatar =
    'https://images.unsplash.com/photo-1520583457224-aee11bad5112?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=401&q=80';
const String UserAvatar = 'assets/background/bga.png';
const String AvatarTwo = 'assets/avatar.png';
const String Mark = 'Mark';
const String Naza = 'Naza';
const String OyinkanUA = 'OyinkanUA';
const String Xclusivecyborg = 'Xclusivecyborg';
const String Fierce = 'Fierce';
const String BlazeBrain = 'BlazeBrain';
const String FreshFish = 'FreshFish';
const String Ekpess = 'Ekpess';
const String Protector = 'Protector';
const String Quwaysim = 'Quwaysim';
const String BusyBee = 'BusyBee';
const String Abroad = 'Abroad';
const String Kristie = 'Kristie';
const String Kara = 'Kara';
const String PaulEke = 'pauleke65';
const String BottomSheetDesc =
    'This sheet is a custom built bottom sheet UI that allows you to show it from any service or viewmodel.';
const String BottomSheetTitle = 'This is a floating bottom sheet';
const String BSheetMainBtn = 'Awesome!';
const String BSheetSecBtn = 'This is cool';
const String PaulImoke = 'Paul Imoke Eke';
const String Okay = 'Okay';
const String SampleDate = 'August 31 at 9:09 PM';
const String AbdSalam = 'Abd_salam';
const String NoWahala = 'No Wahala';
const String sampleNumber = '+2347023456789';
const String EmailPlaceholder = 'myemail@mail.com';
const String Track = 'What I do';
const String MobileDev = 'Mobile Dev';
const String MarkCreatedChannel = 'Mark created this channel on August 13.';
const String CreatingZuri = 'Creating the zuri main app';
const String OnePinnedMessage = 'Pinned messages (1)';
const String OnePlugin = 'Plugins (1)';
const String MembersCount = '128 members';
const String SoftwareDev = 'Software Development';
const String PromotedPlaceholder = 'Have you been Promoted?';
const String WriteMsgHint = 'Write message...';
const String Dee = 'Dee';
const String ASAP = 'ASAP';
const String Happix = 'Happix';
const String ChiSarah = 'ChiSarah';
const String damiAaron = 'damiAaron';
const String maxiron = 'maxiron';
const String Engr_Jimmy = 'Engr_Jimmy';
const String Detective_Khalifah = 'Detective_Khalifah';
const String ChristieDesign = 'ChristieDesign';
const String Jaytek = 'Jaytek';
const String ProductDesigner = 'Product designer';
const String Hello = 'Hello...';
const String Cool = 'Cool...';
const String Nice = 'Nice...';
const String Yeah = 'Yeah';
const String Nope = 'Nope';
const String Why = 'Why';
const String FiftyResults = '50 Results';
