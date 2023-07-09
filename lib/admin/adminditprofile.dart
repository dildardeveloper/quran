import 'package:admin/appconstaint.dart';
import 'package:flutter/material.dart';

class adminditprofile extends StatelessWidget {
  const adminditprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
        iconTheme: IconThemeData(
          color: Color(0xff000000), // set your arrow color here
        ),
        elevation: 0,
        title: Text(
          "Edit Profile",
          style: appbarcentertextstyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Text(
              "Edit",
              style: TextStyle(
                color: Color(0xff3F48CC),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                fontSize: 12,
                fontFamily: 'Segoe UI',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // border: Border.all(
                    //   color: Colors.grey,
                    //   width: 1,
                    // ),
                    // color: Colors.grey.withOpacity(0.20),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage("assets/dp.jpg"),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 60,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            color: appcolor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                              ),
                              // border: Border.all(
                              //   color: Colors.grey,
                              //   width: 1,
                              // ),
                            ],
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xffF9EDED),
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 38,
              ),
              Text(
                "First Name",
                style: TextStyle(
                  color: Color(0xff5F5E5E),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  fontFamily: 'Segoe UI',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 337,
                height: 47,
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Color(0xffD6D6D6).withOpacity(0.35),
                    filled: true,
                    hintText: "Masaryk",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone (Optional)";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Last Name",
                style: TextStyle(
                  color: Color(0xff5F5E5E),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  fontFamily: 'Segoe UI',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 337,
                height: 47,
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Color(0xffD6D6D6).withOpacity(0.35),
                    filled: true,
                    hintText: "Jeson)",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Jeson";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Email",
                style: TextStyle(
                  color: Color(0xff5F5E5E),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  fontFamily: 'Segoe UI',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 337,
                height: 47,
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Color(0xffD6D6D6).withOpacity(0.35),
                    filled: true,
                    hintText: "abc123@gmail.com",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "abc123@gmail.com";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Gender",
                style: TextStyle(
                  color: Color(0xff5F5E5E),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  fontFamily: 'Segoe UI',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 337,
                height: 47,
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Color(0xffD6D6D6).withOpacity(0.35),
                    filled: true,
                    hintText: "Male",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Male";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.075,
                      width: 155,
                      // height: 47,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Date of birth",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                fontSize: 12,
                                fontFamily: 'Segoe UI',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            obscureText: false,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                              fillColor: Color(0xffD6D6D6).withOpacity(0.35),
                              filled: true,
                              hintText: "Jan 16, 2002",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Jan 16, 2002";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.075,
                    width: 155,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Language",
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              fontFamily: 'Segoe UI',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                            fillColor: Color(0xffD6D6D6).withOpacity(0.35),
                            filled: true,
                            hintText: "Arabic",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Arabic";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Address",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  fontFamily: 'Segoe UI',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 337,
                height: 47,
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Color(0xffD6D6D6).withOpacity(0.35),
                    filled: true,
                    hintText: "Street number 02, city, New York",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Street number 02, city, New York";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "About",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  fontFamily: 'Segoe UI',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                obscureText: false,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  fillColor: Color(0xffD6D6D6).withOpacity(0.35),
                  filled: true,
                  hintText: "Hey, I am jhone doe, about text will show here",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Hey, I am jhone doe, about text will show here";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => adminditprofile()),
                  );
                },
                child: Container(
                  width: 337,
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25), color: appcolor),
                  child: Center(
                    child: Text(
                      "Update",
                      style: buttiontextstyle,
                    ),
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
