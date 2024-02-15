import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

class DescreptionCarouselSliderWidget extends StatefulWidget {
  final List<String> carouselList;

  const DescreptionCarouselSliderWidget(
    this.carouselList, {
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CarouselSliderAboutState createState() => _CarouselSliderAboutState();
}

class _CarouselSliderAboutState extends State<DescreptionCarouselSliderWidget> {
  int _current = 0;
  List<Widget>? imageSlider;

  @override
  void initState() {
    imageSlider = widget.carouselList
        .map((e) => AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(e),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ).paddingOnly(bottom: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.save_alt,
                          color: Colors.black,
                        ),
                        const Icon(
                          Icons.bookmark,
                          color: Colors.black,
                        ),
                        const Icon(
                          Icons.heart_broken_sharp,
                          color: Colors.black,
                        ),
                        const Icon(
                          Icons.fullscreen,
                          color: Colors.black,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.black,
                        ),
                        InkWell(
                          onTap: () {
                            shareAssetImage(e);
                          },
                          child: const Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ).paddingOnly(top: 260, left: 8, right: 8),
                  ],
                ),
              ).paddingOnly(left: 5, right: 5),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
                items: imageSlider,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 12 / 9,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    })),
            Positioned(
                bottom: 50,
                left: 30,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.carouselList.map((e) {
                    int index = widget.carouselList.indexOf(e);
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index ? Colors.black : Colors.grey,
                      ),
                    );
                  }).toList(),
                )),
          ],
        ),
      ],
    );
  }

  void shareAssetImage(String assetImagePath) async {
    final bytes = await rootBundle.load(assetImagePath);
    final list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/image.jpg').create();
    file.writeAsBytesSync(list);

    final xFile = XFile(file.path);
    Share.shareXFiles([xFile], text: 'Great picture');
  }
}
