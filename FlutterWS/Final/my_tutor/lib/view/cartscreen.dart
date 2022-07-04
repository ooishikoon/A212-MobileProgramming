import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../model/user.dart';
import '../model/cart.dart';
import 'mainscreen.dart';

class CartScreen extends StatefulWidget {
  final User user;

  const CartScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> cartList = <Cart>[];
  String titlecenter = "Loading...";
  late double screenHeight, screenWidth, resWidth;
  double totalpayable = 0.0;

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.75;
    }
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/cartscreen.png'),
                  fit: BoxFit.cover)),
          child: cartList.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(titlecenter,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),
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
                                          MainScreen(user: widget.user)));
                            },
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          const Text(
                            "Your cart",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(titlecenter,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Expanded(
                              child: GridView.count(
                                  crossAxisCount: 2,
                                  childAspectRatio: (1 / 1.3),
                                  children:
                                      List.generate(cartList.length, (index) {
                                    return InkWell(
                                        splashColor: Colors.amber,
                                        child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            shadowColor: Colors.amber,
                                            elevation: 8,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 10, 10, 0),
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        255, 247, 242, 199),
                                                    Color.fromARGB(
                                                        255, 243, 204, 86)
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Flexible(
                                                    flex: 5,
                                                    child: CachedNetworkImage(
                                                      imageUrl: CONSTANTS
                                                              .server +
                                                          "/mytutor/mobile/assets/courses/" +
                                                          cartList[index]
                                                              .subjectId
                                                              .toString() +
                                                          '.png',
                                                      fit: BoxFit.cover,
                                                      width: resWidth,
                                                      placeholder: (context,
                                                              url) =>
                                                          const LinearProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    cartList[index]
                                                        .subjectName
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Flexible(
                                                    flex: 4,
                                                    child: Column(children: [
                                                      Column(children: [
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "RM " +
                                                              double.parse(cartList[
                                                                          index]
                                                                      .pricetotal
                                                                      .toString())
                                                                  .toStringAsFixed(
                                                                      2),
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            IconButton(
                                                                onPressed: () {
                                                                  _deleteItem(
                                                                      index);
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .delete))
                                                          ],
                                                        )
                                                      ]),
                                                    ]),
                                                  )
                                                ],
                                              ),
                                            )));
                                  }))),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Total Payable :  RM " +
                                        totalpayable.toStringAsFixed(2),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ElevatedButton(
                                      onPressed: _onPaynowDialog,
                                      child: const Text("Pay Now"))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
    );
  }

  void _loadCart() {
    http.post(Uri.parse(CONSTANTS.server + "/mytutor/mobile/php/load_cart.php"),
        body: {
          'user_email': widget.user.email,
        }).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response('Error', 408);
      },
    ).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        titlecenter = "Timeout Please retry again later";
        return http.Response('Error', 408);
      },
    ).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        var extractdata = jsondata['data'];
        if (extractdata['cart'] != null) {
          cartList = <Cart>[];
          extractdata['cart'].forEach((v) {
            cartList.add(Cart.fromJson(v));
          });
          int qty = 0;
          totalpayable = 0.00;
          for (var element in cartList) {
            qty = qty + int.parse(element.cartqty.toString());
            totalpayable =
                totalpayable + double.parse(element.pricetotal.toString());
          }
          titlecenter = qty.toString() + " Products in your cart";
          setState(() {});
        }
      } else {
        titlecenter = "Your Cart is Empty 😞 ";
        cartList.clear();
        setState(() {});
      }
    });
  }

  void _onPaynowDialog() {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       shape: const RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(20.0))),
    //       title: const Text(
    //         "Pay Now",
    //         style: TextStyle(),
    //       ),
    //       content: const Text("Are you sure?", style: TextStyle()),
    //       actions: <Widget>[
    //         TextButton(
    //           child: const Text(
    //             "Yes",
    //             style: TextStyle(),
    //           ),
    //           onPressed: () async {
    //             Navigator.of(context).pop();
    //             await Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (content) => PaymentScreen(
    //                         customer: widget.customer,
    //                         totalpayable: totalpayable)));
    //             _loadCart();
    //           },
    //         ),
    //         TextButton(
    //           child: const Text(
    //             "No",
    //             style: TextStyle(),
    //           ),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  void _deleteItem(int index) {
    http.post(
        Uri.parse(CONSTANTS.server + "/mytutor/mobile/php/delete_cart.php"),
        body: {
          'user_email': widget.user.email,
          'cartid': cartList[index].cartid
        }).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response('Error', 408);
      },
    ).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
        _loadCart();
      } else {
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      }
    });
  }
}
