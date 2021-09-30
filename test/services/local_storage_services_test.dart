import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:test/test.dart';

void main() {
  group('Local Storage', () {
    group('SetString and getString Functions', () {
      test('To test that the user email address is being stored locally',
          () async {
        await SharedPreferenceLocalStorage.getInstance();
        final service = SharedPreferenceLocalStorage();
        service.setString(StorageKeys.currentUserEmail, 'Zuri@gmail.com');
        expect(
            service.getString(StorageKeys.currentUserEmail), 'Zuri@gmail.com');
      });
      test(
          'To test that the setStringList function accepts a list of properties',
          () async {
        await SharedPreferenceLocalStorage.getInstance();
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
    group('SetBool and getBool Functions', () {
      test("To test thant the setBool function is working properly", () async {
        await SharedPreferenceLocalStorage.getInstance();
        final service = SharedPreferenceLocalStorage();
        service.setBool(StorageKeys.registeredNotverifiedOTP, true);
        expect(service.getBool(StorageKeys.registeredNotverifiedOTP), true);
      });
    });

    group('clearData and clearStorage Functions', () {
      test("Test that the clearData function works when it is called",
          () async {
        await SharedPreferenceLocalStorage.getInstance();
        final service = SharedPreferenceLocalStorage();
        service.setString('Email', 'Zuri@gmail.com');
        await service.clearData('Email');
        expect(service.getString('Email'), null);
      });
      test("Test that the clearStorage function works when it is called",
          () async {
        await SharedPreferenceLocalStorage.getInstance();
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
