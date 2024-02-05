import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});
  void onButtonPressed() async {
    // الرقم الذي سيتم اتصاله
    String phoneNumber = '0945673802';

    // فحص إمكانية فتح تطبيق المكالمات
    if (await canLaunch('tel:$phoneNumber')) {
      // فتح تطبيق المكالمات وتمرير الرقم
      await launch('tel:$phoneNumber');
    } else {
      // لم يتم العثور على تطبيق المكالمات
      print('تعذر فتح تطبيق المكالمات');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: InkWell(
        onTap: () {
          onButtonPressed(); // إجراء عند الضغط على الزر
          // يمكن وضع الكود الذي تريد تنفيذه هنا
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
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
                    Icons.mail_rounded,
                    //  size: 50,
                    color: Color.fromARGB(255, 243, 242, 238),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Text(
                    'Messeges',
                    style: TextStyle(
                        color: Color.fromARGB(255, 243, 242, 238),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
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
                  InkWell(
                    onTap: () {
                      onButtonPressed(); // إجراء عند الضغط على الزر
                      // يمكن وضع الكود الذي تريد تنفيذه هنا
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 243, 242, 238),
                        ),
                        SizedBox(width: 9),
                        Text(
                          'Call',
                          style: TextStyle(
                            color: Color.fromARGB(255, 243, 242, 238),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
