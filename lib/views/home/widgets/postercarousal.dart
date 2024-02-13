import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nutrihome/helpers/basics.dart';

class PosterCarousal extends StatelessWidget {
  const PosterCarousal({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: posterimages.length,
      options: CarouselOptions(
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlay: true,
        height: size.height * 0.3,
      ),
      itemBuilder: (context, itemindex, pageindex) {
        final posters = posterimages[itemindex];
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(posters),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
