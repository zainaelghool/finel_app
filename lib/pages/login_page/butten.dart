import 'package:flutter/material.dart';

class boutton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  const boutton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 253),
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
