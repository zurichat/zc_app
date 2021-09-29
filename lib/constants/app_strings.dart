const String AppName = 'Zuri Chat';
const String Zuri = 'ZURI';

//Snackbar
const String NoInternet = 'No internet connection, connect and try again.';
const String FillAllFields = 'Please fill all fields.';
const String ErrorEncounteredLogin = 'Error encountered during login.';
const String CheckEmailForOTP =
    'Please check your email for your one-time password';
const String AcceptTnC = 'You must accept T & C to signup';
const String ErrorEncounteredSignUp = 'Error encountered during signup.';
const String InvalidEmailFormat = 'Invalid email format';
const String PasswordsMustMatch = 'Passwords do not match';
const String PasswordUpdated = 'Password Successfully Updated';
const String PasswordNotUpdated = 'Password could not be updated';
const String ErrorOccurred = 'An Error Occurred';
const String ErrorOTP = 'OTP could not be validated';
const String WrongOTP = 'Wrong OTP, please check again';

//API Endpoints
const String LoginEndpoint = '/auth/login';
const String SignUpEndpoint = '/users';
const String ResetPasswordEndpoint = '/account/update-password/';
const String RequestOTPEndpoint = 'account/request-password-reset-code';
const String VerifyOTPEndpoint = '/account/verify-reset-password';
const String VerifyAcctEndpoint = 'account/verify-account';

/// Full endpoint is users/{userID}
const String UserDataEndpoint = 'users/';

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

//Integrate
const String Integrate = 'Integrate';
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
const String Status = 'Status';
const String DisplayName = 'Display Name';

//----------------
//Images and Logos
const String ZuriLogo = 'assets/logo/zuri_chat_logo.png';
const String ZuriAppbarLogo = 'assets/background/appBarLogo.png';
const String GoogleLogo = 'assets/logo/Google_logo.png';
const String statusBackground = 'assets/background/status.png';

//Temporary Placeholders and Dummy Data
const String DmUnreadAvatar =
    'https://th.bing.com/th/id/OIP.QHG-JO3iI1u8VQjSkpO0HwHaLH?pid=ImgDet&rs=1';
const String DmReadAvatar =
    'https://th.bing.com/th/id/OIP.Obw6BUTUPdQGToOSCz5t8QHaHC?pid=ImgDet&w=549&h=522&rs=1';
const String UserAvatar = 'assets/background/bga.png';

const String Mark = 'Mark';
const String Naza = 'Naza';
const String OyinkanUA = 'OyinkanUA';
const String Xclusivecyborg = 'Xclusivecyborg';
const String Fierce = 'Fierce';
const String BlazeBrain = 'BlazeBrain';
const String FreshFish = 'FreshFish';
const String Ekpess = 'Ekpess';
const String Protector = 'Protector';
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
const String Date = 'August 31 at 9:09 PM';
const String AbdSalam = 'Abd_salam';
const String Random = 'Abd_salam';
const String NoWahala = 'No Wahala';
const String sampleNumber = '+2347023456789';
const String EmailPlaceholder = 'myemail@mail.com';
const String Track = 'What I do';
const String MobileDev = 'Mobile Dev';
