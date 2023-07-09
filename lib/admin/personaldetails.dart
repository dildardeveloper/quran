import 'package:admin/admin/help.dart';
import 'package:admin/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class personaldetails extends StatefulWidget {
  String firstname;
  String userimageurl;
  String userid;
  String email;
  String helpid;
  String phone;
  String desc;
  String adminname;
  personaldetails(
      {super.key,
      required this.firstname,
      required this.userimageurl,
      required this.userid,
      required this.email,
      required this.helpid,
      required this.phone,
      required this.desc,
      required this.adminname});

  @override
  State<personaldetails> createState() => _personaldetailsState();
}

class _personaldetailsState extends State<personaldetails> {
  final TextEditingController _replyController = TextEditingController();
  final notificationid = Uuid().v1().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF5F5F5),
        iconTheme: IconThemeData(
          color: Color(0xff000000), // set your arrow color here
        ),
        elevation: 1,
        title: Text(
          "Help",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "Roboto",
            color: Color(0xff000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Person Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.firstname,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.email,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
              trailing: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.userimageurl),
              ),
              contentPadding: EdgeInsets.only(top: 20, left: 20, right: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 5, bottom: 20),
              child: Text(
                widget.desc,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              padding: EdgeInsets.only(left: 20, top: 9),
              color: Color(0xffC4C4C4).withOpacity(0.30),
              child: Text(
                "Reply",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontFamily: 'Segoe UI',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _replyController,
                decoration: InputDecoration(
                  labelText: 'Reply',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Write reply here...",
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          Colors.black, // change the color of the border here
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(
                          0xFF000000), // change the color of the focused border here
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                maxLines: 4,
                // maxLength: 100,
                keyboardType: TextInputType.multiline,
                minLines: 2,
                textInputAction: TextInputAction.newline,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: 202,
              height: 43,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xff3F48CC),
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection('notifications')
                        .doc(notificationid)
                        .set({
                          'adminreply': _replyController.text,
                          'userid': widget.userid,
                          'message': 'sent help alert.',
                          'subject': 'Help',
                          'adminname': widget.adminname,
                          'notifications': 'true',
                          'usernotificationid': notificationid,
                          'username': widget.firstname
                        })
                        .then(
                            (value) => {displayMessage('Help send successful')})
                        .onError((error, stackTrace) => {
                              displayMessage(error.toString()),
                            });
                    _replyController.clear();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
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
