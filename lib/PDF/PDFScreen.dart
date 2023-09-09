import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_scanner/core/Utils/AppRouter.dart';

class PDFScrenn extends StatefulWidget {
  const PDFScrenn({super.key});

  @override
  State<PDFScrenn> createState() => _PDFScrennState();
}

class _PDFScrennState extends State<PDFScrenn> {
  @override
  void initState() {
    super.initState();

    NavigateToCreatePDF();
  }

  void NavigateToCreatePDF() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.KcreatePdf);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 244, 244),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                'Convert images to PDF',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
              SizedBox(
                height: 25,
              ),
              Center(
                child: CircleAvatar(
                  radius: 70,
                  child: Image.asset(
                    'Assets/Images/pdf.jpeg',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
