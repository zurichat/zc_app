import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
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
              orgTitle: Text(
                name,
                style: AppTextStyle.darkGreySize20Bold.copyWith(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              bottomNavBarScreen: true,
              isDarkMode: Theme.of(context).brightness == Brightness.dark,
              whiteBackground: true,
              actions: [
                model.isLoading
                    ? const Center(
                        child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: AppColors.zuriPrimaryColor,
                        ),
                      ))
                    : const SizedBox(),
                const SizedBox(width: 20)
              ],
            ),
            body:
                // model.isLoading
                //     ? Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             const ZuriLoader(),
                //             const SizedBox(height: 15),
                //             Text(
                //               "Loading Plugin... ${model.progressValue}%",
                //               style: AppTextStyle.darkGreySize16,
                //             )
                //           ],
                //         ),
                //       )
                //     :
                WebView(
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
