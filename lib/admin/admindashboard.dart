import 'package:admin/admin/adminprof.dart';
import 'package:admin/admin/categories.dart';
import 'package:admin/admin/help.dart';
import 'package:admin/admin/notification.dart';
import 'package:admin/admin/requestscreen.dart';
import 'package:admin/admin/students.dart';
import 'package:admin/admin/teachers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class admindashboard extends StatefulWidget {
  admindashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  String imageUrl = '';
  String adminmame = '';

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  Future<void> fetchImage() async {
    // Reference to the document in Firestore that contains the image URL
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('admin')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    try {
      // Get the document data from Firestore
      DocumentSnapshot docSnapshot = await docRef.get();

      // Get the image URL from the document data
      String url = docSnapshot['imageurl'];
      String firstName = docSnapshot['firstName'];

      // Update the state to display the image in your app
      setState(() {
        imageUrl = url;
        adminmame = firstName;
        ;
      });
    } catch (e) {
      // Handle any errors
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xff3F48CC),
        title: Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            fontFamily: "Rufina",
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Image.asset(
            "assets/menu.png",
            width: 20,
            height: 20,
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const notification()),
            // );
          },
        ),
        actions: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('notification')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final teacherDocs = snapshot.data!.docs;
                  // You can now use the teacherDocs list to access the data
                  // and display it in your UI
                  return Container(
                    width: 24,
                    child: ListView.builder(
                      itemCount: teacherDocs.length,
                      itemBuilder: (context, index) {
                        final teacherData =
                            teacherDocs[index].data() as Map<String, dynamic>;
                        final notifications = teacherData['notifications'];
                        // final username = teacherData['username'];
                        // final messae = teacherData['messae'];
                        // final notificationid = teacherData['notificationid'];

                        return GestureDetector(
                          onTap: () {
                            // FirebaseFirestore.instance
                            //     .collection("notification")
                            //     .doc(notificationid)
                            //     .update({
                            //   "notifications": "false",
                            // });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => notification(
                                      // username: username + messae,
                                      )),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Image.asset(
                              "assets/gnotification.png",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          // child: notifications == "true"
                          //     ? Padding(
                          //         padding: const EdgeInsets.only(top: 20),
                          //         child: Image.asset(
                          //           "assets/gnotification.png",
                          //           width: 20,
                          //           height: 20,
                          //         ),
                          //       )
                          // : Padding(
                          //     padding: const EdgeInsets.only(top: 18),
                          //     child: Icon(
                          //       Icons.notifications_rounded,
                          //       size: 25,
                          //       color: Colors.black,
                          //     ),
                          //   ),
                        );
                      },
                    ),
                  );
                }
                return Container();
              }),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const adminprof()),
                );
              },
              child: imageUrl.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      radius: 20, // adjust this value as needed
                    )
                  : Text('No image'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff3F48CC),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const students()),
                          );
                        },
                        child: Container(
                          height: 140,
                          width: 135,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xffFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 4,
                                color: Colors.grey.withOpacity(0.22),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/student.png",
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Students",
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const teachers()),
                          );
                        },
                        child: Container(
                          height: 140,
                          width: 135,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xffFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 4,
                                color: Colors.grey.withOpacity(0.22),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/teacher.png",
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Teachers",
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const requestscreen()),
                          );
                        },
                        child: Container(
                          height: 140,
                          width: 135,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xffFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 8,
                                color: Colors.grey.withOpacity(0.22),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/requestapprove.png",
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Request Approvels",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const categories()),
                          );
                        },
                        child: Container(
                          height: 140,
                          width: 135,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xffFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 8,
                                color: Colors.grey.withOpacity(0.22),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/category.png",
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Categories",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => help(
                                    adminname: adminmame,
                                  )),
                        );
                      },
                      child: Container(
                        height: 140,
                        width: 135,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xffFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              spreadRadius: 8,
                              color: Colors.grey.withOpacity(0.22),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/help1.png",
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Help",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontSize: 18,
                                fontFamily: 'Roboto',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
