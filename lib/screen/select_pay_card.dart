import 'package:flutter/material.dart';
import 'package:test3/screen/component/input_price_dialog.dart';

import '../charger_info.dart';
import '../constants/cast_color_const.dart';
import '../utils/utils.dart';
import 'component/input_phone_number_dialog.dart';

class SelectPayCardScreen extends StatefulWidget {
  final double gap = 7/392*100;
  final double imageRatio = 164/392*100;
  final double padding = 25/392*100;
  SelectPayCardScreen({super.key, required this.screenCallback});
  late void Function() screenCallback;

  @override
  State<SelectPayCardScreen> createState() => _SelectPayCardScreenState();
}

class _SelectPayCardScreenState extends State<SelectPayCardScreen> {
  ChargingController controller = ChargingController();

  @override
  Widget build(BuildContext context) {
    double paddingSize = Utils.getHorizonSize(widget.padding, context);
    double imageSize = Utils.getHorizonSize(widget.imageRatio, context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingSize),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 130,),
            const DefaultTextStyle(
                style: TextStyle(
                    fontFamily: GuiConstants.fontFamilyNoto,
                    fontSize: GuiConstants.fontLargeSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                textAlign: TextAlign.center,
                child: Text("결재방식을 선택해 주세요.")),
            SizedBox(height: Utils.getVerticalSize(30/695*100, context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return InputPhoneNumberDialog(okClickCallback: onOkClick,); // 위에서 정의한 다이얼로그 사용
                      },
                    );
                    // controller.setStatus(ChargingStatus.readCard);
                    // setState(() {
                    //   widget.screenCallback();
                    // });
                  },
                  child: Image(
                    image: const AssetImage('assets/paytype_iccard.png'),
                    width: imageSize,
                  ),
                ),
                SizedBox(width: Utils.getHorizonSize(widget.gap, context)),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return InputPhoneNumberDialog(okClickCallback: onOkClick,); // 위에서 정의한 다이얼로그 사용
                      },
                    );
                    // controller.setStatus(ChargingStatus.readCard);
                    // setState(() {
                    //   widget.screenCallback();
                    // });
                  },
                  child: Image(
                    image: const AssetImage('assets/paytype_usercard.png'),
                    width: imageSize,
                  ),
                ),
              ],
            ),
          ]
            ),
      ),
    );
  }

  void onOkClick() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return InputPriceDialog(okClickCallback: processAfterInputPrice,); // 위에서 정의한 다이얼로그 사용
      },
    );
  }

  void processAfterInputPrice() {
    controller.setStatus(ChargingStatus.readCard);
    setState(() {
      widget.screenCallback();
    });
  }
}
