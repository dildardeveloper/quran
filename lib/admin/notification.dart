import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          iconSize: 15,
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
        elevation: 1,
        title: Text(
          "Notifications",
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("notification")
                      // .orderBy('notificationid', descending: true)
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.active) {
                      if (snapshot.data?.docs.isNotEmpty == true) {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(10.0),
                              itemCount: snapshot.data?.docs.length,
                              itemBuilder: (BuildContext contex, int index) {
                                final subject =
                                    snapshot.data?.docs[index]['subject'];
                                final message =
                                    snapshot.data?.docs[index]['message'];
                                final notificationid =
                                    snapshot.data?.docs[index]['notiicationid'];
                                // final notifications =
                                //     snapshot.data?.docs[index]['notifications'];
                                final username =
                                    snapshot.data?.docs[index]['username'];
                                if (subject == 'Request Approvel') {
                                  return Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: Color(0xffFFFFFF),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 6,
                                              spreadRadius: 8,
                                              color:
                                                  Colors.grey.withOpacity(0.15),
                                            ),
                                          ],
                                        ),
                                        child: ListTile(
                                          onTap: () {
                                            // FirebaseFirestore.instance
                                            //     .collection("notification")
                                            //     .doc(notificationid)
                                            //     .update({
                                            //   "notifications": "false",
                                            // });
                                          },
                                          title: Text(
                                            subject,
                                            style: TextStyle(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none,
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          subtitle: Text(
                                            username,
                                            style: TextStyle(
                                              color: Color(0xff949494),
                                              fontWeight: FontWeight.w400,
                                              decoration: TextDecoration.none,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          trailing: Image.asset(
                                            "assets/openmessage.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          // trailing: notifications == 'true'
                                          //     ? Image.asset(
                                          //         "assets/message.png",
                                          //         width: 30,
                                          //         height: 30,
                                          //       )
                                          //     : Image.asset(
                                          //         "assets/openmessage.png",
                                          //         width: 30,
                                          //         height: 30,
                                          //       ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                }
                                if (subject == 'Help') {
                                  return Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: Color(0xffFFFFFF),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 6,
                                              spreadRadius: 8,
                                              color:
                                                  Colors.grey.withOpacity(0.15),
                                            ),
                                          ],
                                        ),
                                        child: ListTile(
                                          onTap: () {
                                            // FirebaseFirestore.instance
                                            //     .collection("notification")
                                            //     .doc(notificationid)
                                            //     .update({
                                            //   "notifications": "false",
                                            // });
                                          },
                                          title: Text(
                                            subject,
                                            style: TextStyle(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none,
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          subtitle: Text(
                                            username,
                                            style: TextStyle(
                                              color: Color(0xff949494),
                                              fontWeight: FontWeight.w400,
                                              decoration: TextDecoration.none,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          trailing: Image.asset(
                                            "assets/message.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          // trailing: notifications == 'true'
                                          //     ? Image.asset(
                                          //         "assets/message.png",
                                          //         width: 30,
                                          //         height: 30,
                                          //       )
                                          //     : Image.asset(
                                          //         "assets/openmessage.png",
                                          //         width: 30,
                                          //         height: 30,
                                          //       ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                }

                                // if (subject == 'sent help alert.') {
                                //   return Column(
                                //     children: [
                                //       Container(
                                //         width:
                                //             MediaQuery.of(context).size.width,
                                //         decoration: BoxDecoration(
                                //           borderRadius:
                                //               BorderRadius.circular(2),
                                //           color: Color(0xffFFFFFF),
                                //           boxShadow: [
                                //             BoxShadow(
                                //               blurRadius: 6,
                                //               spreadRadius: 8,
                                //               color:
                                //                   Colors.grey.withOpacity(0.15),
                                //             ),
                                //           ],
                                //         ),
                                //         child: ListTile(
                                //           onTap: () {
                                //             // FirebaseFirestore.instance
                                //             //     .collection("notification")
                                //             //     .doc(notificationid)
                                //             //     .update({
                                //             //   "notifications": "false",
                                //             // });
                                //           },
                                //           title: Text(
                                //             subject,
                                //             style: TextStyle(
                                //               color: Color(0xff000000),
                                //               fontWeight: FontWeight.bold,
                                //               decoration: TextDecoration.none,
                                //               fontSize: 15,
                                //               fontFamily: 'Poppins',
                                //             ),
                                //           ),
                                //           subtitle: Text(
                                //             username,
                                //             style: TextStyle(
                                //               color: Color(0xff949494),
                                //               fontWeight: FontWeight.w400,
                                //               decoration: TextDecoration.none,
                                //               fontSize: 12,
                                //               fontFamily: 'Poppins',
                                //             ),
                                //           ),
                                //           trailing: Image.asset(
                                //             "assets/message.png",
                                //             width: 30,
                                //             height: 30,
                                //           ),
                                //           // trailing: notifications == 'true'
                                //           //     ? Image.asset(
                                //           //         "assets/message.png",
                                //           //         width: 30,
                                //           //         height: 30,
                                //           //       )
                                //           //     : Image.asset(
                                //           //         "assets/openmessage.png",
                                //           //         width: 30,
                                //           //         height: 30,
                                //           //       ),
                                //         ),
                                //       ),
                                //       SizedBox(
                                //         height: 20,
                                //       ),
                                //     ],
                                //   );
                                // }
                                // print(snapshot.data?.docs[index]['userImg']);
                              }),
                        );
                      } else {
                        return Container(
                          height: 500,
                          child: Center(
                            child: Text(
                              'Notification not found ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    }
                    return Center(
                      child: Text(
                        'Something went wrong',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
