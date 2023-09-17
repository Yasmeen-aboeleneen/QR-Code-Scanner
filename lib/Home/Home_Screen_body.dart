import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_scanner/AddManger.dart';
import 'package:qr_scanner/PDF/PDFScreen.dart';
import 'package:qr_scanner/QRScreens/Create_QRcode.dart';
import 'package:qr_scanner/QRScreens/Scan_QRcode.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  BannerAd? bannerAd;

  bool isLoaded = false;

  void load() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AddManger.BannerHome,
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
      bannerAd!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'Assets/Images/picc.jpg',
                  width: 240,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Column(children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => QRGeneratorSharePage()));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(250, 50),
                  backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                  side: const BorderSide(color: Colors.orange, width: 1),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  textStyle: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold)),
              child: const Text('Generate QR Code'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => ScanScreen()));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(250, 50),
                  backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                  side: const BorderSide(color: Colors.orange, width: 1),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  textStyle: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
              child: const Text('Scan Barcode'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => PDFScrenn()));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(250, 50),
                  backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                  side: const BorderSide(color: Colors.orange, width: 1),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  textStyle: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
              child: const Text('Convert To PDF'),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
                child: SizedBox(
              width: bannerAd!.size.width.toDouble(),
              height: bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: bannerAd!),
            ))
          ]),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          )
        ]),
      ),
    );
  }
}
