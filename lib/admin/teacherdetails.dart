import 'package:admin/main.dart';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class teacherdetails extends StatefulWidget {
  final firstName;
  final LastName;
  final imageurl;
  final address;
  final teacherid;
  final email;
  final gender;
  final language;
  final dob;
  final phone;
  teacherdetails({
    super.key,
    required this.firstName,
    required this.LastName,
    required this.imageurl,
    required this.address,
    required this.email,
    required this.gender,
    required this.language,
    required this.dob,
    required this.teacherid,
    required this.phone,
  });

  @override
  State<teacherdetails> createState() => _teacherdetailsState();
}

class _teacherdetailsState extends State<teacherdetails> {
  String videoUrl = '';
  String videoUrl1 = '';
  String category = '';
  String dsc = '';
  String fph = '';
  String wn = '';
  String status = '';
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;

  ChewieController? _chewieController1;
  ChewieController? _chewieController2;

  late Future<void> _initializeVideoPlayerFuture;
  fetchservice() async {
    // Reference to the document in Firestore that contains the image URL
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('addservice')
        .doc(widget.teacherid);

    try {
      // Get the document data from Firestore
      DocumentSnapshot docSnapshot = await docRef.get();

      // Get the image URL from the document data
      // String url = docSnapshot['videoUrl1'];

      // Update the state to display the image in your app
      setState(() {
        videoUrl1 = docSnapshot['videoUrl1'];
        videoUrl = docSnapshot['videoUrl'];
        category = docSnapshot['category'];
        dsc = docSnapshot['dsc'];
        fph = docSnapshot['fph'];
        wn = docSnapshot['wn'];
        status = docSnapshot['status'];
        print("asjdhkjsahdjashjdhkasdk" + videoUrl1);
      });
    } catch (e) {
      displayMessage(e.toString());
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchservice();

    _controller1 = VideoPlayerController.network(videoUrl);
    _initializeVideoPlayerFuture = _controller1.initialize();
    _chewieController1 = ChewieController(
        materialProgressColors: ChewieProgressColors(
            handleColor: Colors.yellow,
            playedColor: Color(0xff3F48CC),
            bufferedColor: Colors.black),
        videoPlayerController: _controller1,
        autoPlay: true,
        looping: true,
        allowFullScreen: true);
    _controller2 = VideoPlayerController.network(videoUrl1);
    _initializeVideoPlayerFuture = _controller2.initialize();
    _chewieController2 = ChewieController(
      videoPlayerController: _controller2,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _chewieController1!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller1 = VideoPlayerController.network(videoUrl);
    _chewieController1 = ChewieController(
      videoPlayerController: _controller1,
      autoPlay: true,
      looping: true,
    );
    _controller2 = VideoPlayerController.network(videoUrl1);
    _chewieController2 = ChewieController(
      videoPlayerController: _controller2,
      autoPlay: true,
      looping: true,
    );
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        title: Text(
          "Teachers Details",
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            widget.imageurl.isNotEmpty
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.imageurl),
                  )
                : CircleAvatar(
                    radius: 50, backgroundImage: AssetImage("assets/dp.jpg")),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "First Name",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                              ),
                            )),
                      ),
                      TextFormField(
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: widget.firstName,
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Last Name",
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          )),
                      TextFormField(
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: widget.LastName,
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                          ),
                          border: InputBorder.none,
                          //contentPadding: EdgeInsets.only(left: 20),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Phone",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  )),
            ),
            TextFormField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                hintText: widget.phone,
                hintStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: 'Open Sans',
                ),
                border: InputBorder.none,
                //contentPadding: EdgeInsets.only(left: 20),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  )),
            ),
            TextFormField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                hintText: widget.email,
                hintStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: 'Open Sans',
                ),
                border: InputBorder.none,
                //contentPadding: EdgeInsets.only(left: 20),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Gender",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                              ),
                            )),
                      ),
                      TextFormField(
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: widget.gender,
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Date of birth",
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          )),
                      TextFormField(
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: widget.dob,
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                          ),
                          border: InputBorder.none,
                          //contentPadding: EdgeInsets.only(left: 20),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Language",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  )),
            ),
            TextFormField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                hintText: widget.language,
                hintStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: 'Open Sans',
                ),
                border: InputBorder.none,
                //contentPadding: EdgeInsets.only(left: 20),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Address",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  )),
            ),
            TextFormField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                hintText: widget.address,
                hintStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: 'Open Sans',
                ),
                border: InputBorder.none,
                //contentPadding: EdgeInsets.only(left: 20),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              padding: EdgeInsets.only(left: 10, top: 8),
              color: Color(0xffC4C4C4).withOpacity(0.30),
              child: Text(
                "Service Details",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Subject",
                              style: TextStyle(
                                color: Color(0xff6A6A6A),
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                              ),
                            )),
                      ),
                      TextFormField(
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: category,
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Segoe UI',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Fee per hour",
                            style: TextStyle(
                              color: Color(0xff6A6A6A),
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          )),
                      TextFormField(
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: fph,
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Segoe UI',
                          ),
                          border: InputBorder.none,
                          //contentPadding: EdgeInsets.only(left: 20),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Whatsapp Number",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  )),
            ),
            TextFormField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                hintText: widget.phone,
                hintStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: 'Open Sans',
                ),
                border: InputBorder.none,
                //contentPadding: EdgeInsets.only(left: 20),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Service About",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Here show my about.Here show my about.Here show my about. Here show my about.Here show my about.Here show my my about. Here show my about.Here show my about.Here show my about.Here show my about.Here show my about.Here show my about. Here show my about.Here show my about.Here show my my about. Here show my about.Here show my about.Here show my about.",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  fontFamily: 'Segoe UI',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "Presentation Video",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "(2 minutes)",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 10,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: FutureBuilder(
                  future: _controller1.initialize(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        color: Colors.black,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Chewie(
                          controller: _chewieController1!,
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "Lessons Video",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "(2 minutes)",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 10,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FutureBuilder(
                future: VideoPlayerController.network(videoUrl1).initialize(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      color: Colors.black,
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Chewie(
                        controller: _chewieController2!,
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Color(0xffED0000))),
              child: Center(
                child: InkWell(
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection('teacher')
                        .doc(widget.teacherid)
                        .update({'status': "blockteacher"}).then((value) {
                      displayMessage("Teacher block");
                    }).onError((error, stackTrace) {
                      displayMessage(error.toString());
                    });
                    ;
                  },
                  child: Text(
                    "Block Teacher",
                    style: TextStyle(
                      color: Color(0xffED0000),
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
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
