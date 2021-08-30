import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_person_twitter/layouts/create_account.dart';
import 'package:first_person_twitter/layouts/home.dart';
import 'package:first_person_twitter/layouts/login.dart';
import 'package:first_person_twitter/layouts/verification_code.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Landing extends StatefulWidget {
  static const String routeName = 'landing';
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Visibility(
                child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/logo.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    )),
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "See what's\nhappening in the\nworld right now.",
                style: TextStyle(
                  fontFamily: 'IBM',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Spacer(),
            Container(
              width: size.width,
              height: 130,
              // color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        // ignore: unused_local_variable
                        UserCredential userCredential = await signInWithGoogle();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DateOfBirth()),
                        );
                      },
                      child: Container(
                        width: size.width * 0.75,
                        height: 42,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.grey[350], width: 1)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/google.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                  fontFamily: "IBM",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Or",
                            style: TextStyle(
                              fontFamily: "IBM",
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Container(
                        width: size.width * 0.75,
                        height: 42,
                        decoration: BoxDecoration(color: Color(0xff1d9bf0), borderRadius: BorderRadius.circular(30), boxShadow: []),
                        child: Center(
                          child: Text(
                            "Create account",
                            style: TextStyle(fontFamily: "IBM", fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "By signing up, you agree to our ",
                        style: TextStyle(
                          fontFamily: "IBM",
                          color: Color(0xff55636c),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Terms, Privacy Policy,",
                        style: TextStyle(
                          color: Color(0xff338ec5),
                          fontFamily: "IBM",
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "and ",
                        style: TextStyle(
                          fontFamily: "IBM",
                          color: Color(0xff55636c),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Cookies Use.",
                        style: TextStyle(
                          color: Color(0xff338ec5),
                          fontFamily: "IBM",
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Have an account already? ",
                    style: TextStyle(
                      color: Color(0xff55636c),
                      fontFamily: "IBM",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Color(0xff338ec5),
                        fontFamily: "IBM",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
