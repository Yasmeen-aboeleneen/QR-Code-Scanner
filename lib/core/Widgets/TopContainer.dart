import 'package:flutter/material.dart';
import 'package:qr_scanner/core/Constants/Colors.dart';
import 'package:qr_scanner/core/Constants/TextStyles.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class TopContainer extends StatelessWidget {
  TopContainer({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.h,
      width: double.infinity,
      child: Center(
          child: Text(
        text,
        style: TextOfTopContainer,
      )),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
        shape: BoxShape.rectangle,
      ),
    );
  }
}
