import 'package:flutter/material.dart';
import 'package:qr_scanner/QRScreens/Create_QRcode.dart';
import 'package:qr_scanner/QRScreens/Scan_QRcode.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 50,
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => QRGeneratorSharePage()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                side: const BorderSide(color: Colors.orange, width: 1),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                textStyle:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            child: const Text('Generate QR code'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => ScanScreen()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                side: const BorderSide(color: Colors.orange, width: 1),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                textStyle:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            child: const Text('Scan QR code'),
          ),
        ]),
        SizedBox(
          width: MediaQuery.of(context).size.width,
        )
      ]),
    );
  }
}
