import 'package:flutter/material.dart';

final stack = Stack(
  alignment: const Alignment(0, 0),
  children: [
    const CircleAvatar(
      backgroundImage: AssetImage('images/avatar.jpeg'),
      radius: 100,
    ),
    Container(
      decoration: const BoxDecoration(
        color: Colors.green,
      ),
      child: const Text(
        'Mia B',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  ],
);

class StackContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: stack),
    );
  }
}
