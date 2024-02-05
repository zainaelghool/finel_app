//import 'package:app_fin/pages/login_page/signin.dart';
//import 'package:app_fin/pages/services/auth/login_or_rigist.dart';
import 'package:app_fin/pages/login_page/signin.dart';
import 'package:flutter/material.dart';

class appbar extends StatelessWidget {
  const appbar({super.key});

  //const Appbar({Key key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30 * 2),
      child: SizedBox(
        height: size.height * 0.22,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry>[
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 86),
                          ),
                          title: const Text(
                            'Logout',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 86),
                              fontSize: 20,
                            ),
                          ),
                          onTap: () {
                            // قم بإضافة الكود الذي ترغب في تنفيذه عند الضغط على تسجيل الخروج
                            // مثلاً يمكنك استدعاء وظيفة logout() لتسجيل الخروج
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                            //Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ];
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 86),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.sort_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 86),
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 86),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.insights_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'City',
                  style: TextStyle(
                    color: Color.fromARGB(100, 0, 0, 86),
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Text(
                  'Tripoli',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 237, 238, 247),
            ),
          ],
        ),
      ),
    );
  }
}
