import 'package:flutter/material.dart';
import 'package:test3/constants/cast_color_const.dart';

import '../../utils/utils.dart';

class InputPriceDialog extends StatefulWidget {
  InputPriceDialog({super.key, required this.okClickCallback});
  late void Function() okClickCallback;

  @override
  _InputPriceDialogState createState() => _InputPriceDialogState();
}

class _InputPriceDialogState extends State<InputPriceDialog> {
  String phoneNumber = '';
  final double dialogWidth = 313;
  final double dialogHeight = 508;

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
          const Image(image: AssetImage('assets/sceen03-1_popup.png')),
          Positioned(
            top: Utils.getDirectVerticalSize(96.5, context),
            left: Utils.getDirectVerticalSize(75, context),
            child: const DefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontSize: GuiConstants.fontMediumSize,
                fontFamily: GuiConstants.fontFamilyNoto,
              ),
              child: Text('320 원'),
            ),
          ),
          Positioned(
            top: Utils.getDirectVerticalSize(96.5, context),
            right: Utils.getDirectVerticalSize(75, context),
            child: const DefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontSize: GuiConstants.fontMediumSize,
                fontFamily: GuiConstants.fontFamilyNoto,
              ),
              child: Text('4.62 kw/h'),
            ),
          ),
          Positioned(
            top: Utils.getDirectVerticalSize(178, context), //Utils.getDire,
            left: Utils.getDirectVerticalSize(25, context),
            child: SizedBox(
              height: Utils.getDirectVerticalSize(120, context),
              width: Utils.getDirectVerticalSize(310, context),
              child: TextField(
                style: const TextStyle(fontSize: GuiConstants.fontLargeSize, fontFamily: GuiConstants.fontFamilyNoto, fontWeight: FontWeight.w700, color: Colors.black),
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: '충전금액',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.cancel_outlined, color: Colors.grey, size: Utils.getDirectVerticalSize(25, context)),

                    onPressed: (){
                      setState(() {
                        textEditingController.clear();
                      });
                    },),
                  ),
                ),
              ),
            ),
          Positioned(
            top: Utils.getDirectVerticalSize(210, context),
            left: Utils.getDirectVerticalSize(22, context),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Utils.getDirectVerticalSize(10, context), horizontal: Utils.getDirectVerticalSize(20, context)),
              child: SizedBox(
                height: Utils.getDirectVerticalSize(260, context),
                width: Utils.getDirectVerticalSize(260, context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 중앙 정렬
                  children: [
                    const SizedBox(height: 10),
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
            left: Utils.getDirectVerticalSize((dialogWidth - (115 *2))/2, context),// (312 - (115 *2))/2
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                  },
                  child: const Image(
                    image: AssetImage('assets/cancel.png'),
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

