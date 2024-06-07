import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../app/constants.dart';


class ForgotPasswordViewWebView extends StatefulWidget {
  const ForgotPasswordViewWebView({super.key});

  @override
  State<ForgotPasswordViewWebView> createState() => _ForgotPasswordViewWebViewState();
}

class _ForgotPasswordViewWebViewState extends State<ForgotPasswordViewWebView> {
  InAppWebViewController? webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InAppWebView(
          initialUrlRequest: URLRequest(
              url: WebUri(
                  'https://wash-stations.com/client/password/forget'),
              method: 'GET',
              headers: {
                'Accept':'application/json',
                'authorization': "Bearer ${Constants.token}",
                'Content-Type':'application/x-www-form-urlencoded'
              }
          ),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
        ));
  }
}
