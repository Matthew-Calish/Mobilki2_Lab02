import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Kalkulator',
      home: MainScreen(),
      theme: ThemeData(
        primaryColor: Colors.green,
      ),

    );

  }

}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Kalkulator'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [

        ],
      ),
      body: _mainColumn(),
    );
  }

  Widget _mainColumn(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Row(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Wyniki",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black
            )),
          ],
        ),

        Column(
          children: [
            _leftPanel(),
            _rightPanel(),
          ]
        )

      ],
    );

  }

}

Widget _leftPanel(){
  return Text("jaja");
}

Widget _rightPanel(){
  return Text("Mleko");
}