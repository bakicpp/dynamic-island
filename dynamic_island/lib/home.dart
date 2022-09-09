import 'package:dynamic_island/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double w = 150;
  double h = 40;
  bool isOkay = false;
  bool deneme = false;
  bool isSilent = false;
  bool isCharging = false;

  call() {
    if (w == 150) {
      setState(() {
        w = 300;
        h = 50;
        isOkay = true;
      });
    }
  }

  faceid() {
    setState(() {
      w = 250;
      h = 250;
      isOkay = false;
      deneme = true;
    });
  }

  normal() {
    setState(() {
      w = 150;
      h = 40;
      deneme = false;
      isSilent = false;
      isOkay = false;
      isCharging = false;
    });
  }

  silent() {
    setState(() {
      w = 300;
      h = 40;
      isSilent = true;
      deneme = false;
      isOkay = false;
    });
  }

  charging() {
    setState(() {
      w = 340;
      h = 40;
      isOkay = false;
      deneme = false;
      isSilent = false;
      isCharging = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [gr1, gr2])),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOutBack,
              width: w,
              height: h,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(1, 0),
                        blurRadius: 1)
                  ]),
              child: isOkay
                  ? Flexible(
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Icon(
                              FontAwesomeIcons.phone,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Text("Baki is calling...",
                                  style: TextStyle(
                                      inherit: false,
                                      color: Colors.white,
                                      fontSize: 17))),
                          Expanded(
                            flex: 0,
                            child: CircleAvatar(
                                radius: 19,
                                backgroundColor: Colors.red,
                                child: IconButton(
                                  onPressed: normal,
                                  icon: Icon(
                                    Icons.call_end_rounded,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                )),
                          ),
                          Expanded(
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor: Colors.green,
                              child: Icon(
                                FontAwesomeIcons.phone,
                                color: Colors.black,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      )),
                    )
                  : AnimatedContainer(
                      duration: Duration(milliseconds: 260),
                      curve: Curves.bounceInOut,
                      width: w,
                      height: h,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(1, 0),
                                blurRadius: 1)
                          ]),
                      child: deneme
                          ? Image.asset(
                              "images/faceid.png",
                              scale: 4,
                            )
                          : AnimatedContainer(
                              duration: Duration(milliseconds: 260),
                              curve: Curves.bounceInOut,
                              width: w,
                              height: h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(1, 0),
                                        blurRadius: 1)
                                  ]),
                              child: isSilent
                                  ? Flexible(
                                      child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Container(
                                            width: 60,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Icon(
                                              FontAwesomeIcons.solidBellSlash,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 170),
                                            child: Text(
                                              "Silent",
                                              style: TextStyle(
                                                  inherit: false,
                                                  fontSize: 17,
                                                  color: Colors.redAccent),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))
                                  : AnimatedContainer(
                                      duration: Duration(milliseconds: 260),
                                      curve: Curves.bounceInOut,
                                      width: w,
                                      height: h,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black,
                                                offset: Offset(1, 0),
                                                blurRadius: 1)
                                          ]),
                                      child: isCharging
                                          ? Flexible(
                                              child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    "Charging",
                                                    style: TextStyle(
                                                        inherit: false,
                                                        fontSize: 17),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 170),
                                                      child: Text(
                                                        "75%",
                                                        style: TextStyle(
                                                            inherit: false,
                                                            color: battery,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Icon(
                                                        FontAwesomeIcons
                                                            .batteryThreeQuarters,
                                                        color: battery))
                                              ],
                                            ))
                                          : null,
                                    ),
                            ),
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: call,
              color: Colors.white,
              child: Text("Call"),
              minWidth: 200,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.white, width: 2.0)),
            ),
            FlatButton(
              onPressed: faceid,
              child: Text("FaceID"),
              minWidth: 200,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.white, width: 2.0)),
            ),
            FlatButton(
              onPressed: normal,
              child: Text("Normal"),
              color: Colors.white,
              minWidth: 200,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.white, width: 2.0)),
            ),
            FlatButton(
              onPressed: silent,
              child: Text("Silent"),
              minWidth: 200,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.white, width: 2.0)),
            ),
            FlatButton(
              onPressed: charging,
              child: Text("Charging"),
              minWidth: 200,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.white, width: 2.0)),
            ),
          ],
        ),
      ),
    );
  }
}
