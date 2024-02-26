import 'package:flutter/material.dart';

class ImageToggleButton extends StatefulWidget {
  ImageToggleButton({Key? key, required this.normalImagePath, required this.touchImagePath}) : super(key: key);
  String normalImagePath;
  String touchImagePath;

  @override
  State<ImageToggleButton> createState() => _ImageToggleButtonState();
}

class _ImageToggleButtonState extends State<ImageToggleButton> {
  bool isTouched = false;

  void setTouched() {
    setState(() {
      isTouched = true;
    });
  }

  void setUntouched() {
    setState(() {
      isTouched = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTapDown: (details) {
            setTouched();
          },
          onTapUp: (details) {
            setUntouched();
          },
          onTapCancel: () {
            setUntouched();
          },
          child: Center(
            child: isTouched
                ? Image.asset('assets/touch_image.png') // 터치 이미지
                : Image.asset('assets/normal_image.png'), // 보통 이미지
          )
      ),
    );
  }
}
