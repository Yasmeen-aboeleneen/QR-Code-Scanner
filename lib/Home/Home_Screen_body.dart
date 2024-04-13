import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_scanner/AdsManger.dart';
import 'package:qr_scanner/core/Widgets/Buttons.dart';
import 'package:sizer/sizer.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  BannerAd? bannerAd;
  bool isloaded = false;

  void Load() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AddManger.BannerHome,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isloaded = true;
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
    Load();
    super.initState();
  }

  @override
  void dispose() {
    if (isloaded) {
      bannerAd!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 8.h,
        ),
        Center(
          child: Column(
            children: [
              Image.asset(
                'Assets/Images/picc.jpg',
                width: 80.w,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        ElevatedButton1(),
        SizedBox(
          height: 5.h,
        ),
        ElevatedButton2(),
        SizedBox(
          height: 8.h,
        ),
        Center(
            child: isloaded
                ? SizedBox(
                    width: bannerAd!.size.width.toDouble(),
                    height: bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: bannerAd!),
                  )
                : SizedBox(
                    height: 60,
                  )),
      ]),
    );
  }
}
