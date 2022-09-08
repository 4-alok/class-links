import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsContainer extends StatefulWidget {
  const AdsContainer({Key? key}) : super(key: key);

  @override
  State<AdsContainer> createState() => _AdsContainerState();
}

class _AdsContainerState extends State<AdsContainer> {
  final bannerAds = BannerAd(
    adUnitId: "ca-app-pub-8048098293913755/6953897644",
    // adUnitId: "ca-app-pub-3940256099942544/6300978111",
    size: AdSize.banner,
    request: const AdRequest(
      keywords: [
        'Bhubaneswar',
        'btech',
        'univeresity',
        'college',
        'computer science'
      ],
    ),
    listener: const BannerAdListener(),
  );

  @override
  void initState() {
    bannerAds.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: 60,
        color: Colors.transparent,
        child: AdWidget(ad: bannerAds),
      );
}
