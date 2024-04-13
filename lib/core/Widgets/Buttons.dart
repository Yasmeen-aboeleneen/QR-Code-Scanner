import 'package:flutter/material.dart';
import 'package:qr_scanner/QRScreens/Create_QRcode.dart';
import 'package:qr_scanner/QRScreens/Scan_QRcode.dart';
import 'package:qr_scanner/core/Constants/Colors.dart';
import 'package:sizer/sizer.dart';

class ElevatedButton1 extends StatelessWidget {
  const ElevatedButton1({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => QRGeneratorSharePage()));
      },
      style: ElevatedButton.styleFrom(
          fixedSize: Size(85.w, 8.h),
          backgroundColor: kBackgroundColor,
          side: const BorderSide(color: kBorderSideColor, width: 1),
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
      child: Text(
        'Generate QR Code',
        style: TextStyle(color: kPrimaryColor),
      ),
    );
  }
}

class ElevatedButton2 extends StatelessWidget {
  const ElevatedButton2({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => ScanScreen()));
      },
      style: ElevatedButton.styleFrom(
          fixedSize: Size(85.w, 8.h),
          backgroundColor: kBackgroundColor,
          side: const BorderSide(color: kBorderSideColor, width: 1),
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
      child: Text(
        'Scan Barcode',
        style: TextStyle(color: kPrimaryColor),
      ),
    );
  }
}
