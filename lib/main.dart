import 'package:app_finel_exam/pages/login_page/signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Real Estate',
        debugShowMaterialGrid: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 247, 246, 248)),
          useMaterial3: true,
        ),
        home: const LoginPage() //const add_data()
        //const add_data(), //const AddPropertyScreen(),
        // const homescreen(),
        );
  }
}
