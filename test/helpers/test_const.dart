import 'package:testsweets/src/models/build_info.dart';

const String ksPubspecFileWithNoVersion = """
name: myApp

environment:
  sdk: ">=2.7.0 <3.0.0"
""";

const String ksPubspecFileWithVersion = """
name: myApp

version: 0.1.1

environment:
  sdk: ">=2.7.0 <3.0.0"
""";

const String appAutomationKeysFile = """
[
  "home_general_guestDialog",
  "home_touchable_email",
  "home_touchable_google"
]
""";
const String emptyAppAutomationKeysFile = """
[

]
""";

const String testDirectoryPath = 'myApp';

const testsweetFileContentRaw = """
  projectId=3OezzTovG9xFTE5Xw2w1
  apiKey=e3747a0e-8449-42ec-b50f-748d80c3f52e
  flutterBuildCommand=--debug -t lib/main_profile.dart""";
const testsweetFileContent = [
  "projectId=3OezzTovG9xFTE5Xw2w1",
  "apiKey=e3747a0e-8449-42ec-b50f-748d80c3f52e",
  "flutterBuildCommand=--debug -t lib/main_profile.dart",
];
const testsweetFileContentListOfMapEntries = [
  MapEntry("projectId", "3OezzTovG9xFTE5Xw2w1"),
  MapEntry("apiKey", "e3747a0e-8449-42ec-b50f-748d80c3f52e"),
  MapEntry("flutterBuildCommand", "--debug -t lib/main_profile.dart")
];
const String testPathToBuild = 'abc';
final BuildInfo testBuildInfo = BuildInfo(
  pathToBuild: 'abc.apk',
  buildMode: 'profile',
  appType: testAppType,
  version: '0.1.1',
);
const String testAppType = 'apk';
const List<String> testExtraArgs = ['--profile'];
const List<String> testExtraFlutterProcessArgsWithDebug = [
  '--debug -t lib/main_profile.dart'
];
const List<String> testAutomationKeys = [
  "home_general_guestDialog",
  "home_touchable_email",
  "home_touchable_google"
];
const List<String> testDynamicAutomationKeys = ['orders_touchable_ready'];
const int testContentLength = 2;
final testDataStream = Stream.value([1, 2, 3]);
final testDateTime = DateTime.utc(1993, 12, 12, 12);
