import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/shared/news/cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
late final String url;
WebViewScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NewsCubit.get(context).isBlack?Colors.black:Colors.white,
        elevation: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: NewsCubit.get(context).isBlack?Colors.black:Colors.white,
          statusBarIconBrightness: NewsCubit.get(context).isBlack?Brightness.light:Brightness.dark,
        ),
        iconTheme: IconThemeData(
            color: NewsCubit.get(context).isBlack?Colors.deepOrange:Colors.black
        ),
      ),
      body: WebView(
        initialUrl: url,
      ),
      );
  }
}
