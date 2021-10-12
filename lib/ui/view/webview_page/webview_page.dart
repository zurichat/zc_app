import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
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
        disposeViewModel: true,
        builder: (context, model, child) {
          return Scaffold(
            appBar: ZuriAppBar(
              leading: Icons.arrow_back_ios,
              leadingPress: () => model.goBack(),
              orgTitle: Text(name, style: AppTextStyles.heading4),
              bottomNavBarScreen: true,
              whiteBackground: true,
            ),
            body: model.isLoading
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          color: AppColors.zuriPrimaryColor,
                        ),
                        const SizedBox(height: 15),
                        CustomText(
                            text: "Loading Plugin... ${model.progressValue}%")
                      ],
                    ),
                  )
                : WebView(
                    initialUrl: url,
                    onPageStarted: (url) {
                      model.startLoading();
                    },
                    onPageFinished: (url) {
                      model.stopLoading();
                    },
                    onProgress: (progress) {
                      model.updateValue(progress);
                    },
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
          );
        });
  }
}
