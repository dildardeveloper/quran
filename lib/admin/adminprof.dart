import 'package:admin/admin/adminditprofile.dart';
import 'package:admin/admin/adminsetting.dart';
import 'package:flutter/material.dart';

class adminprof extends StatelessWidget {
  const adminprof({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.amber,
                child: Stack(
                  children: [
                    Image.asset("assets/Ellipse.png"),
                    Positioned(
                        top: 30,
                        left: 167,
                        right: 0,
                        bottom: 0,
                        child: Text(
                          "Profile",
                        )),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.withOpacity(0.15)
                    // border: Border.all(
                    //   color: Colors.grey,
                    //   width: 1,
                    // ),
                    ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/dp.jpg"),
                ),
              ),
              Text(
                "Ahmad Duggan",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "abc123@gmail.com",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 11,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 36,
                padding: EdgeInsets.only(left: 20, top: 9),
                color: Color(0xffC4C4C4).withOpacity(0.30),
                child: Text(
                  "Preferences",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    fontFamily: 'Segoe UI',
                  ),
                ),
              ),

              ListTile(
                minLeadingWidth: 0,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => adminditprofile()),
                  );
                },
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey.withOpacity(0.20),
                  ),
                  child: Image.asset("assets/editpro.png"),
                ),
                title: Text(
                  "Edit Profile",
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
                    MaterialPageRoute(builder: (context) => adminsetting()),
                  );
                },
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey.withOpacity(0.20),
                  ),
                  child: Icon(
                    Icons.settings,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  "Setting",
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
              // ListTile(
              //   minLeadingWidth: 0,
              //   leading: Container(
              //     width: 30,
              //     height: 30,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(6),
              //       color: Colors.grey.withOpacity(0.20),
              //     ),
              //     child: Icon(
              //       Icons.logout_outlined,
              //       size: 25,
              //       color: Colors.black,
              //     ),
              //   ),
              //   title: Text(
              //     "Logout",
              //     style: TextStyle(
              //       color: Color(0xff000000),
              //       fontWeight: FontWeight.w600,
              //       decoration: TextDecoration.none,
              //       fontSize: 14,
              //       fontFamily: 'Segoe UI',
              //     ),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_sharp,
              //     color: Colors.black,
              //     size: 20,
              //   ),
              // ),

              ListTile(
                minLeadingWidth: 0,
                onTap: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (ctx) => AlertDialog(
                  //     title: Align(
                  //       alignment: Alignment.topRight,
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           Navigator.pop(context);
                  //         },
                  //         child: Container(
                  //             height: 40,
                  //             width: 40,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(25),
                  //               color: Colors.grey.withOpacity(0.4),
                  //             ),
                  //             child: Image.asset("assets/cross.png")),
                  //       ),
                  //     ),
                  //     content: Container(
                  //       height: 280,
                  //       width: 300,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Container(
                  //             height: 55,
                  //             width: 55,
                  //             decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               color: Colors.grey.withOpacity(0.40),
                  //             ),
                  //             child: Image.asset(
                  //               'assets/logout.png',
                  //               height: 80,
                  //               width: 90,
                  //             ),
                  //           ),
                  //           SizedBox(height: 30),
                  //           Text(
                  //             'Are you sure you want to logout?',
                  //             maxLines: 1,
                  //             style:
                  //                 TextStyle(fontSize: 15, color: Colors.grey),
                  //           ),
                  //           SizedBox(height: 30),
                  //           Container(
                  //             width: 184,
                  //             height: 41,
                  //             child: ElevatedButton(
                  //               onPressed: () {
                  //                 // Perform logout action here
                  //               },
                  //               child: Text(
                  //                 'Logout now',
                  //                 style: TextStyle(
                  //                   color: Color(0xffFFFFFF),
                  //                   fontWeight: FontWeight.w400,
                  //                   decoration: TextDecoration.none,
                  //                   fontSize: 17,
                  //                   fontFamily: 'Aref Ruqaa',
                  //                 ),
                  //               ),
                  //               style: ElevatedButton.styleFrom(
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(25),
                  //                   ),
                  //                   minimumSize: Size(220, 40),
                  //                   backgroundColor: Color(
                  //                       0xff3F48CC) // set minimum height and width
                  //                   ),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // );
                },
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffC4C4C4).withOpacity(0.5),
                  ),
                  child: Icon(
                    Icons.logout,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                title: Text(
                  "Logout",
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
      ),
    );
  }
}
