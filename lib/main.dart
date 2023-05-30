import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      routes: {
        '/result': (context) => const ResultPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();

  void swapTextFields() {
    String temp = textField1Controller.text;
    textField1Controller.text = textField2Controller.text;
    textField2Controller.text = temp;
  }

  void checkIfSame(BuildContext context) {
    String result;
    if (textField1Controller.text == textField2Controller.text) {
      result = 'SAME';
    } else {
      result = 'NOT THE SAME';
    }
    Navigator.pushNamed(context, '/result', arguments: result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textField1Controller,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    swapTextFields();
                  },
                  child: const Text('Swap'))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textField2Controller,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    checkIfSame(context);
                  },
                  child: const Text('Check'))
            ],
          ),
        ],
      ),
    ));
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? result =
        ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Text(
          result ?? 'No result found',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
