import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<String> carouselList;

  const CarouselSliderWidget(
    this.carouselList, {
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CarouselSliderAboutState createState() => _CarouselSliderAboutState();
}

class _CarouselSliderAboutState extends State<CarouselSliderWidget> {
  int _current = 0;
  List<Widget>? imageSlider;

  @override
  void initState() {
    imageSlider = widget.carouselList
        .map((e) => AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(e), fit: BoxFit.fill)),
              ),
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
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    })),
            Positioned(
              bottom: 20,
              left: 10,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Popular Meetup In India',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.carouselList.map((e) {
            int index = widget.carouselList.indexOf(e);
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.black : Colors.grey,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
