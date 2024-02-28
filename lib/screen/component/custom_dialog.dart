import 'package:flutter/cupertino.dart';
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
      title: const Center(
          child: DefaultTextStyle(
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: GuiConstants.fontFamilyNoto,
                  fontWeight: FontWeight.w700,
                  fontSize: 25),
              child: Text("충전완료"))),
      titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      content: SizedBox(
        width: MediaQuery.of(context).size.width-10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: DefaultTextStyle(
                  style: TextStyle(
                  color: Colors.black,
                  fontFamily: GuiConstants.fontFamilyNoto,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
                  child: Text("충전내역을 확인하세요"))),
            const SizedBox(height: 20), // 간격 추가
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Colors.grey[300]
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTitleAndTime('충전시간', '00:30:50'),
                  getTitleAndTime('충전량', '10.76kWh'),
                  getTitleAndTime('충전금액', '2800원'),
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
              backgroundColor: Colors.blueAccent, // 파란색 버튼
              minimumSize: Size(400,45),
            ),
            child: const Text("확인", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: GuiConstants.fontFamilyNoto)),
          ),
        ),
      ],
    );
  }
  Widget getTitleAndTime(String title, String value) {
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
            style: const TextStyle(color: Colors.blueAccent,
                fontSize: 15,

                fontFamily: GuiConstants.fontFamilyNoto),
            child: Text(value),)
        ],
      ),
    );
  }
}