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

    return InkWell(
      highlightColor: Colors.transparent, //모서리로 퍼져나가는 이펙트
      splashColor: Colors.transparent, //클릭시 원형 이펙트
      onTap: () {
        controller.setStatus(ChargingStatus.charging);
        if (controller.getChargerState(1) == ChargerState.selected) {
          controller.setChargerState(1, ChargerState.charging);
        }
        if (controller.getChargerState(2) == ChargerState.selected) {
          controller.setChargerState(2, ChargerState.charging);
        }
        print('csangbum click ch1 ${controller.getChargerState(1)} ch2 ${controller.getChargerState(1)}');
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
