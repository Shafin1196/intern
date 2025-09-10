import 'package:flutter/material.dart';
import 'package:intern/homeWidgets/bannerCard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlidingBanner extends StatefulWidget {
  @override
  _SlidingBannerState createState() => _SlidingBannerState();
}

class _SlidingBannerState extends State<SlidingBanner> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.green.shade700,
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width - 50,
            child: PageView(
              controller: _controller,
              children: const [
                BannerCard(
                  text: "Fast. Reliable. Hassle-Free Parcel Delivery.",
                  subtext: "Your trusted partner for fast &  safe,  deliveries. Send or receive with ease. Start shipping today!",
                  image: "assets/images/man.png",
                ),
                BannerCard(
                  text: "Fast. Reliable. Hassle-Free Parcel Delivery.",
                  subtext: "Your trusted partner for fast &  safe,  deliveries. Send or receive with ease. Start shipping today!",
                  image: "assets/images/man.png",
                ),
                BannerCard(
                  text: "Fast. Reliable. Hassle-Free Parcel Delivery.",
                  subtext: "Your trusted partner for fast &  safe,  deliveries. Send or receive with ease. Start shipping today!",
                  image: "assets/images/man.png",
                ),
                BannerCard(
                  text: "Fast. Reliable. Hassle-Free Parcel Delivery.",
                  subtext: "Your trusted partner for fast &  safe,  deliveries. Send or receive with ease. Start shipping today!",
                  image: "assets/images/man.png",
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.white,
              dotColor: Colors.white54,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 3,
              spacing: 4,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}