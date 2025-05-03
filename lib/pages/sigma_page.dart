import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math/widgets/custom_button.dart';
import 'package:math/widgets/result_section.dart';
import 'package:math/widgets/sigma_steps.dart';

class SigmaPage extends StatefulWidget {
  const SigmaPage({super.key});

  @override
  State<SigmaPage> createState() => _SigmaPageState();
}

class _SigmaPageState extends State<SigmaPage> {
  final TextEditingController nController = TextEditingController();
  final TextEditingController xController = TextEditingController();
  String result = "";

  double calculateCn(int n, double x) {
    double sum = 0.0;
    for (int r = 1; r <= n; r++) {
      sum += sqrt(r - 1) * pow(x, r) / (n + 1);
    }
    return sum;
  }

  void handleCalculate() {
    final int? n = int.tryParse(nController.text);
    final double? x = double.tryParse(xController.text);
    if (n != null && x != null) {
      setState(() {
        result = "Sigma result: ${calculateCn(n, x).toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        result = "";
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid numbers')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Enter the value of n to calculate sigma",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          TextField(
            cursorColor: Colors.blueAccent,
            controller: nController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              ),
              border: OutlineInputBorder(),
              hintText: "Enter value of n",
            ),
          ),
          const SizedBox(height: 24),
          const Text("Enter the value of x", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          TextField(
            cursorColor: Colors.blueAccent,
            controller: xController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              ),
              border: OutlineInputBorder(),
              hintText: "Enter value of x",
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            controller: nController,
            calculateFactorial: () {}, // Not used here
            calculateSigma: handleCalculate, // Call the Sigma calculation
            title: "Calculate Sigma",
            isSigma: true, // Set to true for Sigma calculations
          ),
          const SizedBox(height: 20),
          ResultSection(result: result),
          const SizedBox(height: 20),
          if (result.isNotEmpty) ...[
            const SizedBox(height: 20),
            CnSteps(
              n: int.parse(nController.text),
              x: double.parse(xController.text),
            ),
          ],
        ],
      ),
    );
  }
}
