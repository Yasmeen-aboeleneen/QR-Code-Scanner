import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CreatePDF extends StatefulWidget {
  const CreatePDF({super.key});

  @override
  State<CreatePDF> createState() => _CreatePDFState();
}

class _CreatePDFState extends State<CreatePDF> {
  final picker = ImagePicker();
  final pdf = pw.Document();
  late List<File> _image = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 110, 138, 132),
        onPressed: GettingImage,
        child: Icon(
          Icons.add_a_photo_rounded,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 88, 125, 117),
        title: Text('Convert Images to PDF'),
        actions: [
          IconButton(
              onPressed: () {
                CreatePdf();
                SavePDF();
              },
              icon: Icon(
                Icons.picture_as_pdf_rounded,
                size: 35,
              ))
        ],
      ),
      body: _image != null
          ? ListView.builder(
              itemCount: _image.length,
              itemBuilder: (context, index) => Container(
                height: 400,
                width: double.infinity,
                margin: EdgeInsets.all(8),
                child: Image.file(
                  _image[index],
                  fit: BoxFit.cover,
                ),
              ),
            )
          : Container(),
    );
  }

  GettingImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image.add(File(pickedFile.path));
      } else {
        print('No File Selected !');
      }
    });
  }

  CreatePdf() async {
    for (var img in _image) {
      final image = pw.MemoryImage(img.readAsBytesSync());

      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context contex) {
            return pw.Center(child: pw.Image(image));
          }));
    }
  }

  SavePDF() async {
    try {
      final dir = await getExternalStorageDirectory();
      final file = File('${dir?.path}/filename.pdf');
      await file.writeAsBytes(await pdf.save());
      showPrintedMessage('success', 'saved to documents');
    } catch (e) {
      showPrintedMessage('error', e.toString());
    }
  }

  showPrintedMessage(String title, String msg) {
    Flushbar(
      title: title,
      message: msg,
      duration: Duration(seconds: 3),
      icon: Icon(
        Icons.info,
        color: Colors.blue,
      ),
    )..show(context);
  }
}
