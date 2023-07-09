import 'package:admin/main.dart';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class pendingdetails extends StatefulWidget {
  String firstName;
  String LastName;
  String imageurl;
  String language;
  String teacherid;
  String address;
  String fph;
  String about;
  String category;
  String request;
  String requestid;
  String addserviceid;
  String videoUrl;
  String username;
  // String userimageurl;
  // String useraddress;
  String userid;
  String paymentproof;
  pendingdetails(
      {super.key,
      required this.firstName,
      required this.LastName,
      required this.imageurl,
      required this.language,
      required this.teacherid,
      required this.address,
      required this.fph,
      required this.about,
      required this.category,
      required this.request,
      required this.requestid,
      required this.addserviceid,
      required this.username,
      // required this.userimageurl,
      // required this.useraddress,
      required this.userid,
      required this.videoUrl,
      required this.paymentproof});

  @override
  State<pendingdetails> createState() => _pendingdetailsState();
}

class _pendingdetailsState extends State<pendingdetails> {
  final notificationid = Uuid().v1().toString();
  //final usernotificationid = uuid.v1().toString();
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  late Future<void> _initializeVideoPlayerFuture;
  List<String> videourl1 = [];

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
    );
  }

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
          "Request Details",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: Color(0xff000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _controller.initialize(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
                title: Text(
                  widget.firstName,
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    fontFamily: 'Segoe UI',
                  ),
                ),
                subtitle: Text(
                  widget.about,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    fontFamily: 'Segoe UI',
                  ),
                ),
                trailing: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(widget.imageurl),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              padding: EdgeInsets.only(
                left: 10,
              ),
              color: Color(0xffC4C4C4).withOpacity(0.30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "User Information",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 80,
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Color(0xff044188).withOpacity(0.15),
                      ),
                      child: Center(
                        child: Text(
                          "REQUESTED",
                          style: TextStyle(
                            color: Color(0xff044188),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            fontFamily: 'Segoe UI',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 18, right: 10, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      widget.address,
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontFamily: 'Segoe UI',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xffE1E1E1),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 18, right: 10, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Language",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      widget.language,
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontFamily: 'Segoe UI',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xffE1E1E1),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 18, right: 10, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subject",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      widget.category,
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontFamily: 'Segoe UI',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xffE1E1E1),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 18, right: 10, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      widget.fph + "hr",
                      style: TextStyle(
                        color: Color(0xff3F48CC),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontFamily: 'Segoe UI',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              padding: EdgeInsets.only(left: 10, top: 9),
              color: Color(0xffC4C4C4).withOpacity(0.30),
              child: Text(
                "Description",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontFamily: 'Segoe UI',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ExpandableText(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry dummyIpsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry dummy.Ipsum is simply dummy text of the printing and typesetting industry...see more',
                expandText: 'See more',
                collapseText: 'See less',
                maxLines: 2,
                linkColor: Color(0xff555555),
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              padding: EdgeInsets.only(left: 10, top: 9),
              color: Color(0xffC4C4C4).withOpacity(0.30),
              child: Text(
                "Payment Proof",
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
              height: 31,
            ),
            Container(
              width: 260,
              height: 160,
              child: widget.paymentproof == ''
                  ? Image.asset("assets/propic.png")
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.paymentproof),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection('request')
                          .doc(widget.requestid)
                          .update({
                            "request": 'reject',
                            // 'message':
                            //     'your rejected because your payment not receive'
                          })
                          .then((value) => {
                                FirebaseFirestore.instance
                                    .collection("notifications")
                                    .doc(notificationid)
                                    .set({
                                  'username': widget.username,
                                  'teacherid': widget.teacherid,
                                  'userid': widget.userid,
                                  'subject': 'Request Reject',
                                  'notificationid': notificationid,
                                  'notifications': 'true',
                                }),
                                displayMessage("Requeust reject"),
                              })
                          .onError((error, stackTrace) =>
                              {displayMessage(error.toString())});
                    },
                    child: Container(
                      width: 156,
                      height: 43,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffFF0016)),
                      child: Center(
                          child: Text(
                        "Reject",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontFamily: 'Aref Ruqaa',
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection('request')
                          .doc(widget.requestid)
                          .update({
                            "request": 'approved',
                            // 'message':
                            //     'your  payment is  receive please watch the video thanks'
                          })
                          .then((value) => {
                                FirebaseFirestore.instance
                                    .collection("notifications")
                                    .doc(notificationid)
                                    .set({
                                  'username': widget.firstName,
                                  'teacherid': widget.teacherid,
                                  'userid': widget.userid,
                                  'subject': 'Request Approvel',
                                  'notificationid': notificationid,
                                  'notifications': 'true',
                                }),
                                displayMessage("Requeust approved"),
                              })
                          .onError((error, stackTrace) =>
                              {displayMessage(error.toString())});
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 156,
                      height: 43,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xff2CC84A)),
                      child: Center(
                          child: Text(
                        "Approve",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontFamily: 'Aref Ruqaa',
                        ),
                      )),
                    ),
                  ),
                ],
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
