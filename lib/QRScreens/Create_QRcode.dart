 
 
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CreateQRcode extends StatefulWidget {
  const CreateQRcode({super.key});

  @override
  State<CreateQRcode> createState() => _CreateQRcodeState();
}

class _CreateQRcodeState extends State<CreateQRcode> {
  var dAta = 'Add Data';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 88, 125, 117),
        title: const Text(
          'Creating QR code',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
             BarcodeWidget(
              data: dAta,
              barcode: Barcode.qrCode(),
              color: const Color.fromARGB(255, 88, 125, 117),
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: TextField(
                  cursorColor: const Color.fromARGB(255, 88, 125, 117),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 88, 125, 117),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  onChanged: (val) {
                    setState(() {
                      dAta = val;
                    });
                  },
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 88, 125, 117),
                            width: 2.5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange, width: 2.5)),
                    hintText: 'Enter Data Here',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 88, 125, 117),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
