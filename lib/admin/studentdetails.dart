import 'package:admin/main.dart';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class studentdetails extends StatefulWidget {
  final firstName;
  final LastName;
  final imageurl;
  final address;
  final email;
  final gender;
  final language;
  final dob;
  final phone;
  final userid;
  studentdetails({
    super.key,
    required this.firstName,
    required this.LastName,
    required this.imageurl,
    required this.address,
    required this.email,
    required this.gender,
    required this.language,
    required this.dob,
    required this.phone,
    required this.userid,
  });

  @override
  State<studentdetails> createState() => _studentdetailsState();
}

class _studentdetailsState extends State<studentdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        title: Text(
          "Students Details",
          style: TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            fontSize: 20,
            fontFamily: 'Roboto',
          ),
        ),
        leading: IconButton(
          icon: Image.asset(
            "assets/pop.png",
            width: 20,
            height: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            widget.imageurl.isNotEmpty
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.imageurl),
                  )
                : CircleAvatar(
                    radius: 50, backgroundImage: AssetImage("assets/dp.jpg")),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "First Name",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                              ),
                            )),
                      ),
                      TextFormField(
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: widget.firstName,
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Last Name",
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          )),
                      TextFormField(
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: widget.LastName,
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                          ),
                          border: InputBorder.none,
                          //contentPadding: EdgeInsets.only(left: 20),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Phone",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  )),
            ),
            TextFormField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                hintText: widget.phone,
                hintStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: 'Open Sans',
                ),
                border: InputBorder.none,
                //contentPadding: EdgeInsets.only(left: 20),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  )),
            ),
            TextFormField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                hintText: widget.email,
                hintStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: 'Open Sans',
                ),
                border: InputBorder.none,
                //contentPadding: EdgeInsets.only(left: 20),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Gender",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                              ),
                            )),
                      ),
                      TextFormField(
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: widget.gender,
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
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
                              fontFamily: 'Poppins',
                            ),
                          )),
                      TextFormField(
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: widget.dob,
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                          ),
                          border: InputBorder.none,
                          //contentPadding: EdgeInsets.only(left: 20),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Language",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  )),
            ),
            TextFormField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                hintText: widget.language,
                hintStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: 'Open Sans',
                ),
                border: InputBorder.none,
                //contentPadding: EdgeInsets.only(left: 20),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Address",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  )),
            ),
            TextFormField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                hintText: widget.address,
                hintStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: 'Open Sans',
                ),
                border: InputBorder.none,
                //contentPadding: EdgeInsets.only(left: 20),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Color(0xffED0000))),
              child: Center(
                child: InkWell(
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection('user')
                        .doc(widget.userid)
                        .update({'status': "blockuser"}).then((value) {
                      displayMessage("Teacher block");
                    }).onError((error, stackTrace) {
                      displayMessage(error.toString());
                    });
                    ;
                  },
                  child: Text(
                    "Block Student",
                    style: TextStyle(
                      color: Color(0xffED0000),
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                      fontSize: 18,
                      fontFamily: 'Aref Ruqaa',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
