import 'package:flutter_test/flutter_test.dart';

void main() {
  String sample1 = 'I love debugging @eternity has given 07010269';
  String sample2 = 'www.goog is not a *real* #test  we test@gmail.com';
  String sample3 = 'let us test for a keyword';
  String sample4 = 'www.facebook.com';
  String sample5 = 'keyword k5yk5yk';
  String sample6 = 'this is a channel called @#channel-name-here and fine';
  String sample7 = '#@channel';
  String keyword = 'keyword';
  group('RegEx Tests', () {
    test("Returns true if it contains a Url", () async {
      expect(
          RegExp(r'(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})')
              .hasMatch(sample3),
          false);
    });
    test("Returns true if it contains '@'mentions", () async {
      expect(RegExp(r'\B@+([\w]+)\b').hasMatch(sample1), true);
    });
    test("Returns true if it contains keyword", () async {
      expect(RegExp(keyword).hasMatch(sample5), true);
    });
    test("Returns true if a word is between two asterisks", () async {
      expect(RegExp(r'(?<=\*)(.*)(\*)').hasMatch(sample2), true);
    });
    test("Returns true if it contains Url", () async {
      expect(
          RegExp(r'(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})')
              .hasMatch(sample4),
          true);
    });
    test("Returns true if it contains Hashtag", () async {
      expect(RegExp(r'\B#+([\w-]+)\b').hasMatch(sample6), true);
    });
    test("Returns true if it contains Hashtags with hiphenated words",
        () async {
      expect(RegExp(r'\B#+([\w-]+)\b').hasMatch(sample6), true);
    });
    test("Returns false if it contains Hashtags with hiphenated words",
        () async {
      expect(RegExp(r'\B#+([\w-]+)\b').hasMatch(sample7), false);
    });
  });
}
