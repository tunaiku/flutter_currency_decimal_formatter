# Flutter Currency Decimal Formatter

A Flutter package for formatting currency input in TextFields with support for multiple locales and currencies.

**Features:**  
- `CurrencyTextInputFormatter` - Formatter for [TextField](https://api.flutter.dev/flutter/material/TextField-class.html)
- `CurrencyFormatter` - Utility methods for converting currency text into decimal and vice-versa

## Requirements

- Flutter SDK: >=3.10.0
- Dart SDK: >=3.0.0
- Android: API level 21+ (target SDK 35 supported)
- iOS: 12.0+

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  currency_decimal_formatter: ^0.0.8
```

## Usage

```dart
import 'package:currency_decimal_formatter/currency_decimal_formatter.dart';

// Create a formatter for US dollars
final formatter = CurrencyTextInputFormatter(
  locale: 'en_US',
  decimalDigits: 2,
);

// Use in TextField
TextField(
  inputFormatters: [formatter],
  keyboardType: TextInputType.number,
)
```

## Example

See the `example/` directory for a complete working example.
