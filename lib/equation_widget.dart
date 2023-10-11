// equation_widget.dart

import 'package:flutter/material.dart';

class EquationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Water Equivalent of Snow (mm)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'Water Equivalent (mm) = ',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: 'Mass of snow (g)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' / '),
                TextSpan(
                  text: 'Cross-section area of density cutter (cm²)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' * 10'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
