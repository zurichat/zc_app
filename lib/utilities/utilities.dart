import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:hng/app/app.logger.dart';

import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';
import 'extensions/string_extension.dart';

final log = getLogger('Utilities');
ImageProvider makeNetworkImage(String? link) {
  return link == null || !link.validateLink()
      ? const CachedNetworkImageProvider(defaultNetworkImage)
      : CachedNetworkImageProvider(link);
}

Future<void> openUrl(String? url) async {
  if (url != null && url.validateLink()) {
    // final canOpen = await canLaunch(url);
    // if (canOpen) await launch(url);
  }
}

void showProgress(received, total) {
  if (total != -1) {
    log.i((received / total * 100).toStringAsFixed(0) + '%');
  }
}

bool nullListChecker(List? list) {
  if (list == null) {
    return true;
  } else {
    return false;
  }
}

launcher(String url) {
  var _launcher = launch(url);
  return _launcher;
}

Future<bool> canLaunch(String url) async {
  var islaunchable = await canLaunch(url);
  return islaunchable;
}
