import 'package:flutter/material.dart';

class ResultSection extends StatelessWidget {
  const ResultSection({super.key, required this.result});
  final String result;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white, // Changed to white for a cleaner look
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.5), // Add shadow for depth
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      width: double.infinity,
      child: Center(
        child: Text(
          result,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blueAccent, // Use blue accent for better contrast
            fontSize: 26,
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
      ),
    );
  }
}
