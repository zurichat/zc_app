import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

import 'package:url_launcher/url_launcher.dart';

import 'constants/constants.dart';
import 'extensions/string_extension.dart';

ImageProvider makeNetworkImage(String? link) {
  return link == null || !link.validateLink()
      ? const CachedNetworkImageProvider(defaultNetworkImage)
      : CachedNetworkImageProvider(link);
}

Future<void> openUrl(String? url) async {
  if (url != null && url.validateLink()) {
    final canOpen = await canLaunch(url);
    if (canOpen) await launch(url);
  }
}
