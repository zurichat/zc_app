import 'package:intl/intl.dart';

extension StringExtension on String {
  bool validateEmail() {
    const emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final regExp = RegExp(emailPattern);

    return regExp.hasMatch(trim());
  }

  bool strip() {
    return replaceAll(RegExp(r'\s+'), '').isEmpty;
  }

  String turnStringToDate(String format) {
    return DateFormat(format).format(DateTime.parse(this)).toString();
  }

  bool validateLink() {
    const urlPattern =
        r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';

    final regExp = RegExp(urlPattern);

    return regExp.hasMatch(this);
  }

  String get initials {
    return split(' ').map((e) => e.split('').first.toUpperCase()).join();
  }
}
