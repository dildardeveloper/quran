import 'package:admin/admin/studentdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class students extends StatefulWidget implements PreferredSizeWidget {
  const students({Key? key}) : super(key: key);
  @override
  State<students> createState() => _studentsState();
  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _studentsState extends State<students> {
  TextEditingController _controller = TextEditingController();

  bool _expanded = false;
  String search = "";

  void _toggleExpand() {
    setState(() {
      _expanded = !_expanded;
      if (!_expanded) {
        _controller.clear();
        search = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        title: _expanded
            ? TextField(
                controller: _controller,
                onChanged: (val) {
                  setState(() {
                    search = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  // suffixIcon: IconButton(
                  //   icon: Icon(Icons.clear),
                  //   onPressed: () {
                  //     setState(() {
                  //       _controller.clear();
                  //       search = '';
                  //     });
                  //   },
                  // ),
                ),
              )
            : Text(
                "Students",
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: _toggleExpand,
              child: _expanded
                  ? Icon(
                      Icons.clear,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: (search != "" && search != '')
                  ? FirebaseFirestore.instance
                      .collection('user')
                      .where("firstName", isGreaterThanOrEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance.collection('user').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final teacherDocs = snapshot.data!.docs;
                  if (teacherDocs.isEmpty) {
                    return Center(
                      child: Text('User not found'),
                    );
                  }
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: teacherDocs.length,
                      itemBuilder: (context, index) {
                        final teacherData =
                            teacherDocs[index].data() as Map<String, dynamic>;
                        final firstName = teacherData['firstName'];
                        final LastName = teacherData['LastName'];
                        final imageurl = teacherData['imageurl'];
                        final email = teacherData['email'];
                        final language = teacherData['language'];
                        final dob = teacherData['dob'];
                        final userid = teacherData['userid'];

                        final address = teacherData['address'];
                        final gender = teacherData['gender'];
                        final phone = teacherData['phone'];
                        print(userid);

                        ///final dob = teacherData['dob'];
                        // final about = teacherData['about'];

                        return Column(
                          children: [
                            ListTile(
                              leading: imageurl.isNotEmpty
                                  ? CircleAvatar(
                                      backgroundImage: NetworkImage(imageurl),
                                      radius: 25, // adjust this value as needed
                                    )
                                  : CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/dp.jpg"),
                                      radius: 25,
                                    ),
                              title: firstName == ''
                                  ? Text(
                                      "Jacob Jones",
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                        fontFamily: 'Roboto',
                                      ),
                                    )
                                  : Text(
                                      firstName,
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                              subtitle: phone == ''
                                  ? Text(
                                      "abc123@gmail.com",
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.none,
                                        fontSize: 12,
                                        fontFamily: 'Roboto',
                                      ),
                                    )
                                  : Text(
                                      email,
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.none,
                                        fontSize: 12,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Color(0xff3F48CC),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => studentdetails(
                                            firstName: firstName,
                                            LastName: LastName,
                                            imageurl: imageurl,
                                            address: address,
                                            email: email,
                                            gender: gender,
                                            language: language,
                                            dob: dob,
                                            phone: phone,
                                            userid: userid,
                                          )),
                                );
                              },
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
