import 'package:admin/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  void _UploadDataToFirebase() async {
    try {
      final adminid = FirebaseAuth.instance.currentUser!.uid;
      // final User? user = _auth.currentUser;
      // final useruid = user!.uid;
      final categorysid = Uuid().v1();
      FirebaseFirestore.instance.collection('category').doc(categorysid).set({
        "categoryname": _addcategory.text.trim(),
        "categorysid": categorysid,
        'adminid': adminid,
      }).then((value) => {
            displayMessage(
              "Category add",
            ),
            Navigator.pop(context),
          });
      // Navigator.canPop(context) ? Navigator.pop(context) : null;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  final formkey = GlobalKey<FormState>();
  final TextEditingController _addcategory = TextEditingController();
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
          "Categories",
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
              Icons.edit,
              color: Color(0xff3F48CC),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('category')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading...');
                    }
                    if (snapshot.hasError) {
                      return const Text('Error fetching data');
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Container(
                          height: MediaQuery.of(context).size.height,
                          child: Center(child: const Text('Data not found')));
                    }
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          final dynamic categoryname = document['categoryname'];

                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  categoryname,
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    fontSize: 15,
                                    fontFamily: 'Segoe UI',
                                  ),
                                ),
                              ),
                              Divider(
                                color: Color(0xff555555),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff3F48CC),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(
                  child: Text(
                    'Add New',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto",
                      color: Color(0xff3F48CC),
                    ),
                  ),
                ),
                content: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _addcategory,
                    decoration: InputDecoration(
                      hintText: 'Enter category name',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    // Add additional validation and input handling as needed
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 153,
                        height: 41,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xff3F48CC),
                        ),
                        child: Center(
                            child: InkWell(
                          onTap: () {
                            _UploadDataToFirebase();
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Aref Ruqaa",
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        )),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
