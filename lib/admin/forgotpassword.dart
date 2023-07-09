import 'package:admin/appconstaint.dart';
import 'package:flutter/material.dart';

class forgotpassword extends StatelessWidget {
  const forgotpassword({super.key});

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
        automaticallyImplyLeading: false,
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
                  "Forgot Password",
                  style: toptextstyle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your email to recover your password ",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
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
                height: 130,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), color: appcolor),
                child: Center(
                  child: Text(
                    "Send",
                    style: buttiontextstyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
