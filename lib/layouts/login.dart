import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_person_twitter/layouts/navigation.dart';
import 'package:first_person_twitter/layouts/verification_code.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  final name, email, dob;
  const Login({Key key, this.name, this.email, this.dob}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool submitValid = false;
  int words = 0;
  bool _obscureText = true;
  bool isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 330.0, end: 100.0).animate(_controller)
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

  void logInToEmail() async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyNavigationBar()),
      );
    } catch (err) {
      // updated Nov 1, 2020
      setState(() {
        isLoading = false;
      });
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
    } //finally {
    //isLoading = false;
    //}
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                                  Icons.close,
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
                    "To get started, first enter your email.",
                    style: TextStyle(
                      fontFamily: 'IBM',
                      fontSize: 31,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    autofocus: false,
                    focusNode: _focusNode1,
                    controller: email,
                    onEditingComplete: (() {
                      FocusScope.of(context).nextFocus();
                    }),
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
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: false,
                        focusNode: _focusNode2,
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
                  height: _animation.value,
                ),
                Container(
                  child: Column(
                    children: [
                      Divider(),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                            },
                            child: new Align(
                                alignment: FractionalOffset.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 10),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration:
                                        BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.grey[350], width: 1)),
                                    width: 180,
                                    height: 40,
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(fontFamily: "IBM", fontSize: 16, fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                )),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                logInToEmail();
                              }
                            },
                            child: new Align(
                                alignment: FractionalOffset.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10, top: 10),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassword extends StatefulWidget {
  final name, email, dob;
  const ForgotPassword({Key key, this.name, this.email, this.dob}) : super(key: key);
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  int words = 0;
  TextEditingController forgotPassword = TextEditingController();

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
                                  Icons.close,
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
                    "Reset your Twitter account",
                    style: TextStyle(
                      fontFamily: 'IBM',
                      fontSize: 31,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    autofocus: false,
                    focusNode: _focusNode1,
                    controller: forgotPassword,
                    onEditingComplete: (() {
                      FocusScope.of(context).nextFocus();
                    }),
                    decoration: InputDecoration(
                      hintText: "Enter your email",
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
                            FirebaseAuth.instance.sendPasswordResetEmail(email: forgotPassword.text);
                            Fluttertoast.showToast(msg: 'Reset email has been sent!', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
                            Navigator.pop(context);
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
                                  "Submit",
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
