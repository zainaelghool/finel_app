import 'package:app_fin/screens/home/component/app_bar.dart';
import 'package:app_fin/screens/home/component/buttons_buttom.dart';
import 'package:app_fin/screens/home/component/categoris.dart';
//import 'package:app_fin/screens/home/component/login_page.dart';
//import 'package:app_finel/screens/home/component/app_bar.dart';
//import 'package:app_finel/screens/home/component/categoris.dart';
//import 'package:app_finel/screens/home/component/houses.dart';
import 'package:flutter/material.dart';

import 'component/Houses.dart';
//import 'component/login_page.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [appbar(), categoris(), Houses()],
          ),
          BottomButtons()
        ],
      ),
    );
  }
}
