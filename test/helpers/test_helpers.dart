import 'package:hng/app/app.locator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// import 'package:testsweets/src/locator.dart';
// import 'package:testsweets/src/models/application_models.dart';
// import 'package:testsweets/src/services/automation_keys_service.dart';
// import 'package:testsweets/src/services/build_service.dart';
// import 'package:testsweets/src/services/cloud_functions_service.dart';
// import 'package:testsweets/src/services/dynamic_keys_generator.dart';
// import 'package:testsweets/src/services/file_system_service.dart';
// import 'package:testsweets/src/services/http_service.dart';
// import 'package:testsweets/src/services/runnable_process.dart';
// import 'package:testsweets/src/services/test_sweets_config_file_service.dart';
// import 'package:testsweets/src/services/testsweets_route_tracker.dart';
// import 'package:testsweets/src/services/time_service.dart';
// import 'package:testsweets/src/services/upload_service.dart';
// import 'package:testsweets/src/services/widget_capture_service.dart';

import 'stubed_process.dart';
import 'test_const.dart';
import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<TestSweetsConfigFileService>(returnNullOnMissingStub: true),
  MockSpec<BuildService>(returnNullOnMissingStub: true),
  MockSpec<FileSystemService>(returnNullOnMissingStub: true),
  MockSpec<FlutterProcess>(returnNullOnMissingStub: true),
  MockSpec<HttpService>(returnNullOnMissingStub: true),
  MockSpec<TimeService>(returnNullOnMissingStub: true),
  MockSpec<CloudFunctionsService>(returnNullOnMissingStub: true),
  MockSpec<DynamicKeysGenerator>(returnNullOnMissingStub: true),
  MockSpec<UploadService>(returnNullOnMissingStub: true),
  MockSpec<AutomationKeysService>(returnNullOnMissingStub: true),
  MockSpec<WidgetCaptureService>(returnNullOnMissingStub: true),
  MockSpec<TestSweetsRouteTracker>(returnNullOnMissingStub: true),
])
MockFileSystemService getAndRegisterFileSystemService({
  bool doesFileExist = false,
  String readFileAsStringSyncResult = appAutomationKeysFile,
  bool? jsonFilesDoesFileExist,
  String? jsonFilesreadFileAsStringSyncResult,
}) {
  _removeRegistrationIfExists<FileSystemService>();
  final service = MockFileSystemService();

  /// duo to multiple calls to this service in [BuildService],if you want to change the mock for just json files
  /// activate this fields(or one of them depends on your needs) [jsonFilesDoesFileExist,jsonFilesreadFileAsStringSyncResult]
  when(service.doesFileExist(any)).thenAnswer((realInvocation) {
    var fileName = realInvocation.positionalArguments[0] as String;
    if (jsonFilesDoesFileExist != null && fileName.endsWith('.json'))
      return jsonFilesDoesFileExist;
    else
      return doesFileExist;
  });
  when(service.readFileAsStringSync(any)).thenAnswer((realInvocation) {
    var fileName = realInvocation.positionalArguments[0] as String;
    if (jsonFilesreadFileAsStringSyncResult != null &&
        fileName.endsWith('.json'))
      return jsonFilesreadFileAsStringSyncResult;
    else
      return readFileAsStringSyncResult;
  });
  when(service.openFileForReading(any)).thenAnswer((_) => testDataStream);
  when(service.getFileSizeInBytes(any)).thenReturn(testContentLength);
  when(service.fullPathToWorkingDirectory).thenReturn(testDirectoryPath);
  locator.registerSingleton<FileSystemService>(service);
  return service;
}

