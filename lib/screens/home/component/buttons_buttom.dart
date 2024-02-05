import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Container(
        width: size.width * 0.4,
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 18, 4, 100),
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(244, 71, 71, 72),
              offset: Offset(0, 7),
              blurRadius: 10,
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              //  size: 50,
              color: Color.fromARGB(255, 243, 242, 238),
            ),
            Text(
              'location View',
              style: TextStyle(
                  color: Color.fromARGB(255, 243, 242, 238),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
