import 'package:flutter/material.dart';
import 'package:qr_scanner/PDF/PDF_Convertor.dart';

import 'package:qr_scanner/PDF/PDF_Reader.dart';

class PDFScrenn extends StatefulWidget {
  const PDFScrenn({super.key});

  @override
  State<PDFScrenn> createState() => _PDFScrennState();
}

class _PDFScrennState extends State<PDFScrenn> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 244, 244),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => PDFReader()));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(275, 60),
                  backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                  side: const BorderSide(color: Colors.orange, width: 1),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  textStyle: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold)),
              child: const Text('PDF Reader'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => PDFConvertor()));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(275, 60),
                  backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                  side: const BorderSide(color: Colors.orange, width: 1),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  textStyle: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
              child: const Text('PDF Convertor'),
            ),
          ],
        ),
      ),
    );
  }
}
