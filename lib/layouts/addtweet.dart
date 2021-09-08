import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddTweet extends StatefulWidget {
  @override
  _AddTweetState createState() => _AddTweetState();
}

class _AddTweetState extends State<AddTweet> with SingleTickerProviderStateMixin {
  FocusNode _focusNode1 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  int words = 0;
  TextEditingController tweet = TextEditingController();
  int id;
  DateTime _currenttime;
  String profile = FirebaseAuth.instance.currentUser.photoURL;
  String email = FirebaseAuth.instance.currentUser.email;
  String name = FirebaseAuth.instance.currentUser.displayName;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    super.dispose();
  }

  upload() async {
    _currenttime = new DateTime.now();
    var list = new List<int>.generate(10000000, (int index) => index);
    list.shuffle();
    id = list[0];
    profile = (profile == null ? "https://i.stack.imgur.com/l60Hf.png" : profile);
    await FirebaseFirestore.instance
        .collection('timeline')
        .doc('$email' + '$id')
        .set({'name': name, 'email': email, 'id': email + '$id', 'time': _currenttime, 'tweet': tweet.text, 'profile': profile});
    await FirebaseFirestore.instance
        .collection('$email')
        .add({'name': name, 'email': email, 'id': email + '$id', 'time': _currenttime, 'tweet': tweet.text, 'profile': profile}).then(
            (value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
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
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          upload();
                        }
                      },
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 37),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff1d9bf0),
                              ),
                              width: 70,
                              height: 40,
                              child: Text(
                                "Tweet",
                                style: TextStyle(fontFamily: "IBM", fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 10, bottom: 25),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Make sure its's less than or equal to 280 characters",
                    style: TextStyle(
                      fontFamily: 'IBM',
                      color: Color(0xff55636c),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                          // boxShadow: [BoxShadow(spreadRadius: 2, blurRadius: 10, color: Colors.black.withOpacity(0.1), offset: Offset(0, 10))],
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(profile == null ? "https://i.stack.imgur.com/l60Hf.png" : profile),
                          radius: 30.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            autofocus: true,
                            minLines: 3,
                            maxLines: null,
                            controller: tweet,
                            onChanged: (value) {
                              setState(() {
                                words = 280 - value.length;
                              });
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: "What's happening?",
                              hintStyle: TextStyle(
                                fontFamily: "IBM",
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff55636c),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Empty Tweet!';
                              } else if (words < 0) {
                                return 'You crossed the maximum limit';
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
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
                              padding: const EdgeInsets.only(right: 0),
                              child: Container(
                                alignment: Alignment.center,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(30), color: (words >= 0) ? Colors.grey[700] : Colors.red),
                                width: 70,
                                height: 40,
                                child: Text(
                                  (tweet.text.length == 0) ? '280' : '$words',
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
