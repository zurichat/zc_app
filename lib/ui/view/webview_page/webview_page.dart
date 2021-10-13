import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/ui/shared/zuri_loader.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:stacked/stacked.dart';
import 'web_view_model.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({required this.name, required this.url, Key? key})
      : super(key: key);
  final String name, url;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WebViewModel>.reactive(
        viewModelBuilder: () => WebViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: ZuriAppBar(
                leading: Icons.arrow_back_ios,
                leadingPress: () => model.goBack(),
                orgTitle: Text(
                  name,
                  style: AppTextStyles.heading4.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                bottomNavBarScreen: true,
                isDarkMode: Theme.of(context).brightness == Brightness.dark,
                whiteBackground: true,
                actions: [
                  model.isLoading ? const ZuriLoader() : const SizedBox(),
                ]),
            body: WebView(
              initialUrl: url,
              onPageStarted: (url) {
                model.startLoading();
              },
              onPageFinished: (url) {
                model.stopLoading();
              },
              onProgress: (progress) {},
              javascriptMode: JavascriptMode.unrestricted,
            ),
          );
        });
  }
}
