import 'package:flutter/material.dart';
import '../widgets/result_section.dart';
import '../widgets/top_section.dart';
import 'package:math/pages/sigma_page.dart'; // Import SigmaPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Track the selected tab index

  final TextEditingController _controller = TextEditingController();
  String _result = "";
  String _factorialSteps = "";

  BigInt _factorialRecursive(BigInt n) {
    if (n <= BigInt.one) {
      return BigInt.one; // Base case: factorial of 0 or 1 is 1
    }
    return n * _factorialRecursive(n - BigInt.one); // Recursive case
  }

  void _calculateFactorial(String input) {
    if (input.isEmpty || int.tryParse(input) == null) {
      setState(() {
        _result = "Please enter a valid number.";
        _factorialSteps = "";
      });
      return;
    }

    int number = int.parse(input);

    BigInt factorial = _factorialRecursive(BigInt.from(number));
    List<String> steps = List.generate(number, (i) => (number - i).toString());

    setState(() {
      // Check if the number is less than 15
      if (number < 15) {
        _result = "Factorial of $number is $factorial";
        _factorialSteps = "${steps.join(" × ")} = $factorial";
      } else {
        // Convert BigInt to double and format in scientific notation
        _result = "Factorial of $number is ${factorial.toDouble().toStringAsExponential(6)}";
        _factorialSteps = "${steps.join(" × ")} = ${factorial.toDouble().toStringAsExponential(6)}";
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define the pages for navigation
    final List<Widget> pages = [
      CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            backgroundColor: Colors.blue,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Factorial Calculator",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopSection(
                  controller: _controller,
                  calculateFactorial: _calculateFactorial,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Result",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10) ,
                  child: ResultSection(result: _result)),
                if (_factorialSteps.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Text(
                        _factorialSteps,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      const CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            backgroundColor: Colors.blue,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Sigma Calculator",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: SigmaPage(), 
          ),
        ],
      ),
    ];

    return Scaffold(
      body: pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle navigation
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Factorial",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.functions), // Sigma summation symbol
            label: "Sigma",
          ),
        ],
      ),
    );
  }
}
