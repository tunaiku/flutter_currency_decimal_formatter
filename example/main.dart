import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:currency_decimal_formatter/currency_decimal_formatter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExamplePage(title: 'Currency Decimal Formatter Example'),
    );
  }
}

class ExamplePage extends StatefulWidget {
  final String title;

  const ExamplePage({super.key, required this.title});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  String _currency = 'USD';
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).toString();
    int decimalDigits = NumberFormat.currency(name: _currency).decimalDigits;
    CurrencyTextInputFormatter textFormatter = CurrencyTextInputFormatter(
      locale: locale,
      decimalDigits: decimalDigits,
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Currency: '),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _currency,
                  items: <String>['USD', 'EUR', 'JPY', 'BRL'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _currency = value;
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _textController,
              inputFormatters: [textFormatter],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter currency amount',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Text(
              'Selected Currency: $_currency',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
