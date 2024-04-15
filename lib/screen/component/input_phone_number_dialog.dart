import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test3/constants/cast_color_const.dart';

import '../../utils/utils.dart';

class InputPhoneNumberDialog extends StatefulWidget {
  InputPhoneNumberDialog({super.key, required this.okClickCallback});
  late void Function() okClickCallback;

  @override
  _InputPhoneNumberDialogState createState() => _InputPhoneNumberDialogState();
}

class _InputPhoneNumberDialogState extends State<InputPhoneNumberDialog> {
  String phoneNumber = '';
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // border radius 설정
      ),
      child: Stack(
        children: [
          const Image(image: AssetImage('assets/sceen03-2_popup.png')),
          Positioned(
            top: Utils.getDirectVerticalSize(125, context),
            left: Utils.getDirectVerticalSize(33, context),
            child: SizedBox(
              height: Utils.getDirectVerticalSize(90, context),
              width: Utils.getDirectVerticalSize(296, context),
              child: TextField(
                style: const TextStyle(fontSize: GuiConstants.fontLargeSize, fontFamily: GuiConstants.fontFamilyNoto, fontWeight: FontWeight.w700, color: Colors.black),
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: '-없이 번호입력',
                  //labelText: '휴대폰 번호',
                ),
              ),
            ),
          ),
          Positioned(
            top: Utils.getDirectVerticalSize(180, context),
            left: Utils.getDirectVerticalSize((312-215)/2, context),
            child: SizedBox(
              height: Utils.getDirectVerticalSize(260, context),
              width: Utils.getDirectVerticalSize(260, context),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Utils.getDirectVerticalSize(15, context), horizontal: Utils.getDirectVerticalSize(10, context),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 중앙 정렬
                  children: [
                    Wrap(
                      spacing: Utils.getDirectVerticalSize(80, context), // 간격 설정
                      children: [
                        buildButton('1'),
                        buildButton('2'),
                        buildButton('3'),
                      ],
                    ),
                    Wrap(
                      spacing: Utils.getDirectVerticalSize(80, context), // 간격 설정
                      children: [
                        buildButton('4'),
                        buildButton('5'),
                        buildButton('6'),
                      ],
                    ),
                    Wrap(
                      spacing: Utils.getDirectVerticalSize(80, context), // 간격 설정
                      children: [
                        buildButton('7'),
                        buildButton('8'),
                        buildButton('9'),
                      ],
                    ),
                    Wrap(
                      spacing: Utils.getDirectVerticalSize(70, context), // 간격 설정
                      children: [
                        buildButton('00'),
                        buildButton('0'),
                        buildButton('del'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: Utils.getDirectVerticalSize(20, context),
            left: Utils.getDirectVerticalSize((312 - (115 *2))/2, context),// (312 - (115 *2))/2
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                  },
                  child: const Image(
                    image: AssetImage('assets/cancel.png'),
                    // width: 120,
                  ),
                ),
                SizedBox(width: Utils.getDirectVerticalSize(16, context)),
                InkWell(
                  onTap: () {
                    // 확인 버튼 눌렸을 때 동작 추가
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                    widget.okClickCallback();
                  },
                  child: const Image(
                    image: AssetImage('assets/ok.png'),
                    // width: 120,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildButton(String text) {
    return TextButton(
        onPressed: () {
          print('csangbum inputText = $text');
          setState(() {
            if (text == 'del') {
              phoneNumber = '';
            } else {
              phoneNumber += text;
            }
            textEditingController.text = phoneNumber;
          });
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
          const Size(50, 50),)), // 원하는 너비와 높이로 설정
        child: Text(text, style: const TextStyle(fontSize: GuiConstants.fontLargeSize, fontFamily: GuiConstants.fontFamilyNoto, color: Colors.black, ),));
  }
}

