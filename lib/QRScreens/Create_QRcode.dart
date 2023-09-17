import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner/AddManger.dart';
import 'package:share_plus/share_plus.dart';

class QRGeneratorSharePage extends StatefulWidget {
  const QRGeneratorSharePage({Key? key}) : super(key: key);
  @override
  _QRGeneratorSharePageState createState() => _QRGeneratorSharePageState();
}

class _QRGeneratorSharePageState extends State<QRGeneratorSharePage> {
  final key = GlobalKey();
  String textdata =
      '<a class="vglnk" href="http://androidride.com" rel="nofollow"><span>androidride</span><span>.</span><span>com</span></a>';
  final textcontroller = TextEditingController();
  File? file;
  Color pickerColor = Color(0xff443a49);
  Color currentColor = const Color.fromARGB(255, 88, 125, 117);

  var height, width;

  BannerAd? bannerAdd;

  bool isLoaded = false;

  void load() {
    bannerAdd = BannerAd(
        size: AdSize.banner,
        adUnitId: AddManger.BannerQR,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
        request: AdRequest())
      ..load();
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  void dispose() {
    if (isLoaded) {
      bannerAdd!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
                  'QR Code Generator',
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
                height: 40,
              ),
              RepaintBoundary(
                key: key,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () => showPicker(),
                          icon: Icon(Icons.colorize_sharp,
                              color: const Color.fromARGB(
                                255,
                                88,
                                125,
                                117,
                              ))),
                      QrImageView(
                        foregroundColor: currentColor,
                        size: 250,
                        data: textdata,
                      ),
                      IconButton(
                          onPressed: () async {
                            try {
                              RenderRepaintBoundary boundary =
                                  key.currentContext!.findRenderObject()
                                      as RenderRepaintBoundary;

                              var image = await boundary.toImage();
                              ByteData? byteData = await image.toByteData(
                                  format: ImageByteFormat.png);
                              Uint8List pngBytes =
                                  byteData!.buffer.asUint8List();

                              final appDir =
                                  await getApplicationDocumentsDirectory();

                              var datetime = DateTime.now();

                              file = await File('${appDir.path}/$datetime.png')
                                  .create();

                              await file?.writeAsBytes(pngBytes);
                              await Share.shareFiles(
                                [file!.path],
                                mimeTypes: ["image/png"],
                                text: "Share the QR Code",
                              );
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                          icon: Icon(
                            Icons.share,
                            color: const Color.fromARGB(255, 88, 125, 117),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: TextField(
                    controller: textcontroller,
                    cursorColor: const Color.fromARGB(255, 88, 125, 117),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 88, 125, 117),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 88, 125, 117),
                              width: 2.5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2.5)),
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
                height: 17,
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    textdata = textcontroller.text;
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                    side: const BorderSide(color: Colors.orange, width: 1),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                child: const Text('Generate QR code'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Future showPicker() {
    return showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
              child: const Text('Change'),
              onPressed: () {
                setState(() => currentColor = pickerColor);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                side: const BorderSide(color: Colors.orange, width: 1),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              )),
          SizedBox(
            height: 35,
          ),
          Center(
              child: SizedBox(
            width: bannerAdd!.size.width.toDouble(),
            height: bannerAdd!.size.height.toDouble(),
            child: AdWidget(ad: bannerAdd!),
          ))
        ],
      ),
      context: context,
    );
  }
}
