import 'package:flutter/material.dart';

class AppBarCoust extends StatelessWidget {
  const AppBarCoust({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: SizedBox(
        height: size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop(context);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          const Color.fromARGB(255, 8, 8, 8).withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Color.fromARGB(255, 11, 10, 10),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(
                    color:
                        const Color.fromARGB(255, 19, 18, 18).withOpacity(0.4)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.favorite_border_rounded,
                color: Color.fromARGB(255, 4, 3, 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
