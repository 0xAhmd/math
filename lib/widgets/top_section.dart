import 'package:flutter/material.dart';
import 'custom_button.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required this.controller,
    required this.calculateFactorial,
  });
  final TextEditingController controller;
  final Function calculateFactorial;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Input a Number to Calculate its Factorial",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.blueAccent,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              ),

              border: OutlineInputBorder(),
              hintText: "Enter Number",
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomButton(
            title: "Calculate Factorial",
            calculateSigma: (){},
            controller: controller,
            calculateFactorial: calculateFactorial,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
