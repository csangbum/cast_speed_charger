import 'package:flutter/material.dart';
import 'package:test3/constants/cast_color_const.dart';

import '../utils/utils.dart';

class BottomInfo extends StatelessWidget {
  final double horizonPaddingRadio = 7;
  const BottomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    double horizonPadding = Utils.getHorizonSize(horizonPaddingRadio, context);
    return SizedBox(
      height: 50,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizonPadding),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: GuiConstants.fontFamilyNoto,
                        fontSize: 8),

                    child: Text("U25 - F1.D.1.0_TV_FrimInfo")),
                // Text("U25 - F1.D.1.0_TV_FrimInfo",
                //   style: TextStyle(color: Colors.white, fontSize: 10, height: 1.0),),
                SizedBox(height: 3,),
                DefaultTextStyle(
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: GuiConstants.fontFamilyNoto,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                    child: Text("ID : CP0001")),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: GuiConstants.fontFamilyNoto,
                      fontSize: 9),

                    child: Text("고객센터 070-4855-2090   ")),
                Image(
                  image: AssetImage('assets/castpro_logo.png'),
                  width: 160,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
