import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino for iOS specific theming
import 'colors.dart';

void main() {
  runApp(DensityCalculatorApp());
}

class DensityCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snow Calc',
      home: CalculatorScreen(),
      theme: ThemeData(
        // Material Theme properties
        primarySwatch: primary, // You can change this color as needed.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: backgroundColor,
      ),
      // iOS specific theming
      builder: (context, child) {
        return CupertinoTheme(
          data: CupertinoThemeData(
            primaryColor: Color(0xFF0f2b55), // Set the primary color for iOS
          ),
          child: child!,
        );
      },
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double mass = 0.0;
  double tubeArea = 0.0;
  double height = 0.0;
  double waterEquivalent = 0.0;
  double density = 0.0;
  double percentDensity = 0.0; // Added percentage density

  final massController = TextEditingController();
  final tubeAreaController = TextEditingController();
  final heightController = TextEditingController();

  void _calculateDensity() {
    setState(() {
      mass = double.tryParse(massController.text) ?? 0.0;
      tubeArea = double.tryParse(tubeAreaController.text) ?? 0.0;
      height = double.tryParse(heightController.text) ?? 0.0;

      waterEquivalent = (mass / tubeArea) * 10;

      density = (waterEquivalent / height) * 1000;
      percentDensity = (density / 10000) * 100; // Calculate percentage density
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snow Density Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: massController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Mass (g)'),
            ),
            TextField(
              controller: tubeAreaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Tube Area (cm²)'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Height (cm)'),
            ),
            ElevatedButton(
              onPressed: _calculateDensity,
              child: Text('Calculate'),
            ),
            Text('Water Equivalent (mm): $waterEquivalent',
                style: TextStyle(fontSize: 16),),
            Text('Snow Density (kg/m³): $density',
                style: TextStyle(fontSize: 16),),
            Text('Density (%): $percentDensity',
                style: TextStyle(fontSize: 16),), // Display percentage density
          ],
        ),
      ),
    );
  }
}
