import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constant.dart';
import '../widgets/main_fields.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _obscureText = true;

  TextEditingController userid = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    double top = MediaQuery.of(context).padding.top;
    double bottom = MediaQuery.of(context).padding.bottom;


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
                  Stack(
                    children: [
                      Container(
                        height: height * .61,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/net.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: top * 3,
                        left: 20,
                        child: Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Positioned(
                        top: top * 5,
                        left: 20,
                        child: Text(
                          'Contact us easy\nwith no Limits call',
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Color.fromRGBO(179, 179, 179, 1),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: top * 14, left: 15, right: 15),
                    child: TextFieldOne(
                      hinttext: 'Reg No',
                      controller: userid,
                      onchange: (value) {},
                      obsecuretxt: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: top * 17, left: 15, right: 15),
                    child: TextFieldOne(
                      hinttext: 'Password',
                      controller: password,
                      onchange: (value) {},
                      obsecuretxt: _obscureText,
                      sufix: IconButton(
                        icon: Icon(
                          _obscureText? Icons.visibility : Icons.visibility_off,color: Colors.grey,
                        ),
                        onPressed: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: top * 22, left: 15, right: 15),
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(button),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: top * 25,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.6),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Text(
                          'Don’t have an account ? ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Signup',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.6),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
