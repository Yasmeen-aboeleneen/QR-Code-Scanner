import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:url_launcher/url_launcher_string.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String sdata = "No data found !";
  var height, width;
  bool hasData = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Hero(
      tag: 'Scan QR',
      child: Scaffold(
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
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text('${(sdata)}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 88, 125, 117),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.launch_outlined,
                          color: Color.fromARGB(255, 88, 125, 117),
                          ),
                          onPressed: () {
                            launchUrlString(sdata);
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var data = await FlutterBarcodeScanner.scanBarcode(
                          '#2A99CF', 'cancel', true, ScanMode.QR);
                      setState(() {
                        sdata = data.toString();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 88, 125, 117),
                        side: const BorderSide(color: Colors.orange, width: 1),
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        textStyle: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    child: const Text(('Scanner'))),
                SizedBox(
                  height: width,
                )
              ],
            ),
          )),
    );
  }

  Future<void> launch(String url) async {
    if (await launchUrlString(url)) {
      throw 'Could not launch $url';
    }
  }
}
