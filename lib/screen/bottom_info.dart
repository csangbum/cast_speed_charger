import 'package:flutter/material.dart';

import '../utils/utils.dart';

class BottomInfo extends StatelessWidget {
  final double horizonPaddingRadio = 7;
  const BottomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    double horizonPadding = Utils.getHorizonSize(horizonPaddingRadio, context);
    return const SizedBox(
      // height: 50,
      child:
        Image(image:AssetImage('assets/footer.png')),
      // Padding(
      //   padding: EdgeInsets.symmetric(horizontal: horizonPadding),
      //   child: const Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           DefaultTextStyle(
      //               style: TextStyle(
      //                   color: Colors.white,
      //                   fontFamily: GuiConstants.fontFamilyNoto,
      //                   fontSize: 8),
      //               child: Text("U25 - F1.D.1.0_TV_FrimInfo")),
      //           SizedBox(height: 3,),
      //           DefaultTextStyle(
      //               style: TextStyle(
      //                   color: Colors.grey,
      //                   fontFamily: GuiConstants.fontFamilyNoto,
      //                   fontWeight: FontWeight.w700,
      //                   fontSize: 14),
      //               child: Text("ID : CP0001")),
      //         ],
      //       ),
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         children: [
      //           DefaultTextStyle(
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontFamily: GuiConstants.fontFamilyNoto,
      //                 fontSize: 9),
      //               child: Text("고객센터 070-4855-2090")),
      //           SizedBox(height: 7,),
      //           Image(
      //             image: AssetImage('assets/castpro_logo.png'),
      //             width: 160,
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
