import 'package:app_fin/pages/login_page/butten.dart';
import 'package:app_fin/pages/login_page/signin.dart';
import 'package:app_fin/sql/database_helper.dart';

import 'package:flutter/material.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({super.key});

  //const RegistPage({super.key, Key? key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isvisebl = false;
  String get username => usernameController.text;

  set username(String value) => usernameController.text = value;

  String get password => passwordController.text;
  set password(String value) => passwordController.text = value;
  final formkey = GlobalKey<FormState>();
  DatabaseHelper sqlDb = DatabaseHelper.instance;
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String get confirmPassword => confirmPasswordController.text;
  set confirmPassword(String value) => confirmPasswordController.text = value;

  void register() async {
    if (password == confirmPassword) {
      print('تم حفظ الايميل و كلمة المرور');
      Map<String, dynamic> user = {
        'name': username,
        'password': password,
        'status': userType,
      };

      int insertedUserId = await sqlDb.insertUser(user);

      List<Map<String, dynamic>> users = await sqlDb.getUsers();
      print(users);
      // اكمل هنا بما تريد فعله بعد تطابق كلمة المرور وتأكيدها
    } else {
      print('تاكد من كلمة المرور');
    }
  }

  dynamic userType = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    'Registor New Account',
                    style: TextStyle(
                      fontSize: 30,
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
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your confirm password';
                              }
                              return null;
                            },
                            obscureText: !isvisebl,
                            decoration: InputDecoration(
                              icon: const Icon(Icons.lock),
                              border: InputBorder.none,
                              hintText: 'confirmPassword',
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
                        if (formkey.currentState!.validate()) {}
                        register();
                      },
                      text: "Sign Up"),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a Number?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 18, 4, 100),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (v) => const LoginPage()));
                        },
                        child: const Text(
                          'SIGN IN',
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
          ]),
        ),
      ),
    );
  }
}
