import 'package:flutter/material.dart';

import '../charger_info.dart';

class ReadCardScreen extends StatefulWidget {
  ReadCardScreen({super.key, required this.screenCallback});
  late void Function() screenCallback;

  @override
  State<ReadCardScreen> createState() => _ReadCardScreenState();
}

class _ReadCardScreenState extends State<ReadCardScreen> {
  ChargingController controller = ChargingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.setStatus(ChargingStatus.connectCable);
        setState(() {
          widget.screenCallback();
        });
      },
      child: const Center(
        child: Image(
            image: AssetImage('assets/sceen04.png'),
            fit: BoxFit.fitWidth
        ),
      ),
    );
  }
}
