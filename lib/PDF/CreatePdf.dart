import 'package:flutter/material.dart';

class CreatePDF extends StatefulWidget {
  const CreatePDF({super.key});

  @override
  State<CreatePDF> createState() => _CreatePDFState();
}

class _CreatePDFState extends State<CreatePDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 88, 125, 117),
        onPressed: () {},
        child: Icon(
          Icons.add_a_photo_rounded,
          color: Colors.white,
        ),
      ),
      body: Column(children: [
        Container(
          height: 150,
          width: double.infinity,
          child: Center(
              child: Text(
            'Convert To PDF',
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
          height: 15,
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orange,
              ),
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
              shape: BoxShape.rectangle),
        ),
        SizedBox(
          height: 18,
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.picture_as_pdf_outlined),
          label: Text('Convert'),
          style: ElevatedButton.styleFrom(
              fixedSize: Size(170, 50),
              backgroundColor: const Color.fromARGB(255, 88, 125, 117),
              side: const BorderSide(color: Colors.orange, width: 1),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              textStyle:
                  const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        ),
      ]),
    );
  }
}
