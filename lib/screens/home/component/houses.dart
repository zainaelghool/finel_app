//import 'dart:html';

import 'package:app_fin/model/house.dart';
import 'package:app_fin/screens/dataList/deitalis_screen.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/widgets.dart';

class Houses extends StatefulWidget {
  const Houses({super.key});

  // const Houses({Key key}) : super(key: key);

  @override
  State<Houses> createState() => _HousesState();
}

class _HousesState extends State<Houses> {
  Widget _buildHouses(BuildContext context, int index) {
    //Size size = MediaQuery.of(context).size;
    House house = houseList[index];
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40 / 2),
        child: SizedBox(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (v) => DetailsScreen(
                                  house: house,
                                )));
                      },
                      child: Image(
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                        image: AssetImage(house.imagePath),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: house.isFav
                            ? const Icon(
                                Icons.favorite_rounded,
                                color: Color.fromARGB(255, 255, 7, 7),
                              )
                            : const Icon(
                                Icons.favorite_border_rounded,
                                color: Color.fromARGB(255, 15, 15, 15),
                              ),
                        onPressed: () {
                          setState(() {
                            house.isFav = !house.isFav;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'D.L${house.price.toStringAsFixed(3)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      house.address,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${house.bedroom} bedroms/',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${house.bathroom} bathrooms/',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${house.sqfeet} meter',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: houseList.length,
        itemBuilder: (context, index) {
          return _buildHouses(context, index);
        },
      ),
    );
  }
}
