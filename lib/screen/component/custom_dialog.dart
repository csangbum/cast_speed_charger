import 'package:flutter/material.dart';
import 'package:test3/constants/cast_color_const.dart';


class CustomDialog extends StatelessWidget {
  CustomDialog({super.key, required this.okClickCallback});
  late void Function() okClickCallback;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // border radius 설정
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // 흰색 배경을 사용
          borderRadius: BorderRadius.circular(8.0), // 테두리를 둥글게 만듦
        ),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            const Image(image: AssetImage('assets/sceen07_popup.png')),
            const Positioned(
              top: 120,
              right: 40,
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: GuiConstants.fontFamilyNoto,
                ),
                child: Text('00:30:50'),
              ),
            ),
            const Positioned(
              top: 150,
              right: 40,
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: GuiConstants.fontFamilyNoto,
                ),
                child: Text('10.76kWh'),
              ),
            ),
            const Positioned(
              top: 175,
              right: 40,
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: GuiConstants.fontFamilyNoto,
                ),
                child: Text('2800원'),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 다이얼로그 닫기
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0066ff), //Colors.blueAccent, // 파란색 버튼
                  minimumSize: const Size(260, 45),
                ),
                child: const Text(
                  "확인",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: GuiConstants.fontFamilyNoto,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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