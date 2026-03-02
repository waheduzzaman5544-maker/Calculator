import 'package:calculator/widget/buildbutton.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _output = '0';
  String _input = '0';
  String _operation = '';
  double _num1 = 0;
  double _num2 = 0;


  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _input = '0';
        _operation = '';
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '×' || buttonText == '÷') {
        _num1 = double.parse(_input);
        _operation = buttonText;
        _input = '0';
      } else if (buttonText == '=') {
        _num2 = double.parse(_input);
        switch (_operation) {
          case '+':
            _output = (_num1 + _num2).toString();
            break;
          case '-':
            _output = (_num1 - _num2).toString();
            break;
          case '×':
            _output = (_num1 * _num2).toString();
            break;
          case '÷':
            if (_num2 != 0) {
              _output = (_num1 / _num2).toString();
            } else {
              _output = 'Error';
            }
            break;
        }
        _input = '0';
      } else {
        if (_input == '0') {
          _input = buttonText;
        } else {
          _input += buttonText;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$_num1 $_operation $_num2',
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      _output,
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 10),
            Row(
             
              children: [
                buildButton(onclick: () => buttonPressed('7'), text: '7'),
                buildButton(onclick: () => buttonPressed('8'), text: '8'),
                buildButton(onclick: () => buttonPressed('9'), text: '9'),
                buildButton(onclick: () => buttonPressed('÷'), text: '÷',color: const Color.fromARGB(255, 111, 92, 33),),
              
              ],
            ),
                   Row(
             
              children: [
                buildButton(onclick: () => buttonPressed('4'), text: '4'),
                buildButton(onclick: () => buttonPressed('5'), text: '5'),
                buildButton(onclick: () => buttonPressed('6'), text: '6'),
                buildButton(onclick: () => buttonPressed('×'), text: '×',color: const Color.fromARGB(255, 146, 121, 46),),
              
              ],
            ),
                   Row(
             
              children: [
                buildButton(onclick: () => buttonPressed('1'), text: '1'),
                buildButton(onclick: () => buttonPressed('2'), text: '2'),
                buildButton(onclick: () => buttonPressed('3'), text: '3'),
                buildButton(onclick: () => buttonPressed('-'), text: '-',color: const Color.fromARGB(255, 163, 134, 49),),
              
              ],
            ),
        
            Row(
              children: [
                buildButton(onclick: () => buttonPressed('C'), text: 'C'),
                buildButton(onclick: () => buttonPressed('0'), text: '0'),
                buildButton(onclick: () => buttonPressed('='), text: '='),
                buildButton(onclick: () => buttonPressed('+'), text: '+',color: const Color.fromARGB(255, 142, 121, 58),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

 