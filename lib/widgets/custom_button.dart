import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.controller,
    required this.calculateFactorial,
    required this.calculateSigma,
    required this.title,
    this.isSigma =
        false, // Add a flag to differentiate between Sigma and Factorial
  });

  final TextEditingController controller;
  final Function calculateFactorial;
  final Function calculateSigma;
  final String title;
  final bool isSigma; // Flag to determine which function to call

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightBlueAccent,
      ),
      child: MaterialButton(
        onPressed: () {
          if (isSigma) {
            calculateSigma();
          } else {
            calculateFactorial(
              controller.text,
            ); // Call Factorial calculation with input
            controller.clear();
          }
          FocusScope.of(context).unfocus();
        },
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
