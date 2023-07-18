// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: TemperatureConverterScreen(),
    );
  }
}

class TemperatureConverterScreen extends StatefulWidget {
  @override
  _TemperatureConverterScreenState createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  late double celsiusValue;
  late double fahrenheitValue;

  @override
  void initState() {
    super.initState();
    celsiusValue = 0;
    fahrenheitValue = 32;
  }

  void convertCelsiusToFahrenheit(double celsius) {
    setState(() {
      celsiusValue = celsius;
      fahrenheitValue = celsius * 9 / 5 + 32;
    });
  }

  void convertFahrenheitToCelsius(double fahrenheit) {
    setState(() {
      fahrenheitValue = fahrenheit;
      celsiusValue = (fahrenheit - 32) * 5 / 9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Celsius'),
              onChanged: (value) {
                double? celsius = double.tryParse(value);
                if (celsius != null) {
                  convertCelsiusToFahrenheit(celsius);
                }
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Fahrenheit'),
              onChanged: (value) {
                double? fahrenheit = double.tryParse(value);
                if (fahrenheit != null) {
                  convertFahrenheitToCelsius(fahrenheit);
                }
              },
            ),
            SizedBox(height: 16.0),
            Text(
              '$celsiusValue °C = $fahrenheitValue °F',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
