import 'package:admin/admin/forgotpassword.dart';
import 'package:admin/admin/signup.dart';
import 'package:admin/appconstaint.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
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
                  "Login",
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
                "Welcome back!",
                style: wellcstatextstyle,
              ),
              SizedBox(
                height: 45,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email";
                    }
                    return null;
                  },
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
                  obscureText: false,
                  decoration: InputDecoration(
                    suffixIcon:
                        Icon(Icons.remove_red_eye_outlined, color: appcolor),
                    hintStyle: TextStyle(
                      color: Color(0xff909090),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => forgotpassword()),
                  );
                },
                child: Container(
                  height: 47,
                  width: 280,
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), color: appcolor),
                child: Center(
                  child: Text(
                    "Login",
                    style: buttiontextstyle,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t have an account  |',
                      style: buttomgrytextstyle,
                    ),
                    TextSpan(
                      text: ' Signup',
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
