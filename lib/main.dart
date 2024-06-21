import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  late int first, second;
  late String opp;
  late String result, text = "";

  void btnClicked(String btnText) {
    if (btnText == "C") {
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text);
      result = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        result = (first + second).toString();
      } else if (opp == "-") {
        result = (first - second).toString();
      } else if (opp == "x") {
        result = (first * second).toString();
      } else if (opp == "/") {
        result = (first ~/ second).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }

  Widget customOutlineButton(String value) {
    if (value == "X") {
      return Expanded(
          child: OutlinedButton(
        onPressed: () => btnClicked(value),
        style: OutlinedButton.styleFrom(padding: EdgeInsets.all(28)),
        child: Icon(
          Icons.backspace,
          color: Colors.blue,
        ),
      ));
    } else if (value == "=") {
      return Expanded(
          child: ElevatedButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.white, // foreground
            padding: EdgeInsets.all(25)),
        onPressed: () => btnClicked(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 25),
        ),
      ));
    } else if (value == "reload") {
      return Expanded(
          child: OutlinedButton(
        onPressed: () => btnClicked(value),
        style: OutlinedButton.styleFrom(padding: EdgeInsets.all(28)),
        child: Icon(
          Icons.front_loader,
          color: Colors.blue,
        ),
      ));
    } else {
      return Expanded(
          child: OutlinedButton(
        onPressed: () => btnClicked(value),
        style: OutlinedButton.styleFrom(padding: EdgeInsets.all(25)),
        child: Text(
          value,
          style: TextStyle(fontSize: 25),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ),
            )),
            Row(
              children: [
                customOutlineButton("C"),
                customOutlineButton("%"),
                customOutlineButton("X"),
                customOutlineButton("+"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("7"),
                customOutlineButton("8"),
                customOutlineButton("9"),
                customOutlineButton("-"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("4"),
                customOutlineButton("5"),
                customOutlineButton("6"),
                customOutlineButton("x"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("1"),
                customOutlineButton("2"),
                customOutlineButton("3"),
                customOutlineButton("/"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("reload"),
                customOutlineButton("0"),
                customOutlineButton("."),
                customOutlineButton("="),
              ],
            )
          ],
        ),
      ),
    );
  }
}
