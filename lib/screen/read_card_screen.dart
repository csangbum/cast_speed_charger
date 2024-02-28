import 'package:flutter/material.dart';

class ReadCardScreen extends StatefulWidget {
  const ReadCardScreen({super.key});

  @override
  State<ReadCardScreen> createState() => _ReadCardScreenState();
}

class _ReadCardScreenState extends State<ReadCardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
          image: AssetImage('assets/sceen04.png'),
          fit: BoxFit.fitWidth
      ),
    );
  }
}
