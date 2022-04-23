import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ndialog/ndialog.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Currency Converter'),
        ),
        body: const ConverterPage(),
      ),
    );
  }
}

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  String selectUnitName = "btc";
  Currency curCurrency =
      Currency("Not Available", "Not Available", 0.0, "Not Available");
  var curName, value, type;
  List<String> nameList = [
      "btc","eth","ltc","bch","bnb","eos","xrp","xlm","link","dot",
      "yfi","usd","aed","ars","aud","bdt","bhd","bmd","brl","cad",
      "chf","clp","cny","czk","dkk","eur","gbp","hkd","huf","idr",
      "ils","inr","jpy","krw","kwd","lkr","mmk","mxn","myr","ngn",
      "nok","nzd","php","pkr","pln","rub","sar","sek","sgd","thb",
      "try","twd","uah","vef","vnd","zar","xdr","xag","xau","bits","sats"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/bitcoin.png'),
            ListTile(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  DropdownButton(
                    itemHeight: 60,
                    value: selectUnitName,
                    onChanged: (newValue) {
                      setState(() {
                        selectUnitName = newValue.toString();
                      });
                    },
                    items: nameList.map((selectUnitName) {
                      return DropdownMenuItem(
                        child: Text(
                          selectUnitName,
                        ),
                        value: selectUnitName,
                      );
                    }).toList(),
                  ),
                  ElevatedButton(
                      onPressed: _loadCurrency, child: const Text("Convert")),
                ])),
            Expanded(
              child: CurrencyGrid(
                curCurrency: curCurrency,
              ),
            )
          ],
        ),
      ),
    );
  }

  _loadCurrency() async {
    ProgressDialog progressDialog = ProgressDialog(context,
        message: const Text("Progress"), title: const Text("Converting..."));
    progressDialog.show();
    var url = Uri.parse('https://api.coingecko.com/api/v3/exchange_rates');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      var parsedData = json.decode(jsonData);
      curName = parsedData['rates'][selectUnitName]['name'];
      value = parsedData['rates'][selectUnitName]['value'];
      type = parsedData['rates'][selectUnitName]['type'];
      curCurrency = Currency(curName, selectUnitName, value, type);
    }
    progressDialog.dismiss();
  }
}

class CurrencyGrid extends StatefulWidget {
  final Currency curCurrency;
  const CurrencyGrid({Key? key, required this.curCurrency}) : super(key: key);
  @override
  _CurrencyGridState createState() => _CurrencyGridState();
}

class _CurrencyGridState extends State<CurrencyGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: (1 / .7),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Currency"),
              const Icon(
                Icons.money,
                size: 40,
              ),
              Text(widget.curCurrency.name)
            ],
          ),
          color: const Color.fromARGB(255, 248, 208, 89),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Unit"),
              const Icon(
                Icons.currency_exchange,
                size: 40,
              ),
              Text(widget.curCurrency.unit)
            ],
          ),
          color: const Color.fromARGB(255, 248, 208, 89),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Value"),
              const Icon(
                Icons.currency_bitcoin,
                size: 40,
              ),
              Text(widget.curCurrency.value.toString())
            ],
          ),
          color: const Color.fromARGB(255, 248, 208, 89),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Type"),
              const Icon(
                Icons.merge_type_outlined,
                size: 40,
              ),
              Text(widget.curCurrency.type)
            ],
          ),
          color: const Color.fromARGB(255, 248, 208, 89),
        ),
      ],
    );
  }
}

class Currency {
  var name = "Not available",
      unit = "Not available",
      value = 0.0,
      type = "Not available";
  Currency(this.name, this.unit, this.value, this.type);
}
