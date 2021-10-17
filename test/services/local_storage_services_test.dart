import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/utilities/storage_keys.dart';

void main() {
  group('LocalStorageServiceTest -', () {
    setUp(() async {
      await SharedPreferenceLocalStorage.getInstance();
    });
    group('SetString and getString test', () {
      test('When called, value should be set to userEmail', () async {
        final service = SharedPreferenceLocalStorage();
        service.setString(StorageKeys.currentUserEmail, 'Zuri@gmail.com');
        expect(
            service.getString(StorageKeys.currentUserEmail), 'Zuri@gmail.com');
      });
      test('When called, a list of properties should be set', () async {
        final service = SharedPreferenceLocalStorage();
        service.setStringList('channelMembers', [
          'BlazeBrain',
          'Busybee',
          'Starkhz',
          'MayowaX',
          'Eternity',
          'Naza'
        ]);
        expect(service.getStringList('channelMembers')!.length, 6);
      });
    });
    group('SetBool and getBool test', () {
      test(
          "When called, it gives confirmation that a user is registered but hasn't been verified yet",
          () async {
        final service = SharedPreferenceLocalStorage();
        service.setBool(StorageKeys.registeredNotverifiedOTP, true);
        expect(service.getBool(StorageKeys.registeredNotverifiedOTP), true);
      });
    });

    group('clearData and clearStorage test', () {
      test("When called, it clears the data set to a given property", () async {
        final service = SharedPreferenceLocalStorage();
        service.setString('Email', 'Zuri@gmail.com');
        await service.clearData('Email');
        expect(service.getString('Email'), null);
      });
      test("When called, it clears all data stored in the local storage",
          () async {
        final service = SharedPreferenceLocalStorage();
        service.setString('Email', 'ayodeji@gmail.com');
        service.setBool(StorageKeys.registeredNotverifiedOTP, true);
        service.setDouble('Phone', 08012345);
        service.setStringList('channelMembers', [
          'BlazeBrain',
          'Busybee',
          'Starkhz',
          'MayowaX',
          'Eternity',
          'Naza'
        ]);
        await service.clearStorage();
        expect(service.getString('Email'), null);
        expect(service.getStringList('channelMembers'), null);
        expect(service.getBool(StorageKeys.registeredNotverifiedOTP), null);
      });
    });
  });
}