MockWidgetCaptureService getAndRegisterWidgetCaptureService(
    {List<WidgetDescription> listOfWidgetDescription = const [],
      WidgetDescription? description,
      String? projectId,
      bool currentViewIsAlreadyCaptured = false}) {
  _removeRegistrationIfExists<WidgetCaptureService>();
  final service = MockWidgetCaptureService();

  when(service.captureWidgetDescription(
      description: anyNamed('description'),
      projectId: anyNamed('projectId')))
      .thenAnswer((realInvocation) => Future.value());

  when(service.getDescriptionsForView(currentRoute: anyNamed('currentRoute')))
      .thenReturn(listOfWidgetDescription);

  when(service.checkCurrentViewIfAlreadyCaptured(any))
      .thenReturn(currentViewIsAlreadyCaptured);

  locator.registerSingleton<WidgetCaptureService>(service);
  return service;
}

MockFlutterProcess getAndRegisterFlutterProcess() {
  _removeRegistrationIfExists<FlutterProcess>();
  final service = MockFlutterProcess();
  when(service.startWith(args: anyNamed('args'))).thenAnswer((_) {
    return Future.value(StubbedProcess(
        sExitCode: 0,
        sStdErr: '',
        sStdOut: 'build\\app\\outputs\\flutter-apk\\abc.apk'));
  });

  locator.registerSingleton<FlutterProcess>(service);
  return service;
}

MockTestSweetsConfigFileService getAndRegisterTestSweetsConfigFileService(
    {String? valueFromConfigFileByKey}) {
  _removeRegistrationIfExists<TestSweetsConfigFileService>();
  final service = MockTestSweetsConfigFileService();

  when(service.getValueFromConfigFileByKey(any)).thenReturn(
      valueFromConfigFileByKey ?? testExtraFlutterProcessArgsWithDebug[0]);

  locator.registerSingleton<TestSweetsConfigFileService>(service);
  return service;
}

MockDynamicKeysGenerator getAndRegisterDynamicKeysGeneratorService(
    {List<String>? generateAutomationKeysFromDynamicKeysFileResult}) {
  _removeRegistrationIfExists<DynamicKeysGenerator>();
  final service = MockDynamicKeysGenerator();

  when(service.generateAutomationKeysFromDynamicKeysFile(any)).thenReturn(
    generateAutomationKeysFromDynamicKeysFileResult ??
        testDynamicAutomationKeys,
  );

  locator.registerSingleton<DynamicKeysGenerator>(service);
  return service;
}

MockHttpService getAndRegisterHttpService() {
  _removeRegistrationIfExists<HttpService>();
  final service = MockHttpService();

  when(service.putBinary(
    to: anyNamed('to'),
    data: anyNamed('data'),
    headers: anyNamed('headers'),
    contentLength: anyNamed('contentLength'),
  )).thenAnswer((_) async => SimpleHttpResponse(200, ''));

  locator.registerSingleton<HttpService>(service);
  return service;
}

MockTimeService getAndRegisterTimeService() {
  _removeRegistrationIfExists<TimeService>();
  final service = MockTimeService();
  when(service.now()).thenReturn(testDateTime);
  locator.registerSingleton<TimeService>(service);
  return service;
}

BuildService getAndRegisterBuildServiceService() {
  _removeRegistrationIfExists<BuildService>();
  final service = MockBuildService();
  when(service.build(
      pathToBuild: anyNamed('pathToBuild'),
      appType: anyNamed('appType'),
      extraFlutterProcessArgs: anyNamed('extraFlutterProcessArgs')))
      .thenAnswer(
        (_) => Future.value(testBuildInfo),
  );

  locator.registerSingleton<BuildService>(service);
  return service;
}

