import 'package:flutter/material.dart';
import 'package:test3/constants/cast_color_const.dart';
import 'package:test3/screen/component/input_phone_number_dialog.dart';
import 'package:test3/screen/component/input_price_dialog.dart';

import '../charger_info.dart';
import '../utils/utils.dart';

class SelectChargerCable extends StatefulWidget {
  final double paddingVertical = 7;
  final double orSizeRatio = 50/695*100;
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
    final double orHeight = Utils.getHorizonSize(widget.orSizeRatio, context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizonPadding),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 45,),
            const DefaultTextStyle(
                style: TextStyle(
                  fontFamily: GuiConstants.fontFamilyNoto,
                  fontSize: GuiConstants.fontLargeSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
                textAlign: TextAlign.center,
                child: Text("충전을 시작하시려면\r\n충전 케이블을 선택해 주세요.")),
            const SizedBox(height: 25,),
            InkWell(
              highlightColor: Colors.transparent, //모서리로 퍼져나가는 이펙트
              splashColor: Colors.transparent, //클릭시 원형 이펙트
              onTap: () {
                controller.setChargerState(1, ChargerState.selected);
                controller.setStatus(ChargingStatus.selectPayment);
                setState(() {
                  print('csangbum click movetoNextState');
                  widget.screenCallback();
                });
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return const InputPhoneNumberDialog(); // 위에서 정의한 다이얼로그 사용
                //   },
                // );
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
                height: orHeight,
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent, //모서리로 퍼져나가는 이펙트
              splashColor: Colors.transparent, //클릭시 원형 이펙트
              onTap: () {
                controller.setStatus(ChargingStatus.selectPayment);
                controller.setChargerState(2, ChargerState.selected);
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
      ),
    );
  }
}
