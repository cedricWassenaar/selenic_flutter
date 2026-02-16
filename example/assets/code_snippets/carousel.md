import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int selectedDot = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Default SelenicCarousel.
        SizedBox(
          height: 110,
          child: OverflowBox(
            maxWidth: MediaQuery.of(context).size.width,
            child: SelenicCarousel(
              itemCount: 10,
              itemExtent: 110,
              itemBuilder: (BuildContext context, int itemIndex, int _) => Container(
                decoration: ShapeDecoration(
                  color: context.selenicColors!.goku,
                  shape: SelenicSquircleBorder(
                    borderRadius: BorderRadius.circular(12).squircleBorderRadius(context),
                  ),
                ),
                child: Center(
                  child: Text("${itemIndex + 1}"),
                ),
              ),
            ),
          ),
        ),

        // Full width SelenicCarousel with SelenicDotIndicator.
        Column(
          children: [
            SizedBox(
              height: 180,
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: SelenicCarousel(
                  gap: 32,
                  itemCount: 5,
                  itemExtent: MediaQuery.of(context).size.width - 32,
                  physics: const PageScrollPhysics(),
                  onIndexChanged: (int index) => setState(() => selectedDot = index),
                  itemBuilder: (BuildContext context, int itemIndex, int _) => Container(
                    decoration: ShapeDecoration(
                      color: context.selenicColors!.goku,
                      shape: SelenicSquircleBorder(
                        borderRadius: BorderRadius.circular(12).squircleBorderRadius(context),
                      ),
                    ),
                    child: Center(
                      child: Text("${itemIndex + 1}"),
                    ),
                  ),
                ),
              ),
            ),
            SelenicDotIndicator(
              selectedDot: selectedDot,
              dotCount: 5,
            ),
          ],
        ),
      ],
    );
  }
}
