import 'dart:async';

import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:my_tutor/model/user.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'cartscreen.dart';

class PaymentScreen extends StatefulWidget {
  final User user;
  final double totalpayable;

  const PaymentScreen(
      {Key? key, required this.user, required this.totalpayable})
      : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();
  late WebViewController controller;
  double progress = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            controller.clearCache();
            CookieManager().clearCookies();
          },
        ),
        title: const Text('Payment'),
        actions: [
          IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                if (await controller.canGoBack()) {
                  controller.goBack();
                }
              }),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.reload(),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          LinearProgressIndicator(
              value: progress,
              color: Colors.blue,
              backgroundColor: Colors.amber),
          Expanded(
            child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: CONSTANTS.server +
                    '/mytutor/mobile/php/payment.php?email=' +
                    widget.user.email.toString() +
                    '&phoneno=' +
                    widget.user.phoneno.toString() +
                    '&name=' +
                    widget.user.name.toString() +
                    '&amount=' +
                    widget.totalpayable.toString(),
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
                onProgress: (progress) =>
                    setState(() => this.progress = progress / 100)),
          )
        ],
      ));
}
