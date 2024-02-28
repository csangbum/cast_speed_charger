import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChargerConnectScreen extends StatefulWidget {
  const ChargerConnectScreen({super.key});

  @override
  State<ChargerConnectScreen> createState() => _ChargerConnectScreenState();
}

class _ChargerConnectScreenState extends State<ChargerConnectScreen> {
  @override
  Widget build(BuildContext context) {
    print('csangbum ${MediaQuery.of(context).size.width}');
    return const Image(
      image: AssetImage('assets/sceen05.png'),
      fit: BoxFit.contain
    );
  }
}
