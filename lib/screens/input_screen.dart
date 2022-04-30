import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  static const routeName = 'input_screen';
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input screen"),
      ),
    );
  }
}
