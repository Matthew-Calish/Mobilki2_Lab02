import 'package:flutter/material.dart';

import 'leftPanel.dart';
import 'rightPanel.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator',
      home: MainScreen(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Baloo',
        iconTheme: IconThemeData(color: Colors.amber),
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
  var operations = "0";
  var operationsList = [];
  var history = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kalkulator MK",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(
            onPressed: _history,
            icon: Icon(Icons.history, color: Colors.white, size: 30),
          ),
        ],
        centerTitle: true,
      ),
      body: _mainView(),
      backgroundColor: Colors.deepOrangeAccent,
    );
  }

  Widget _mainView() {
    return Card(
      elevation: 10,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Zaokrąglenie rogów
      ),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: BoxBorder.all(width: 5, color: Colors.deepOrangeAccent),
              borderRadius: BorderRadius.circular(20),
            ),

            child: LayoutBuilder(
              builder: (context, constrains) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,

                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constrains.maxWidth),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          operations,
                          style: TextStyle(fontSize: 50, color: Colors.amber),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: Row(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LeftPanel(onNumberClick: _buttonClick),
                RightPanel(mathOperation: _buttonClick, calculate: _calculate),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _buttonClick(String symbol) {
    setState(() {
      if (operations == "0") {
        operations = symbol;

        if (symbol != "0") {
          operationsList.add(symbol);
        }
      } else {
        operations = operations + symbol;

        if ("0123456789".contains(symbol)) {
          if ("+-x".contains(operationsList.last)) {
            operationsList.add(symbol);
          } else {
            operationsList.last = operationsList.last + symbol;
          }
        } else {
          operationsList.add(symbol);
        }
      }
    });
  }

  void _calculate() {
    setState(() {
      var result = 0;
      var activeSymbol = "";

      //print(operationsList);

      for (int i = 0; i < operationsList.length; i++) {
        try {
          var number = int.parse(operationsList[i]);

          if (i == 0) {
            result = number;
          } else {
            if (activeSymbol == "+") {
              result = result + number;
            }

            if (activeSymbol == "-") {
              result = result - number;
            }

            if (activeSymbol == "x") {
              result = result * number;
            }
          }
        } catch (e) {
          activeSymbol = operationsList[i];
        }
      }

      history.add([operations, DateTime.now(), " = $result"]);
      operations = result.toString();
      operationsList = [operations];
    });
  }

  void _history() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = history.reversed.map((element) {
            return ListTile(
              leading: Icon(Icons.history, color: Colors.black, size: 27),
              title: Text(
                element[0] + element[2],
                style: TextStyle(fontSize: 20, color: Colors.amber),
              ),
              trailing: SizedBox(
                width: 70,
                child: Text(
                  DateFormat('dd-MM-yyyy\nHH:mm').format(element[1]),
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          });

          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Historia operacji'),
              backgroundColor: Colors.deepOrangeAccent,
              foregroundColor: Colors.white,
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
