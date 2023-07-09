import 'package:admin/admin/personaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class help extends StatefulWidget {
  String adminname;
  help({super.key, required this.adminname});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
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
        elevation: 0,
        title: Text(
          "Help",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "Roboto",
            color: Color(0xff000000),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xff000000),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('help').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final helpDocs = snapshot.data!.docs;
                  // You can now use the teacherDocs list to access the data
                  // and display it in your UI
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: helpDocs.length,
                      itemBuilder: (context, index) {
                        final helpData =
                            helpDocs[index].data() as Map<String, dynamic>;
                        // final firstname = helpData['firstname'];
                        // final userimageurl = helpData['userimageurl'];
                        // final userid = helpData['userid'];
                        //final email = helpData['email'];
                        // final helpid = helpData['helpid'];
                        // final phone = helpData['phone'];
                        // final desc = helpData['desc'];

                        ///final dob = teacherData['dob'];
                        // final about = teacherData['about'];

                        return Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => personaldetails(
                                            firstname: helpData['firstname'],
                                            userimageurl:helpData['userimageurl'],
                                            userid: helpData['userid'],
                                            email: helpData['email'],
                                            helpid: helpData['helpid'],
                                            phone: helpData['phone'],
                                            desc: helpData['desc'],
                                            adminname: widget.adminname,
                                          )), 
                                );
                              },
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(helpData['firstname']),
                              ),
                              title: Text(
                                helpData['firstname'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                  color: Color(0xff000000),
                                ),
                              ),
                              subtitle: Text(
                                helpData['phone'],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  color: Color(0xff000000),
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Color(0xff3F48CC),
                              ),
                            ),
                            Divider(
                              color: Color(0xffA5A5A5),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error loading teacher data.');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
