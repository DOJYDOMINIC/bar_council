import 'package:bar_council/services/otplogin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/constant.dart';
import '../widgets/main_fields.dart';
import 'dart:io';

import 'login.dart';
import 'otp.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = pickedFile;
      debugPrint(_imageFile.toString());
    });
  }

  bool _obscurepassword = true;
  bool _obscureconfirmpassword = true;
  final useridkey = GlobalKey<FormState>();
  final phonekey  = GlobalKey<FormState>();
  final passwordkey  = GlobalKey<FormState>();
  final confirmpasswordkey  = GlobalKey<FormState>();
  TextEditingController userid = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // double top = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          if (!FocusScope.of(context).hasPrimaryFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height /2.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/net1.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    top:height/3.8,
                    left: width/2.7,
                    child: Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 52,
                            backgroundColor: Colors.grey.shade800,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: _imageFile != null
                                  ? Image.file(File(_imageFile!.path)).image
                                  : const AssetImage('assets/images/man.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: height/9,
                    left: 20,
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    top:height/6,
                    left: 20,
                    child: const Text(
                      logsubtext,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Color.fromRGBO(179, 179, 179, 1),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Positioned(
                      top: height/2.9,
                      left: width/1.9,
                      child: IconButton(onPressed:() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // int total = 0;
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              actions: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                         const Icon(Icons.camera_alt,size: 50,),
                                          SizedBox(
                                            height: 30,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor:
                                                Colors.black, // text color
                                              ),
                                              child: Text('Camera'),
                                              onPressed: () {
                                                _pickImageFromCamera();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                         const Icon(Icons.image,size: 50,),
                                          SizedBox(
                                            height: 30,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor:Colors.black, // text color
                                              ),
                                              child: const Text('Gallery'),
                                              onPressed: () {
                                                _pickImageFromGallery();
                                                // Add your logic if the user confirm
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }, icon: Icon(Icons.add_a_photo,color: Colors.grey.shade300,size: 25,))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Form(
                      key: useridkey,
                      child: TextFieldOne(
                        hinttext: 'Reg No',
                        controller: userid,
                        onchange: (value) {
                          useridkey.currentState!.validate();
                        },
                        obsecuretxt: false,
                      ),
                    ),
                    Form(
                      key:phonekey,
                      child: TextFieldOne(
                        hinttext: 'Phone',
                        keytype: TextInputType.number,
                        controller: phone,
                        onchange: (value) {
                          phonekey.currentState!.validate();
                          phoneNumber =  value;
                        },
                        obsecuretxt: false,
                      ),
                    ),

                    Form(
                      key: passwordkey,
                      child: TextFieldOne(
                        hinttext: 'Password',
                        controller: password,
                        onchange: (value) {
                          passwordkey.currentState!.validate();
                        },
                        obsecuretxt: _obscurepassword,
                        sufix: IconButton(
                          icon: Icon(
                            _obscurepassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurepassword = !_obscurepassword;
                            });
                          },
                        ),
                      ),
                    ),
                    Form(
                      key: confirmpasswordkey,
                      child: TextFieldOne(
                        hinttext: 'Confirmpassword',
                        controller: confirmpassword,
                        onchange: (value) {
                          confirmpasswordkey.currentState!.validate();
                        },
                        obsecuretxt: _obscureconfirmpassword,
                        sufix: IconButton(
                          icon: Icon(
                            _obscureconfirmpassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureconfirmpassword = !_obscureconfirmpassword;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height*.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: height,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(button),
                        ),
                        onPressed: () {
                          if (useridkey.currentState!.validate()||phonekey.currentState!.validate()||passwordkey.currentState!.validate()||confirmpasswordkey.currentState!.validate()) {
                              verifyOtp(phoneNumber!);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Otp(),));

                            debugPrint('new');
                          }
                        },
                        child: const Text(
                          'SignUp',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Alredy have an account ? ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: width * 0.025,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.6),
                              fontSize: width * 0.03,
                            ),
                          ),
                        ),
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
