import 'package:stacked/stacked.dart';

class StatusService with ReactiveServiceMixin {
  StatusService() {
    listenToReactiveValues([_statusText]);
  }
  final _statusText = ReactiveValue<String>('What\'s your status');
  String get statusText => _statusText.value;

  void updateStatusText(statusText) => _statusText.value = statusText;
}
