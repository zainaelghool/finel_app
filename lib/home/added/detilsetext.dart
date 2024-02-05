import 'package:app_fin/pages/login_page/butten.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_fin/sql/database_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class add_data extends StatefulWidget {
  const add_data({super.key});

  @override
  _add_dataState createState() => _add_dataState();
}

class _add_dataState extends State<add_data> {
  List<File> selectedImages = [];

  final TextEditingController moreImagesUrlController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phonelController = TextEditingController();
  final TextEditingController isFavoriteController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController bedroomController = TextEditingController();
  final TextEditingController bathroomController = TextEditingController();
  final TextEditingController garagesController = TextEditingController();
  final TextEditingController livingroomController = TextEditingController();
  final TextEditingController kitchenController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController sqfeetController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController regionIdController = TextEditingController();
  bool isvisebl = false;
  DatabaseHelper sqlDb = DatabaseHelper.instance;

  String get morimge => moreImagesUrlController.text;
  set morimge(String value) => moreImagesUrlController.text = value;
  String get address => addressController.text;
  set address(String value) => addressController.text = value;
  String get phone => phonelController.text;
  set phone(String value) => phonelController.text = value;
  double? get price => double.tryParse(priceController.text);
  set price(double? value) => priceController.text = value?.toString() ?? '';

  int? get bed => int.tryParse(bedroomController.text);
  set bed(int? value) => bedroomController.text = value?.toString() ?? '';
  int? get bath => int.tryParse(bathroomController.text);
  set bath(int? value) => bathroomController.text = value?.toString() ?? '';
  int? get garag => int.tryParse(garagesController.text);
  set garag(int? value) => garagesController.text = value?.toString() ?? '';
  int? get liv => int.tryParse(livingroomController.text);
  set liv(int? value) => livingroomController.text = value?.toString() ?? '';
  int? get kit => int.tryParse(kitchenController.text);
  set kit(int? value) => kitchenController.text = value?.toString() ?? '';
  String get des => descriptionController.text;
  set des(String value) => descriptionController.text = value;
  double? get sq => double.tryParse(sqfeetController.text);
  set sq(double? value) => sqfeetController.text = value?.toString() ?? '';
  String get time => timeController.text;
  set time(String value) => timeController.text = value;

  int? get reg => int.tryParse(regionIdController.text);
  set reg(int? value) => regionIdController.text = value?.toString() ?? '';

  final formkey = GlobalKey<FormState>();
  dynamic userType;

  Future<void> _openImagePicker() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    setState(() {
      selectedImages =
          pickedImages.map((pickedImage) => File(pickedImage.path)).toList();
    });
  }

  void add_data() async {
    print('تم حفظ البيانات');
    Map<String, dynamic> proporty = {
      'morImagesUrl': morimge,
      'price': price,
      'address': address,
      'Phone': phone,
      'bedroom': bed,
      'bathroom': bath,
      'garages': garag,
      'livingroom': liv,
      'kitchen': kit,
      'description': des,
      'sqfeet': sq,
    };

    int insertedpropurty = await sqlDb.insertProperty(proporty);

    List<Map<String, dynamic>> proporis = await sqlDb.getProperties();
    print(proporis);
    // اكمل هنا بما تريد فعله بعد تطابق كلمة المرور وتأكيدها
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        //title: const Text('ADD Data'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: selectedImages.isEmpty
                      ? const Icon(Icons.photo, size: 100)
                      : ListView.builder(
                          itemCount: selectedImages.length,
                          itemBuilder: (context, index) {
                            return Image.file(
                              selectedImages[index],
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _openImagePicker,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 0, 0, 86),
                    ), // لون الزر
                  ),
                  child: const Text(
                    'Select Images',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
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
                                controller: priceController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.price_check),
                                  border: InputBorder.none,
                                  hintText: 'Price',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 145, 145, 144),
                                    fontSize: 20,
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
                                controller: addressController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.location_city),
                                  border: InputBorder.none,
                                  hintText: 'address',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 145, 145, 144),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
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
                                controller: phonelController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.phone),
                                  border: InputBorder.none,
                                  hintText: 'phone',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 145, 145, 144),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
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
                                controller: bedroomController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.bed),
                                  border: InputBorder.none,
                                  hintText: 'Bedrooms',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 145, 145, 144),
                                    fontSize: 20,
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
                                controller: bathroomController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.bathroom),
                                  border: InputBorder.none,
                                  hintText: 'Bathrooms',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 145, 145, 144),
                                    fontSize: 20,
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
                                controller: garagesController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.garage),
                                  border: InputBorder.none,
                                  hintText: 'Garages',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 145, 145, 144),
                                    fontSize: 20,
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
                                controller: livingroomController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.living),
                                  border: InputBorder.none,
                                  hintText: 'Living Rooms',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 145, 145, 144),
                                    fontSize: 20,
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
                                controller: kitchenController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.kitchen),
                                  border: InputBorder.none,
                                  hintText: 'Kitchens',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 145, 145, 144),
                                    fontSize: 20,
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
                                controller: sqfeetController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.area_chart),
                                  border: InputBorder.none,
                                  hintText: 'Sq. Feet',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 145, 145, 144),
                                    fontSize: 20,
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
                              margin: const EdgeInsets.symmetric(vertical: 90),
                              decoration: const BoxDecoration(),
                              child: TextFormField(
                                controller: descriptionController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your description';
                                  }
                                  return null;
                                },
                                maxLines: null, // للسماح بكتابة أكثر من سطر
                                textInputAction: TextInputAction
                                    .newline, // لإنشاء سطر جديد عند الضغط على Enter
                                obscureText: false,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.text_decrease_outlined),
                                  border: InputBorder.none,
                                  hintText: 'Description',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 145, 145, 144),
                                    fontSize: 20,
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
                      boutton(
                          onTap: () {
                            //login();
                            if (formkey.currentState!.validate()) {}
                            add_data();
                          },
                          text: "Save"),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
