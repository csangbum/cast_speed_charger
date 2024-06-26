import 'package:flutter/material.dart';

import '../../charger_info.dart';
import '../../utils/utils.dart';

class NavigatorWidget extends StatefulWidget {
  final double paddingVertical = 7;
  final double iconWidthRatio = 35/394 * 100;
  NavigatorWidget({super.key, required this.screenCallback});
  late void Function() screenCallback;

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  ChargingController controller = ChargingController();
  @override
  Widget build(BuildContext context) {
    final double horizonPadding = Utils.getHorizonSize(widget.paddingVertical, context);
    final double iconSize = Utils.getHorizonSize(widget.iconWidthRatio, context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizonPadding, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff333333), // 변경하고자 하는 배경색
                shape: BoxShape.circle, // 원 모양으로 설정
              ),
              child: IconButton(
                icon:Icon(Icons.arrow_back_outlined),
                iconSize: iconSize,
                color: Colors.white,
                onPressed: () {
                  controller.moveToPreviousState();
                  // controller.moveToNextState();
                  setState(() {
                    print('csangbum click movetoNextState');
                    widget.screenCallback();
                  });
                },
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff333333), // 변경하고자 하는 배경색
                shape: BoxShape.circle, // 원 모양으로 설정
              ),
              child: IconButton(
                icon:const Icon(Icons.home),
                iconSize: iconSize,
                color: Colors.white,
                onPressed: () {
                  controller.setStatus(ChargingStatus.selectCable);
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
