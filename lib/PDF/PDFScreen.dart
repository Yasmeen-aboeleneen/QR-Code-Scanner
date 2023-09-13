import 'package:flutter/material.dart';

import 'package:neon_widgets/neon_widgets.dart';

class PDFScrenn extends StatefulWidget {
  const PDFScrenn({super.key});

  @override
  State<PDFScrenn> createState() => _PDFScrennState();
}

class _PDFScrennState extends State<PDFScrenn> {
  @override
  // void initState() {
  //   super.initState();

  //   NavigateToCreatePDF();
  // }

  // void NavigateToCreatePDF() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     GoRouter.of(context).push(AppRouter.KcreatePdf);
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 244, 244),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: FlickerNeonText(
                  text: "SOON",
                  fontFamily: 'RobotoSlab-Bold',
                   
                  spreadColor: const Color.fromARGB(255, 88, 125, 117),
                  blurRadius: 40,
                  textSize: 50,
                  textColor: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(
                width: 10,
              ),
         NeonTriangleVerticesProgressBar(lightBlurRadius: 20,
         lightSpreadRadius: 4,
         pointSize: 2,
         )
              // Center(
              //   child: CircleAvatar(
              //     radius: 70,
              //     child: Image.asset(
              //       'Assets/Images/pdf.jpeg',
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
