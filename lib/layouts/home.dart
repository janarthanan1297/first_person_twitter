import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_person_twitter/layouts/animation.dart';
import 'package:first_person_twitter/layouts/landing.dart';
import 'package:first_person_twitter/layouts/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  final dob;
  Home({Key key, this.dob}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String profile = FirebaseAuth.instance.currentUser.photoURL;
  String user = FirebaseAuth.instance.currentUser.displayName;
  String email = FirebaseAuth.instance.currentUser.email;

  int words = 0;
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    super.initState();
    debugPrint(widget.dob);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(right: 15, left: 5),
            child: Row(
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(profile == null ? "https://i.stack.imgur.com/l60Hf.png" : profile),
                        radius: 30.0,
                      ),
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                Spacer(),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 0),
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
                Spacer(),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 0, right: 0),
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/star.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 1.0,
          centerTitle: false,
          titleSpacing: 0,
        ),
        drawer: Container(
          width: MediaQuery.of(context).size.width / 1.15,
          child: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 40, left: 15),
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
                Container(
                  padding: EdgeInsets.only(top: 5, left: 15),
                  child: Text(
                    '$user',
                    style: TextStyle(
                      fontFamily: 'IBM',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, left: 15, bottom: 10),
                  child: Text(
                    '@' + email.substring(0, email.toString().lastIndexOf('@')),
                    style: TextStyle(
                      fontFamily: 'IBM',
                      fontSize: 16,
                      color: Color(0xff8a8989),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 10, right: 15),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                          fontFamily: "IBM",
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: 05,
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                          fontFamily: "IBM",
                          fontSize: 16,
                          color: Color(0xff55636c),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontFamily: "IBM",
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: 05,
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontFamily: "IBM",
                          fontSize: 16,
                          color: Color(0xff55636c),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CreateRoute(page: Profile(dob: widget.dob)));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 16, bottom: 30),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.user,
                          size: 17,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontFamily: 'IBM',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.15,
                    padding: EdgeInsets.only(left: 15, bottom: 30),
                    child: Row(
                      children: [
                        Icon(Icons.list_alt),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Lists',
                          style: TextStyle(
                            fontFamily: 'IBM',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 15, bottom: 30),
                    child: Row(
                      children: [
                        Icon(Icons.comment_outlined),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Topics',
                          style: TextStyle(
                            fontFamily: 'IBM',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 15, bottom: 30),
                    child: Row(
                      children: [
                        Icon(Icons.bookmark_border),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Bookmarks',
                          style: TextStyle(
                            fontFamily: 'IBM',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 15, bottom: 30),
                    child: Row(
                      children: [
                        Icon(Icons.flash_on_outlined),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Moments',
                          style: TextStyle(
                            fontFamily: 'IBM',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Landing()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.15,
                    padding: EdgeInsets.only(left: 15, bottom: 30),
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontFamily: 'IBM',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Spacer(),
                Divider(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.black,
                    child: Row(
                      children: [
                        Center(child: Icon(Icons.emoji_objects_outlined)),
                        Spacer(),
                        Center(child: Icon(Icons.qr_code)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('timeline').orderBy('time', descending: true).snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          child: Column(
                            children: [
                              Center(child: Container(height: 50, width: 50, child: CircularProgressIndicator())),
                            ],
                          ),
                        );
                      }
                      var length = snapshot.data.docs.length;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        itemCount: length,
                        itemBuilder: (context, i) {
                          DateTime time = (snapshot.data.docs[i]["time"]).toDate();
                          var currentime = new DateTime.now();
                          Duration difference = currentime.difference(time);
                          var hour = difference.inHours;
                          var inDay;
                          var inMin;
                          if (hour > 24) {
                            inDay = difference.inDays;
                          }
                          if (hour <= 0) {
                            inMin = difference.inMinutes;
                          }
                          return Wrap(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 0, left: 15, right: 15),
                                child: Row(
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
                                          backgroundImage: NetworkImage(snapshot.data.docs[i]["profile"].toString()),
                                          radius: 25.0,
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
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                //width: 100,
                                                child: Text(snapshot.data.docs[i]["name"].toString(),
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(fontFamily: "IBM", fontSize: 16, fontWeight: FontWeight.w600)),
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Container(
                                                width: 14,
                                                height: 14,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/verified.png"),
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                  (hour > 24)
                                                      ? '$inDay' + 'd'
                                                      : (hour <= 0)
                                                          ? '$inMin' + 'min'
                                                          : '$hour' + 'h',
                                                  style: TextStyle(
                                                      fontFamily: "IBM", fontSize: 15, color: Color(0xff8a8989), fontWeight: FontWeight.w500)),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons.more_vert,
                                                color: Colors.grey.withOpacity(.8),
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            child: Text(
                                                '@' +
                                                    snapshot.data.docs[i]["email"]
                                                        .toString()
                                                        .substring(0, snapshot.data.docs[i]["email"].toString().lastIndexOf('@')),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: "IBM", fontSize: 15, color: Color(0xff8a8989), fontWeight: FontWeight.w500)),
                                          ),
                                          SizedBox(
                                            height: 05,
                                          ),
                                          Container(
                                            child: Text(
                                              snapshot.data.docs[i]["tweet"].toString(),
                                              maxLines: 20,
                                              style: TextStyle(
                                                fontFamily: "IBM",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff55636c),
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.mode_comment_outlined,
                                                color: Colors.grey[700],
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('453',
                                                  style: TextStyle(
                                                      fontFamily: "IBM", fontSize: 13, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.retweet,
                                                color: Colors.grey[600],
                                                size: 17,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('1,500',
                                                  style: TextStyle(
                                                      fontFamily: "IBM", fontSize: 13, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.heart,
                                                color: Colors.grey[600],
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('22.3k',
                                                  style: TextStyle(
                                                      fontFamily: "IBM", fontSize: 13, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons.share_outlined,
                                                color: Colors.grey[600],
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
        floatingActionButton: FancyFab());
  }
}
