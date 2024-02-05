import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';

class CarouselImges extends StatefulWidget {
  //const CarouselImges({super.key});
  final List<String> imgelist;
  const CarouselImges(this.imgelist, {super.key});
  @override
  State<CarouselImges> createState() => _CarouselImgesState();
}

class _CarouselImgesState extends State<CarouselImges> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.35,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.imgelist.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                widget.imgelist[index],
                fit: BoxFit.cover,
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              //color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imgelist.length,
                  (index) => Container(
                    width: 5,
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? const Color.fromARGB(255, 10, 10, 10)
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
