import 'package:flutter/material.dart';
import 'package:currency_decimal_formatter/currency_decimal_formatter.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExamplePage(title: 'ExamplePage'),
    );
  }
}

class ExamplePage extends StatefulWidget {
  final String title;

  const ExamplePage({Key? key, required this.title}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final TextEditingController textController = TextEditingController();
  String? _currency;

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).toString();
    int? decimalDigits = NumberFormat.currency(name: _currency).decimalDigits;
    CurrencyTextInputFormatter textFormatter = CurrencyTextInputFormatter(
      locale: locale,
      decimalDigits: decimalDigits,
    );
    return Scaffold(
        body: Center(
            child: Row(children: [
      DropdownButton<String>(
        items: <String>['USD', 'EUR', 'JPY', 'BRL'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          _currency = value;
        },
      ),
      TextField(
        controller: textController,
        inputFormatters: [
          textFormatter,
        ],
      )
    ])));
  }
}
