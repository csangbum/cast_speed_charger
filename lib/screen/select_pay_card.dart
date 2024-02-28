import 'package:flutter/material.dart';

import '../constants/cast_color_const.dart';
import '../utils/utils.dart';

class SelectPayCardScreen extends StatefulWidget {
  final double paddingVertical = 7;
  final double imageRatio = 450/1080*100;
  const SelectPayCardScreen({super.key});

  @override
  State<SelectPayCardScreen> createState() => _SelectPayCardScreenState();
}

class _SelectPayCardScreenState extends State<SelectPayCardScreen> {
  @override
  Widget build(BuildContext context) {
    double paddingSize = Utils.getHorizonSize(widget.paddingVertical, context);
    double imageSize = Utils.getHorizonSize(widget.imageRatio, context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingSize),
        child: Column(
          children: [
            const SizedBox(height: 130,),
            const DefaultTextStyle(
                style: TextStyle(
                    fontFamily: GuiConstants.fontFamilyNoto,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                textAlign: TextAlign.center,
                child: Text("결재방식을 선택해 주세요.")),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image(
                      image: const AssetImage('assets/paytype_iccard.png'),
                      width: imageSize,
                    ),
                    // Text("신용카드\r\n삼성페이"),
                  ],
                ),
                const SizedBox(width: 8,),
                Column(
                  children: [
                    // Image(),
                    Image(
                      image: const AssetImage('assets/paytype_usercard.png'),
                      width: imageSize,
                    ),
                    // Text("회원카드\r\n환경부카드"),
                  ],
                ),
              ],
            ),
          ]
            ),
      )
    );
  }
}
