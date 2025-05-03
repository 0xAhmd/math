import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_math_fork/flutter_math.dart';

class CnSteps extends StatelessWidget {
  final int n;
  final double x;

  const CnSteps({required this.n, required this.x, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> stepsWidgets = [];
    double sum = 0.0;

    for (int r = 1; r <= n; r++) {
      double sqrtPart = sqrt(r - 1);
      double powerPart = pow(x, r).toDouble();
      double term = sqrtPart * powerPart / (n + 1);
      sum += term;

      // Use a regular string for interpolation
      String formula = '''
\\text{Term}_{$r} = \\frac{\\sqrt{${r - 1}} \\cdot ${x.toStringAsFixed(2)}^{$r}}{${n + 1}} 
= \\frac{${sqrtPart.toStringAsFixed(2)} \\cdot ${powerPart.toStringAsFixed(2)}}{${n + 1}} 
= ${term.toStringAsFixed(2)}''';

      stepsWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Math.tex(
            formula,
            textStyle: const TextStyle(fontSize: 18),
            mathStyle: MathStyle.display,
            textScaleFactor: 1.2,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add the main formula at the top
        Math.tex(
          r'C_n = \sum_{r=1}^n \frac{\sqrt{r-1} \cdot x^r}{n+1}',
          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          mathStyle: MathStyle.display,
          textScaleFactor: 1.5,
        ),
        const SizedBox(height: 20),
        const Text(
          'Step-by-step Calculation:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...stepsWidgets,
        const Divider(),
        Math.tex(
          r'C_{' + n.toString() + r'} = ' + sum.toStringAsFixed(2),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
