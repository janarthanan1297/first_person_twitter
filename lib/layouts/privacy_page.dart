import 'package:first_person_twitter/layouts/create_account.dart';
import 'package:first_person_twitter/layouts/home.dart';
import 'package:first_person_twitter/layouts/navigation.dart';
import 'package:flutter/material.dart';

class Privacy1 extends StatefulWidget {
  final Widget page;
  final name, email, dob, age;
  Privacy1({Key key, this.page, this.name, this.email, this.dob, this.age}) : super(key: key);
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy1> {
  bool isLocation = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          //padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Visibility(
                      child: Padding(
                          padding: EdgeInsets.only(top: 35, left: 0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 25,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 37),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/logo.png"),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 35, left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Customize your experience",
                  style: TextStyle(
                    fontFamily: 'IBM',
                    fontSize: 31,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, left: 40, right: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Track where you see\nTwitter content across the web",
                  style: TextStyle(
                    fontFamily: 'IBM',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 30, right: 20),
                child: CheckboxListTile(
                  activeColor: Colors.blue,
                  value: true,
                  onChanged: (bool value) {
                    setState(() {
                      isLocation = value;
                    });
                  },
                  title: Text(
                    "Twitter uses this data to Personalize your experience. This web history will never be  stored with your name,email, or phone number.",
                    style: TextStyle(
                      fontFamily: "IBM",
                      color: Color(0xff55636c),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "For more details about these settings, visit the",
                  style: TextStyle(
                    fontFamily: 'IBM',
                    color: Color(0xff55636c),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5, left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Help Center.",
                  style: TextStyle(
                    fontFamily: 'IBM',
                    color: Color(0xff338ec5),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Spacer(),
              Container(
                child: Column(
                  children: [
                    Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => SignUp2(
                                      name: widget.name,
                                      email: widget.email,
                                      dob: widget.dob,
                                      age: widget.age,
                                    )));
                      },
                      child: new Align(
                          alignment: FractionalOffset.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black),
                              width: 70,
                              height: 40,
                              child: Text(
                                "Next",
                                style: TextStyle(fontFamily: "IBM", fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Privacy2 extends StatefulWidget {
  final Widget page;
  final name, email, dob;
  Privacy2({Key key, this.page, this.name, this.email, this.dob}) : super(key: key);
  @override
  _PrivacyTwoState createState() => _PrivacyTwoState();
}

class _PrivacyTwoState extends State<Privacy2> {
  bool isLocation = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          //padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Visibility(
                      child: Padding(
                          padding: EdgeInsets.only(top: 35, left: 0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 25,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 37),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/logo.png"),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 35, left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Customize your experience",
                  style: TextStyle(
                    fontFamily: 'IBM',
                    fontSize: 31,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, left: 40, right: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Track where you see\nTwitter content across the web",
                  style: TextStyle(
                    fontFamily: 'IBM',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 30, right: 20),
                child: CheckboxListTile(
                  activeColor: Colors.blue,
                  value: true,
                  onChanged: (bool value) {
                    setState(() {
                      isLocation = value;
                    });
                  },
                  title: Text(
                    "Twitter uses this data to Personalize your experience. This web history will never be  stored with your name,email, or phone number.",
                    style: TextStyle(
                      fontFamily: "IBM",
                      color: Color(0xff55636c),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "For more details about these settings, visit the",
                  style: TextStyle(
                    fontFamily: 'IBM',
                    color: Color(0xff55636c),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5, left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Help Center.",
                  style: TextStyle(
                    fontFamily: 'IBM',
                    color: Color(0xff338ec5),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Spacer(),
              Container(
                child: Column(
                  children: [
                    Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => MyNavigationBar(
                                      dob: widget.dob,
                                    )));
                      },
                      child: new Align(
                          alignment: FractionalOffset.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black),
                              width: 70,
                              height: 40,
                              child: Text(
                                "Next",
                                style: TextStyle(fontFamily: "IBM", fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
