import 'package:app_fin/home/added/detilsetext.dart';
import 'package:app_fin/pages/login_page/butten.dart';
import 'package:app_fin/pages/login_page/registerpage.dart';

import 'package:app_fin/screens/home/home_screens.dart';
//import '//package:app_fin/screens/dataList/add_data.dart'; // استيراد صفحة add_data
import 'package:app_fin/sql/database_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

//  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isvisebl = false;
  String get username => usernameController.text;
  set username(String value) => usernameController.text = value;

  String get password => passwordController.text;
  set password(String value) => passwordController.text = value;
  final formkey = GlobalKey<FormState>();
  dynamic userType;
  DatabaseHelper sqlDb = DatabaseHelper.instance;

  void signin() async {
    List<Map<String, dynamic>> users = await sqlDb.getUsers();
    bool userExists = users.any(
        (user) => user['name'] == username && user['password'] == password);

    if (userExists) {
      print('تم حفظ الايميل و كلمة المرور');
      Map<String, dynamic> user = {
        'name': username,
        'password': password,
        'status': userType,
      };

      int insertedUserId = await sqlDb.insertUser(user);

      users = await sqlDb.getUsers();
      print(users);

      if (userType == 'customer') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const homescreen()),
        );
      } else if (userType == 'advertiser') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const add_data(),
        ));
      }

      // اكمل هنا بما تريد فعله بعد تطابق كلمة المرور وتأكيدها
    } else {
      print('تاكد من كلمة المرور');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/home_57.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 86),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 0, 0, 86),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(7),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromARGB(255, 98, 97, 97),
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: usernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.person),
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 145, 145, 144),
                                    fontSize: 20,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 0, 0, 86),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 98, 97, 97),
                                ),
                              ),
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              obscureText: !isvisebl,
                              decoration: InputDecoration(
                                icon: const Icon(Icons.lock),
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 145, 145, 144),
                                  fontSize: 20,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isvisebl = !isvisebl;
                                    });
                                  },
                                  icon: Icon(
                                    isvisebl
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: "customer",
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value;
                            });
                          },
                        ),
                        const Text(
                          'Customer',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 86),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Center(
                          child: Radio<String>(
                            value: "advertiser",
                            groupValue: userType,
                            onChanged: (value) {
                              setState(() {
                                userType = value;
                              });
                            },
                          ),
                        ),
                        const Text(
                          'Advertiser',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 86),
                          ),
                        ),
                      ],
                    ),
                    boutton(
                        onTap: () {
                          //login();
                          setState(() {
                            if (formkey.currentState!.validate()) {}
                            signin();
                          });
                        },
                        text: "Sign In"),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don`t have account?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 18, 4, 100),
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (v) => const RegistPage()));
                          },
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: Color.fromARGB(255, 18, 4, 100),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
