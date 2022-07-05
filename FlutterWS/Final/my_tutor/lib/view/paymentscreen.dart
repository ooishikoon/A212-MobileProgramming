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
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/paymentscreen.png'),
                fit: BoxFit.fill),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (content) =>
                                  CartScreen(user: widget.user)));
                    },
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  const Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: WebView(
                      initialUrl: CONSTANTS.server +
                          '/mytutor/mobile/php/payment.php?email=' +
                          widget.user.email.toString() +
                          '&phoneno=' +
                          widget.user.phoneno.toString() +
                          '&name=' +
                          widget.user.name.toString() +
                          '&amount=' +
                          widget.totalpayable.toString(),
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController) {
                        _controller.complete(webViewController);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
