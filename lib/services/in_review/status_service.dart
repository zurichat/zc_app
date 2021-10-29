import 'package:stacked/stacked.dart';

class StatusService with ReactiveServiceMixin {
  StatusService() {
    listenToReactiveValues([_statusText, _statusIcon]);
  }
  final _statusText = ReactiveValue<String>('What\'s your status');
  final _statusIcon = ReactiveValue<String>('💬');
  String get statusText => _statusText.value;
  String get statusIcon => _statusIcon.value;

  void updateStatusText(statusText) {
    _statusText.value = statusText;
  }

  void updateStatusIcon(statusIcon) {
    _statusIcon.value = statusIcon;
  }
}
