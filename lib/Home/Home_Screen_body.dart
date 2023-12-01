import 'package:flutter/material.dart';
import 'package:qr_scanner/QRScreens/Create_QRcode.dart';
import 'package:qr_scanner/QRScreens/Scan_QRcode.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'Assets/Images/picc.jpg',
                    width: 240,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Column(children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => QRGeneratorSharePage()));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(275, 60),
                    backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                    side: const BorderSide(color: Colors.orange, width: 1),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    textStyle: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold)),
                child: const Text('Generate QR Code'),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => ScanScreen()));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(275, 60),
                    backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                    side: const BorderSide(color: Colors.orange, width: 1),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    textStyle: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold)),
                child: const Text('Scan Barcode'),
              ),
              SizedBox(
                height: 60,
              ),
            ]),
          ]),
    );
  }
}
