import 'package:flutter/material.dart';
import 'formulas_screen.dart';
import 'colors.dart';

void main() {
  runApp(DensityCalculatorApp());
}

class DensityCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snow Calc',
      theme: ThemeData(
        primarySwatch: primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Snow Calc'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Calculator'),
                Tab(text: 'Formulas'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CalculatorScreen(),
              FormulasScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final massController = TextEditingController();
  final tubeAreaController = TextEditingController();
  final heightController = TextEditingController();

  double waterEquivalent = 0.0;
  double density = 0.0;
  double percentDensity = 0.0;

  void _calculateDensity() {
    double mass = double.tryParse(massController.text) ?? 0.0;
    double tubeArea = double.tryParse(tubeAreaController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    // Calculate water equivalent and density
    waterEquivalent = (mass / tubeArea) * 10;
    density = (waterEquivalent / height) * 100;
    percentDensity = (density / 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: () {
                _calculateDensity();
                FocusScope.of(context).unfocus(); // Dismiss the keyboard
              },
              child: Text('Calculate'),
            ),
            Text(
              'Water Equivalent (mm): ${waterEquivalent.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Snow Density (kg/m³): ${density.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Density (%): ${percentDensity.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 16),
            ), // Display percentage density
          ],
        ),
      ),
    );
  }
}
