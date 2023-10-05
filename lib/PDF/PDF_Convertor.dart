import 'package:flutter/material.dart';
 

class PDFConvertor extends StatefulWidget {
  const PDFConvertor({super.key});

  @override
  State<PDFConvertor> createState() => _PDFConvertorState();
}

class _PDFConvertorState extends State<PDFConvertor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: Center(
                    child: Text(
                  'PDF Convertor',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 88, 125, 117),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
