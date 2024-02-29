import 'package:flutter/material.dart';
import 'package:test3/constants/cast_color_const.dart';


class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // border radius 설정
      ),

      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(20), // 패딩 설정
      content: SizedBox(
        width: MediaQuery.of(context).size.width-10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '충전',
                    style: TextStyle(color: Colors.black, fontFamily: GuiConstants.fontFamilyNoto,fontSize: 25,fontWeight: FontWeight.w700, ),
                  ),
                  TextSpan(
                    text: '완료',
                    style: TextStyle(color: Colors.blueAccent, fontFamily: GuiConstants.fontFamilyNoto,fontSize: 25,fontWeight: FontWeight.w700, ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            const Center(
                child: DefaultTextStyle(
                  style: TextStyle(
                  color: Colors.grey,
                  fontFamily: GuiConstants.fontFamilyNoto,
                  fontSize: 15),
                  child: Text("충전내역을 확인하세요"))),
            const SizedBox(height: 20), // 간격 추가
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xffececec),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTitleAndTime('충전시간', '00:30:50', Colors.black),
                  getTitleAndTime('충전량', '10.76kWh', Colors.black),
                  getTitleAndTime('충전금액', '2800원', Colors.blueAccent),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // 다이얼로그 닫기
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0066ff),//Colors.blueAccent, // 파란색 버튼
              minimumSize: const Size(400,45),
            ),
            child: const Text("확인", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: GuiConstants.fontFamilyNoto)),
          ),
        ),
      ],
    );
  }
  Widget getTitleAndTime(String title, String value, Color inputColor) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultTextStyle(
              style: const TextStyle(color: Colors.black,
                  fontSize: 15,
                  fontFamily: GuiConstants.fontFamilyNoto),
              child: Text(title)),
          DefaultTextStyle(
            style: TextStyle(color: inputColor,
                fontSize: 15,

                fontFamily: GuiConstants.fontFamilyNoto),
            child: Text(value),)
        ],
      ),
    );
  }
}