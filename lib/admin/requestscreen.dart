import 'package:admin/admin/approvedrequest.dart';
import 'package:admin/admin/pending.dart';
import 'package:admin/admin/rejectedrequest.dart';
import 'package:flutter/material.dart';

class requestscreen extends StatelessWidget {
  const requestscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Requests",
            style: TextStyle(
              color: Color(0xff000000),
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
              fontSize: 20,
              fontFamily: 'Roboto',
            ),
          ),
          titleSpacing: 0,
          backgroundColor: Color(0xffFFFFFF),
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
          elevation: 0,
        ),
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                SizedBox(
                  height: 23,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff3F48CC).withOpacity(0.13)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, bottom: 5, top: 5),
                    child: Container(
                      // width: 103,
                      // height: 30,
                      child: TabBar(
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Color(0xff3F48CC)),
                        automaticIndicatorColorAdjustment: true,
                        labelColor: Colors.white,
                        unselectedLabelColor: Color(0xff3F48CC),
                        tabs: [
                          Tab(
                            child: Text(
                              "Pending",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontFamily: 'Aref Ruqaa',
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Rejected",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontFamily: 'Aref Ruqaa',
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Approved",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontFamily: 'Aref Ruqaa',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(children: [
                  pending(),
                  rejectedrequest(),
                  approvedrequest(),
                ]))
              ],
            )));
  }
}
