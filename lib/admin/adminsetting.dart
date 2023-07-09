import 'package:admin/admin/TermConditions.dart';
import 'package:admin/admin/privacy.dart';
import 'package:flutter/material.dart';

class adminsetting extends StatelessWidget {
  adminsetting({super.key});

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
          "Settings",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => TermConditions()),
                // );
              },
              leading: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withOpacity(0.20),
                ),
                child: Image.asset(
                  "assets/notifi.png",
                ),
              ),
              title: Text(
                "Notifications Settings",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Segoe UI',
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: 15,
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermConditions()),
                );
              },
              leading: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withOpacity(0.20),
                ),
                child: Image.asset("assets/term.png"),
              ),
              title: Text(
                "Terms & Conditions",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Segoe UI',
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: 15,
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => privacy()),
                );
              },
              leading: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withOpacity(0.20),
                ),
                child: SizedBox(
                    child: Image.asset(
                  "assets/privacy.png",
                )),
              ),
              title: Text(
                "Privacy Policy",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Segoe UI',
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
