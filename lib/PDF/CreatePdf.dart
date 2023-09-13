import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
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
  List<File> _image = [];
  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 88, 125, 117),
        onPressed: getImageFromGallery,
        child: Icon(
          Icons.add_a_photo_rounded,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
              child: ListView.builder(
                itemCount: _image.length,
                itemBuilder: (context, index) => Container(
                    height: 400,
                    width: double.infinity,
                    margin: EdgeInsets.all(8),
                    child: Image.file(
                      _image[index],
                      fit: BoxFit.cover,
                    )),
              ),
              height: 500,
              decoration: BoxDecoration(
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
              onPressed: () {
                createPDF();
                saveFile();
              },
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
                  textStyle: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image.add(File(pickedFile.path));
      } else {
        print('No image selected');
      }
    });
  }

  createPDF() async {
    for (var img in _image) {
      final image = pw.MemoryImage(img.readAsBytesSync());

      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context contex) {
            return pw.Center(child: pw.Image(image));
          }));
    }
  }

  Future<void> saveFile() async {
    final pdf = pw.Document();
    final directory = await getExternalStorageDirectory();
    final file = File("${directory?.path}/file.pdf");

    final pdfBytes = await pdf.save();
    await file.writeAsBytes(pdfBytes.toList());
    showPrintedMessage('success', 'saved to documents');
    DocumentFileSavePlus().saveMultipleFiles(
      dataList: [
        pdfBytes,
      ],
      fileNameList: [
        "file.pdf",
      ],
      mimeTypeList: [
        "file.pdf",
      ],
    );
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
