import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var sdata = "let's Scan it";
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 88, 125, 117),
          title: const Text(
            'Scanning QR code',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(sdata,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 88, 125, 117),
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
              Image.asset(
                'Assets/Images/download.png',
                width: 200,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: scanQr,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                      side: const BorderSide(color: Colors.orange, width: 1),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      textStyle: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold)),
                  child: const Text(('Scanner'))),
              SizedBox(
                height: width,
              )
            ],
          ),
        ));
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR)
          .then((value) {
        setState(() {
          sdata = value;
        });
      });
    } catch (e) {
      setState(() {
        sdata = 'unable to read this';
      });
    }
  }
}
