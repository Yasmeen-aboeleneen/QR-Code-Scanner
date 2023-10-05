import 'package:flutter/material.dart';

class PDFReader extends StatefulWidget {
  const PDFReader({super.key});

  @override
  State<PDFReader> createState() => _PDFReaderState();
}

class _PDFReaderState extends State<PDFReader> {
  var height, width;
  String uri = 'http://africau.edu/images/default/sample.pdf';
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold();
  }
}
