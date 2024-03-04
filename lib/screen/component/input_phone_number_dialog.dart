import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test3/constants/cast_color_const.dart';

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
            top: 120,
            left: 40,
            child: SizedBox(
              height: 120,
              width: 300,
              child: TextField(
                style: const TextStyle(fontSize: 25, fontFamily: GuiConstants.fontFamilyNoto, fontWeight: FontWeight.w700, color: Colors.black),
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: '-없이 번호입력',
                  //labelText: '휴대폰 번호',
                ),
              ),
            ),
          ),

          Positioned(
            top: 160,
            // right: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                children: [
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 50, // 간격 설정
                    children: [
                      buildButton('1'),
                      buildButton('2'),
                      buildButton('3'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 50, // 간격 설정
                    children: [
                      buildButton('4'),
                      buildButton('5'),
                      buildButton('6'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 50, // 간격 설정
                    children: [
                      buildButton('7'),
                      buildButton('8'),
                      buildButton('9'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 50, // 간격 설정
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
          Positioned(
            bottom: 20,
            left: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                    },
                    child: const Image(
                      image: AssetImage('assets/cancel.png'),
                      width: 120,
                    ),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      // 확인 버튼 눌렸을 때 동작 추가
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                      widget.okClickCallback();
                    },
                    child: const Image(
                      image: AssetImage('assets/ok.png'),
                      width: 120,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    ;

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
          const Size(70, 70),)), // 원하는 너비와 높이로 설정
        child: Text(text, style: const TextStyle(fontSize: 30, fontFamily: GuiConstants.fontFamilyNoto, color: Colors.black, ),));
  }
}

