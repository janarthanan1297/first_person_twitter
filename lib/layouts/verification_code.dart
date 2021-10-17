import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_person_twitter/layouts/landing.dart';
import 'package:first_person_twitter/layouts/navigation.dart';
import 'package:first_person_twitter/layouts/privacy_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Verification extends StatefulWidget {
  final name, email, dob;
  const Verification({Key key, this.name, this.email, this.dob}) : super(key: key);
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  bool submitValid = false;
  int words = 0;
  TextEditingController otp = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {});

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 400.0, end: 150.0).animate(_controller)
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
    //var size = MediaQuery.of(context).size;
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
                padding: EdgeInsets.only(top: 25, left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "We sent you a code",
                  style: TextStyle(
                    fontFamily: 'IBM',
                    fontSize: 31,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter it below to verify " + widget.email,
                  style: TextStyle(
                    fontFamily: 'IBM',
                    color: Color(0xff55636c),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          words = 50 - value.length;
                        });
                      },
                      autofocus: false,
                      focusNode: _focusNode1,
                      controller: otp,
                      onEditingComplete: (() {
                        FocusScope.of(context).nextFocus();
                      }),
                      decoration: InputDecoration(
                        hintText: "Verification code",
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
                    Container(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Didn't receive email?",
                        style: TextStyle(
                          fontFamily: 'IBM',
                          color: Color(0xff338ec5),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
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
                      onTap: () {},
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
    );
  }
}

class Password extends StatefulWidget {
  final name, email, dob;
  const Password({Key key, this.name, this.email, this.dob}) : super(key: key);
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool isLoading = false;
  int words = 0;
  TextEditingController password = TextEditingController();

  void registerToEmail() async {
    CircularProgressIndicator();
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email.trim(),
        password: password.text.trim(),
      );
      User user = userCredential.user;
      if (user != null) {
        await user.updateProfile(displayName: widget.name.trim());
        debugPrint(widget.name);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyNavigationBar(
                    dob: widget.dob,
                  )),
        );
      }
    } catch (err) {
      isLoading = false;

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                ElevatedButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 400.0, end: 200.0).animate(_controller)
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
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                  padding: EdgeInsets.only(top: 25, left: 40),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You'll need a password",
                    style: TextStyle(
                      fontFamily: 'IBM',
                      fontSize: 31,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Make sure its's 8 characters or more.",
                    style: TextStyle(
                      fontFamily: 'IBM',
                      color: Color(0xff55636c),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 15,
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
                        autofocus: false,
                        focusNode: _focusNode1,
                        controller: password,
                        obscureText: _obscureText,
                        onEditingComplete: (() {
                          FocusScope.of(context).nextFocus();
                        }),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontFamily: "IBM",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff55636c),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          enabledBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters!';
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
                            setState(() {
                              isLoading = true;
                            });
                            registerToEmail();
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

class DateOfBirth extends StatefulWidget {
  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final _formKey = GlobalKey<FormState>();
  Animation _animation;
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  int words = 0;
  var age;
  var years;
  TextEditingController dob = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 400.0, end: 220.0).animate(_controller)
      ..addListener(() {
        setState(() {});
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
      } else {
        _controller.reverse();
      }
    });
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

  void datepicker() {
    DatePicker.showDatePicker(context, showTitleActions: true, minTime: DateTime(1900, 1, 1), maxTime: DateTime.now(), onChanged: (date) {
      var _formattedate = new DateFormat('yyyy-MM-dd').format(date);
      dob.text = '$_formattedate';
    }, onCancel: () {
      dob.text = '';
      _focusNode1.unfocus();
    }, onConfirm: (date) {
      var _formattedate = new DateFormat('yyyy-MM-dd').format(date);
      dob.text = '$_formattedate';
      age = date;
      DateTime time = age;
      var currentime = new DateTime.now();
      Duration difference = currentime.difference(time);
      years = difference.inDays;
      _focusNode1.unfocus();
    }, currentTime: DateTime.now(), locale: LocaleType.en);
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
    // var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                  padding: EdgeInsets.only(top: 25, left: 40),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "What's your birth date?",
                    style: TextStyle(
                      fontFamily: 'IBM',
                      fontSize: 31,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "This won't be public.",
                    style: TextStyle(
                      fontFamily: 'IBM',
                      color: Color(0xff55636c),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 15,
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
                        autofocus: false,
                        focusNode: _focusNode1,
                        readOnly: true,
                        onTap: () {
                          datepicker();
                        },
                        controller: dob,
                        onEditingComplete: (() {
                          FocusScope.of(context).nextFocus();
                        }),
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
                          if (years < 6570) {
                            showdialog(context, "Can't complete your signup right now.");
                            return 'Age less than 18';
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
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Privacy2(
                                          dob: dob.text,
                                        )));
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
