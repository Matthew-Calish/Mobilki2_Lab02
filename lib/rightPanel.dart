import 'package:flutter/material.dart';

class RightPanel extends StatelessWidget {
  final void Function(String) mathOperation;
  final void Function() calculate;

  const RightPanel({
    super.key,
    required this.mathOperation,
    required this.calculate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 40,
      children: [
        IconButton(
          onPressed: () => mathOperation("+"),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
          ),
          icon: Icon(Icons.add_rounded, color: Colors.amber, size: 80),
        ),

        IconButton(
          onPressed: () => mathOperation("-"),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
          ),
          icon: Icon(Icons.remove_rounded, color: Colors.amber, size: 80),
        ),

        IconButton(
          onPressed: () => mathOperation("x"),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
          ),
          icon: Image.asset(
            "assets/images/multiply.png",
            color: Colors.amber,
            width: 80,
          ),
        ),

        IconButton(
          onPressed: calculate,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
          ),
          icon: Image.asset(
            "assets/images/equals.png",
            color: Colors.amber,
            width: 80,
          ),
        ),
      ],
    );
  }
}
