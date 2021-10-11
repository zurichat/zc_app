import 'package:flutter/material.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({required this.name, required this.url, Key? key})
      : super(key: key);

  final String name, url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZuriAppBar(
        leading: Icons.arrow_back,
        orgTitle: Text(name, style: ZuriTextStyle.organizationNameText()),
        bottomNavBarScreen: true,
        leadingWidth: true,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