MockCloudFunctionsService getAndRegisterCloudFunctionsService({
  String getV4BuildUploadSignedUrlResult = '',
  bool doesBuildExistInProjectResult = true,
  String addWidgetDescriptionToProjectResult = 'default_id',
  String updateWidgetDescription = 'default_id',
  String deleteWidgetDescription = 'default_id',
  List<WidgetDescription> getWidgetDescriptionForProjectResult = const [],
}) {
  _removeRegistrationIfExists<CloudFunctionsService>();
  final service = MockCloudFunctionsService();

  when(service.uploadAutomationKeys(
    any,
    any,
    any,
  )).thenAnswer((_) => Future.value());

  when(service.getV4BuildUploadSignedUrl(
    any,
    any,
    any,
  )).thenAnswer((_) async => getV4BuildUploadSignedUrlResult);

  when(service.doesBuildExistInProject(any,
      withVersion: anyNamed('withVersion')))
      .thenAnswer((invocation) async => doesBuildExistInProjectResult);

  when(service.uploadAutomationKeys(any, any, any))
      .thenAnswer((realInvocation) => Future.value());

  when(service.uploadWidgetDescriptionToProject(
      projectId: anyNamed('projectId'),
      description: anyNamed('description')))
      .thenAnswer((realInvocation) =>
      Future.value(addWidgetDescriptionToProjectResult));

  when(service.getWidgetDescriptionForProject(projectId: anyNamed('projectId')))
      .thenAnswer((realInvocation) =>
      Future.value(getWidgetDescriptionForProjectResult));

  when(service.deleteWidgetDescription(
      projectId: anyNamed('projectId'),
      description: anyNamed('description')))
      .thenAnswer((realInvocation) => Future.value(deleteWidgetDescription));

  when(service.updateWidgetDescription(
      projectId: anyNamed('projectId'),
      description: anyNamed('description')))
      .thenAnswer((realInvocation) => Future.value(updateWidgetDescription));

  locator.registerSingleton<CloudFunctionsService>(service);
  return service;
}

UploadService getAndRegisterUploadService() {
  _removeRegistrationIfExists<UploadService>();
  final service = MockUploadService();
  when(service.uploadBuild(any, any, any))
      .thenAnswer((realInvocation) => Future.value());
  locator.registerSingleton<UploadService>(service);
  return service;
}

AutomationKeysService getAndRegisterAutomationKeysService() {
  _removeRegistrationIfExists<AutomationKeysService>();
  final service = MockAutomationKeysService();
  when(service.extractKeysListFromJson()).thenReturn(testAutomationKeys);
  locator.registerSingleton<AutomationKeysService>(service);
  return service;
}

MockTestSweetsRouteTracker getAndRegisterTestSweetsRouteTracker(
    {String currentRoute = 'current route'}) {
  _removeRegistrationIfExists<TestSweetsRouteTracker>();
  final service = MockTestSweetsRouteTracker();
  when(service.currentRoute).thenReturn(currentRoute);
  locator.registerSingleton<TestSweetsRouteTracker>(service);
  return service;
}

void registerServices() {
  getAndRegisterFileSystemService();
  getAndRegisterFlutterProcess();
  getAndRegisterHttpService();
  getAndRegisterTimeService();
  getAndRegisterCloudFunctionsService();
  getAndRegisterDynamicKeysGeneratorService();
  getAndRegisterBuildServiceService();
  getAndRegisterTestSweetsConfigFileService();
  getAndRegisterUploadService();
  getAndRegisterAutomationKeysService();
  getAndRegisterTestSweetsRouteTracker();
  getAndRegisterWidgetCaptureService();
}

void unregisterServices() {
  _removeRegistrationIfExists<FileSystemService>();
  _removeRegistrationIfExists<FlutterProcess>();
  _removeRegistrationIfExists<HttpService>();
  _removeRegistrationIfExists<TimeService>();
  _removeRegistrationIfExists<CloudFunctionsService>();
  _removeRegistrationIfExists<DynamicKeysGenerator>();
  _removeRegistrationIfExists<BuildService>();
  _removeRegistrationIfExists<TestSweetsConfigFileService>();
  _removeRegistrationIfExists<UploadService>();
  _removeRegistrationIfExists<AutomationKeysService>();
  _removeRegistrationIfExists<TestSweetsRouteTracker>();
  _removeRegistrationIfExists<WidgetCaptureService>();
}

// Call this before any service registration helper. This is to ensure that if there
// is a service registered we remove it first. We register all services to remove boiler plate from tests
void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
