import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_person_twitter/layouts/landing.dart';
import 'package:first_person_twitter/layouts/privacy_page.dart';
import 'package:first_person_twitter/layouts/verification_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  int words = 0;
  var age;
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();

  void datepicker() {
    DatePicker.showDatePicker(context, showTitleActions: true, minTime: DateTime(1900, 1, 1), maxTime: DateTime.now(), onChanged: (date) {
      var _formattedate = new DateFormat('yyyy-MM-dd').format(date);
      dob.text = '$_formattedate';
    }, onCancel: () {
      dob.text = '';
      _focusNode3.nextFocus();
    }, onConfirm: (date) {
      var _formattedate = new DateFormat('yyyy-MM-dd').format(date);
      dob.text = '$_formattedate';
      age = date;
      _focusNode3.nextFocus();
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 260.0, end: 30.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode1.addListener(() {
      if (_focusNode1.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    _focusNode3.addListener(() {
      if (_focusNode3.hasFocus) {
        _controller.forward();
        datepicker();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
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
                  padding: EdgeInsets.only(top: 7, left: 40),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create your\naccount",
                    style: TextStyle(
                      fontFamily: 'IBM',
                      fontSize: 31,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            words = 50 - value.length;
                          });
                        },
                        autofocus: true,
                        focusNode: _focusNode1,
                        controller: name,
                        onEditingComplete: (() {
                          FocusScope.of(context).nextFocus();
                        }),
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(
                            fontFamily: "IBM",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff55636c),
                          ),
                          focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(color: (words >= 0) ? Colors.blue : Colors.red, width: 2),
                          ),
                          enabledBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Name';
                          } else if (words < 0) {
                            return 'You crossed the maximum limit';
                          }
                          return null;
                        },
                      ),
                      new Align(
                          alignment: FractionalOffset.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Container(
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              width: 70,
                              height: 40,
                              child: Text(
                                (name.text.length == 0) ? '50' : '$words',
                                style: TextStyle(
                                  fontFamily: "IBM",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff55636c),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )),
                      TextFormField(
                        focusNode: _focusNode2,
                        controller: email,
                        onEditingComplete: (() => FocusScope.of(context).nextFocus()),
                        decoration: InputDecoration(
                          hintText: "Email address",
                          hintStyle: TextStyle(
                            fontFamily: "IBM",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff55636c),
                          ),
                          enabledBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Email Address';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email address!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        focusNode: _focusNode3,
                        readOnly: true,
                        controller: dob,
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          hintText: "Date of birth",
                          hintStyle: TextStyle(
                            fontFamily: "IBM",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff55636c),
                          ),
                          enabledBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Date of birth';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: _animation.value,
                ),
                Container(
                  child: Column(
                    children: [
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) => Privacy1(email: email.text, name: name.text, dob: dob.text, age: age)));
                          }
                        },
                        child: new Align(
                            alignment: FractionalOffset.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUp2 extends StatefulWidget {
  final name, email, dob, age;
  const SignUp2({Key key, this.name, this.email, this.dob, this.age}) : super(key: key);
  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  int words = 0;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future showdialog(BuildContext context, String message) async {
    return showDialog(
        context: context,
        builder: (BuildContext build) => new AlertDialog(
              title: new Text(
                message,
                style: TextStyle(fontFamily: "IBM", fontSize: 16, fontWeight: FontWeight.w700),
              ),
              actions: <Widget>[
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
                  onPressed: () async {
                    setState(() {});
                    FirebaseAuth.instance.currentUser.delete();
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Landing()),
                    );
                  },
                  child: new Text(
                    'CLOSE',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    DateTime time = widget.age;
    var currentime = new DateTime.now();
    Duration difference = currentime.difference(time);
    var years = difference.inDays;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                padding: EdgeInsets.only(top: 20, left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create your\naccount",
                  style: TextStyle(
                    fontFamily: 'IBM',
                    fontSize: 31,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40, right: 40, top: 60),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          words = 50 - value.length;
                        });
                      },
                      autofocus: false,
                      enabled: false,
                      focusNode: _focusNode1,
                      controller: name..text = widget.name,
                      onEditingComplete: (() {
                        FocusScope.of(context).nextFocus();
                      }),
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(
                          fontFamily: "IBM",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff55636c),
                        ),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      focusNode: _focusNode2,
                      enabled: false,
                      controller: email..text = widget.email,
                      onEditingComplete: (() => FocusScope.of(context).nextFocus()),
                      decoration: InputDecoration(
                        hintText: "Email address",
                        hintStyle: TextStyle(
                          fontFamily: "IBM",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff55636c),
                        ),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      focusNode: _focusNode3,
                      enabled: false,
                      controller: dob..text = widget.dob,
                      decoration: InputDecoration(
                        hintText: "Date of birth",
                        hintStyle: TextStyle(
                          fontFamily: "IBM",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff55636c),
                        ),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 80, left: 40, right: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "By signing up, you agree to the Terms of service and Privacy Policy, including Cookies use. Others will be able to find you by email or phone number when provided.",
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
                padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                child: InkWell(
                  onTap: () {
                    if (years >= 6570) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => Password(
                                    email: widget.email,
                                    name: widget.name,
                                    dob: widget.dob,
                                  )));
                    } else {
                      showdialog(context, "Can't complete your signup right now.");
                    }
                  },
                  child: Container(
                    width: size.width * 0.75,
                    height: 55,
                    decoration: BoxDecoration(color: Color(0xff1d9bf0), borderRadius: BorderRadius.circular(30), boxShadow: []),
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontFamily: "IBM", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
