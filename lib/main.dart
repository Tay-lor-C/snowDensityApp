import 'package:flutter/material.dart';

void main() {
  runApp(DensityCalculatorApp());
}

class DensityCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snow Density Calculator',
      home: CalculatorScreen(),
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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Mass (g)'),
            ),
            TextField(
              controller: tubeAreaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tube Area (cm²)'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height (cm)'),
            ),
            ElevatedButton(
              onPressed: _calculateDensity,
              child: Text('Calculate'),
            ),
            Text('Water Equivalent (mm): $waterEquivalent'),
            Text('Snow Density (kg/m³): $density'),
            Text('Density (%): $percentDensity'), // Display percentage density
          ],
        ),
      ),
    );
  }
}
