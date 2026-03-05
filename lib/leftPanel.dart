import 'package:flutter/material.dart';

class LeftPanel extends StatelessWidget {
  final void Function(String) onNumberClick;

  const LeftPanel({super.key, required this.onNumberClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 50,
      children: [
        _leftPanelRow1(),
        _leftPanelRow2(),
        _leftPanelRow3(),
        _leftPanelRow4(),
      ],
    );
  }

  Widget _leftPanelRow1() {
    return Row(
      spacing: 10,
      children: [
        TextButton(
          onPressed: () => onNumberClick("1"),
          style: TextButton.styleFrom(
            foregroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
          ),
          child: _numberText("1"),
        ),

        TextButton(
          onPressed: () => onNumberClick("2"),
          style: TextButton.styleFrom(
            foregroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
          ),
          child: _numberText("2"),
        ),

        TextButton(
          onPressed: () => onNumberClick("3"),
          style: TextButton.styleFrom(
            foregroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
          ),
          child: _numberText("3"),
        ),
      ],
    );
  }

  Widget _leftPanelRow2() {
    return Row(
      spacing: 10,
      children: [
        ElevatedButton(
          onPressed: () => onNumberClick("4"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
          ),
          child: _numberText("4"),
        ),

        ElevatedButton(
          onPressed: () => onNumberClick("5"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
          ),
          child: _numberText("5"),
        ),

        ElevatedButton(
          onPressed: () => onNumberClick("6"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
          ),
          child: _numberText("6"),
        ),
      ],
    );
  }

  Widget _leftPanelRow3() {
    return Row(
      spacing: 10,
      children: [
        OutlinedButton(
          onPressed: () => onNumberClick("7"),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
            side: BorderSide(color: Colors.amber),
          ),
          child: _numberText("7"),
        ),
        OutlinedButton(
          onPressed: () => onNumberClick("8"),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(0),
            side: BorderSide(color: Colors.amber),
          ),
          child: _numberText("8"),
        ),
        OutlinedButton(
          onPressed: () => onNumberClick("9"),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            side: BorderSide(color: Colors.amber),
          ),
          child: _numberText("9"),
        ),
      ],
    );
  }

  Widget _leftPanelRow4() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 210,
          child: ElevatedButton(
            onPressed: () => onNumberClick("0"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(0),
            ),
            child: _numberText("0"),
          ),
        ),
      ],
    );
  }

  Widget _numberText(String text) {
    return Text(text, style: TextStyle(fontSize: 50, color: Colors.amber));
  }
}
