import 'package:flutter/material.dart';
import 'package:math/widgets/custom_button.dart';

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
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Input a Number to Calculate its Factorial",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.blueAccent,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              ),

              border: OutlineInputBorder(),
              hintText: "Enter Number",
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomButton(
            title: "Calculate Factorial",
            calculateSigma: (){},
            controller: controller,
            calculateFactorial: calculateFactorial,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
