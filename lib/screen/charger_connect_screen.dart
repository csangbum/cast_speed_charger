import 'package:flutter/material.dart';


import '../charger_info.dart';

class ChargerConnectScreen extends StatefulWidget {
  ChargerConnectScreen({super.key, required this.screenCallback});
  late void Function() screenCallback;

  @override
  State<ChargerConnectScreen> createState() => _ChargerConnectScreenState();
}

class _ChargerConnectScreenState extends State<ChargerConnectScreen> {
  ChargingController controller = ChargingController();
  @override
  Widget build(BuildContext context) {
    print('csangbum ${MediaQuery.of(context).size.width}');
    return InkWell(
      onTap: () {
        controller.setStatus(ChargingStatus.charging);
        setState(() {
          print('csangbum click movetoNextState');
          widget.screenCallback();
        });
      },
      child: const Center(
        child: Image(
          image: AssetImage('assets/sceen05.png'),
          fit: BoxFit.contain
        ),
      ),
    );
  }
}
