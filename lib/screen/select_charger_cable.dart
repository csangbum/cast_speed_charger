import 'package:flutter/material.dart';
import 'package:test3/constants/cast_color_const.dart';

import '../charger_info.dart';
import '../utils/utils.dart';

class SelectChargerCable extends StatefulWidget {
  final double paddingVertical = 7;
  final double orSizeRatio = 355/1080*100;
  SelectChargerCable({super.key, required this.screenCallback});
  late void Function() screenCallback;

  @override
  State<SelectChargerCable> createState() => _SelectChargerCableState();
}

class _SelectChargerCableState extends State<SelectChargerCable> {
  ChargingController controller = ChargingController();
  @override
  Widget build(BuildContext context) {
    final double horizonPadding = Utils.getHorizonSize(widget.paddingVertical, context);
    final double orWidth = Utils.getHorizonSize(widget.orSizeRatio, context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizonPadding),
      child: Column(
        children: [
          const SizedBox(height: 45,),
          const DefaultTextStyle(
              style: TextStyle(
                fontFamily: GuiConstants.fontFamilyNoto,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white),
              textAlign: TextAlign.center,
              child: Text("충전을 시작하시려면\r\n충전 방식을 선택해 주세요.")),
          const SizedBox(height: 25,),
          InkWell(
            onTap: () {
              controller.setStatus(ChargingStatus.selectPayment);
              setState(() {
                print('csangbum click movetoNextState');
                widget.screenCallback();
              });
            },
            child: const Image(
              image: AssetImage('assets/c_type.png'),
              width: 920,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Image(
              image: const AssetImage('assets/OR.png'),
              width: orWidth,
            ),
          ),
          InkWell(
            onTap: () {
              controller.setStatus(ChargingStatus.selectPayment);
              setState(() {
                print('csangbum click movetoNextState');
                widget.screenCallback();
              });
            },
            child: const Image(
              image: AssetImage('assets/b_type.png'),
              width: 920,
            ),
          ),
        ],
      ),
    );
  }
}