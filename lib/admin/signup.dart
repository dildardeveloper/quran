import 'package:admin/admin/verification.dart';
import 'package:admin/appconstaint.dart';
import 'package:admin/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  var abscure = true;
  @override
  void dispose() {
    super.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpassword.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xffFFFFFF),
        toolbarHeight: 30,
        iconTheme: IconThemeData(
          color: Color(0xff000000), // set your arrow color here
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Signup",
                  style: toptextstyle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Image(image: AssetImage("assets/applogo1.png")),
              SizedBox(
                height: 15,
              ),
              Text(
                "Let’s Get It Started!",
                style: wellcstatextstyle,
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 8,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _firstnameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xff909090),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    hintText: "First Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                // // height: MediaQuery.of(context).size.height * 0.08,
                // width: MediaQuery.of(context).size.width * 0.80,
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 8,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _lastnameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xff909090),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    hintText: "Last Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 8,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xff909090),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 8,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: abscure,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            abscure = !abscure;
                          });
                        },
                        child: Icon(
                            abscure
                                ? Icons.visibility_off
                                : Icons.remove_red_eye_outlined,
                            color: appcolor)),
                    hintStyle: TextStyle(
                      color: Color(0xff909090),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 8,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _confirmpassword,
                  obscureText: false,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            abscure = !abscure;
                          });
                        },
                        child: Icon(
                            abscure
                                ? Icons.visibility_off
                                : Icons.remove_red_eye_outlined,
                            color: appcolor)),
                    hintStyle: TextStyle(
                      color: Color(0xff909090),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  if (_firstnameController.text.isEmpty) {
                    displayMessage(" Enter Your First Name");
                  } else if (_lastnameController.text.isEmpty) {
                    displayMessage(" Enter Your Last Name");
                  } else if (_emailController.text.isEmpty) {
                    displayMessage(" Enter Your Email");
                  } else if (_passwordController.text.isEmpty) {
                    displayMessage(" Enter Your password");
                  } else if (_confirmpassword.text.isEmpty) {
                    displayMessage(" Enter Your confirm password");
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => verification(
                                firstname: _firstnameController.text,
                                lastname: _lastnameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                confirmpassword: _confirmpassword.text,
                              )),
                    );
                  }
                },
                child: Container(
                  height: 47,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25), color: appcolor),
                  child: Center(
                    child: Text(
                      "Signup",
                      style: buttiontextstyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account |',
                      style: buttomgrytextstyle,
                    ),
                    TextSpan(
                      text: ' Login',
                      style: buttomorangetextstyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signup()),
                              )
                            },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
