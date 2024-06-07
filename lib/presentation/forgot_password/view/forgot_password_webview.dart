import 'dart:async';

// Import for Android features.
import 'package:washing_track/app/constants.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ForgotPasswordWebView extends StatefulWidget {
  const ForgotPasswordWebView({super.key});

  @override
  State<ForgotPasswordWebView> createState() => _ForgotPasswordWebViewState();
}

class _ForgotPasswordWebViewState extends State<ForgotPasswordWebView> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse("${Constants.baseUrl}${Constants.forgotPasswordEndPoint}/${Constants.token}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
