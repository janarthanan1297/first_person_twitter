import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_person_twitter/layouts/addtweet.dart';
import 'package:first_person_twitter/layouts/animation.dart';
import 'package:first_person_twitter/layouts/edittweet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  String profile = FirebaseAuth.instance.currentUser.photoURL;
  String user = FirebaseAuth.instance.currentUser.displayName;
  String email = FirebaseAuth.instance.currentUser.email;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          image:
                              DecorationImage(image: NetworkImage('https://onlytech.com/wp-content/uploads/2021/04/Twitter.jpg'), fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 35,
                        left: 15,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.black54,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            iconSize: 20,
                            color: Colors.white,
                            splashColor: Colors.blue,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        )),
                    Positioned(
                        top: 35,
                        right: 15,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.black54,
                          child: IconButton(
                            icon: Icon(Icons.more_vert),
                            iconSize: 20,
                            color: Colors.white,
                            splashColor: Colors.blue,
                            onPressed: () {},
                          ),
                        )),
                    Positioned(
                      top: 120,
                      left: 15,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                          // boxShadow: [BoxShadow(spreadRadius: 2, blurRadius: 10, color: Colors.black.withOpacity(0.1), offset: Offset(0, 10))],
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(profile == null ? "https://i.stack.imgur.com/l60Hf.png" : profile),
                          radius: 35,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 160,
                      right: 15,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.grey[350], width: 1)),
                        width: 125,
                        height: 40,
                        child: Text(
                          "Edit profile",
                          style: TextStyle(
                            fontFamily: "IBM",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                alignment: Alignment.centerLeft,
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.grey[350], width: 1)),

                child: Text(
                  user,
                  style: TextStyle(
                    fontFamily: "IBM",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 20, right: 15),

                alignment: Alignment.centerLeft,
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.grey[350], width: 1)),

                child: Text(
                  '@' + email.substring(0, email.toString().lastIndexOf('@')),
                  style: TextStyle(fontFamily: "IBM", fontSize: 16, color: Color(0xff8a8989), fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 0, right: 15),
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.birthdayCake,
                      color: Color(0xff55636c),
                      size: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Born September 12,1997',
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
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 10, right: 15),
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.calendarAlt,
                      color: Color(0xff55636c),
                      size: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Joined August 2021',
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
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 20, right: 15),
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
              Container(
                padding: EdgeInsets.only(left: 15),
                child: TabBar(
                  enableFeedback: false,
                  isScrollable: true,
                  indicatorColor: Colors.blue,
                  controller: tabController,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontFamily: "IBM",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelColor: Color(0xff55636c),
                  unselectedLabelStyle: TextStyle(
                    fontFamily: "IBM",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: [
                    Text("Tweets"),
                    Text("Tweets & replies"),
                    Text("Media"),
                    Text("Likes"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    TabWidget(),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 40),
                            child: FaIcon(
                              FontAwesomeIcons.solidCommentAlt,
                              color: Colors.blue[100],
                              size: 150,
                            ),
                          ),
                          Text(
                            'No Tweets & Replies',
                            style: TextStyle(
                              fontFamily: "IBM",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 40),
                            child: FaIcon(
                              FontAwesomeIcons.photoVideo,
                              color: Colors.blue[100],
                              size: 150,
                            ),
                          ),
                          Text(
                            'No Media',
                            style: TextStyle(
                              fontFamily: "IBM",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 40),
                            child: FaIcon(
                              FontAwesomeIcons.solidThumbsUp,
                              color: Colors.blue[100],
                              size: 150,
                            ),
                          ),
                          Text(
                            'No Likes',
                            style: TextStyle(
                              fontFamily: "IBM",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FancyFab());
  }
}

class TabWidget extends StatefulWidget {
  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> with SingleTickerProviderStateMixin {
  String email = FirebaseAuth.instance.currentUser.email;
  @override
  void initState() {
    super.initState();
  }

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        print("Settings Clicked");
        break;
      case 1:
        print("Privacy Clicked");
        break;
      case 2:
        print("User Logged out");

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection('$email').orderBy('time', descending: true).snapshots(),
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
                  if (length == 0) {
                    return Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 40),
                            child: FaIcon(
                              FontAwesomeIcons.featherAlt,
                              color: Colors.blue[100],
                              size: 150,
                            ),
                          ),
                          Text(
                            'No Tweets',
                            style: TextStyle(
                              fontFamily: "IBM",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  }
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
                      if (hour > 24) {
                        inDay = difference.inDays;
                      }
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 0,
                              left: 15,
                            ),
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
                                                style: TextStyle(fontFamily: "IBM", fontSize: 16, fontWeight: FontWeight.bold)),
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
                                          Text((hour > 24) ? '$inDay' + 'd' : '$hour' + 'h',
                                              style:
                                                  TextStyle(fontFamily: "IBM", fontSize: 15, color: Color(0xff8a8989), fontWeight: FontWeight.w500)),
                                          PopupMenuButton(
                                              icon: Icon(
                                                Icons.more_vert,
                                                color: Colors.black.withOpacity(.6),
                                                size: 18,
                                              ),
                                              itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
                                                          onPressed: () {
                                                            Navigator.of(context).push(CreateRoute(
                                                                page: EditTweet(
                                                              id: snapshot.data.docs[i].id,
                                                              docid: snapshot.data.docs[i]['id'],
                                                              tweet: snapshot.data.docs[i]['tweet'],
                                                            )));
                                                          },
                                                          child: Text(
                                                            "Edit Tweet",
                                                            style: TextStyle(color: Colors.blue),
                                                          )),
                                                      value: 1,
                                                    ),
                                                    PopupMenuItem(
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
                                                          onPressed: () {
                                                            FirebaseFirestore.instance.collection(email).doc(snapshot.data.docs[i].id).delete();
                                                            FirebaseFirestore.instance
                                                                .collection('timeline')
                                                                .doc(snapshot.data.docs[i]['id'])
                                                                .delete()
                                                                .then((_) {
                                                              Navigator.of(context).pop();
                                                              Fluttertoast.showToast(
                                                                  msg: 'tweet deleted',
                                                                  toastLength: Toast.LENGTH_SHORT,
                                                                  gravity: ToastGravity.BOTTOM);
                                                            });
                                                          },
                                                          child: Text(
                                                            "Delete Tweet",
                                                            style: TextStyle(color: Colors.red),
                                                          )),
                                                      value: 2,
                                                    )
                                                  ])
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Text(
                                            '@' +
                                                snapshot.data.docs[i]["email"]
                                                    .toString()
                                                    .substring(0, snapshot.data.docs[i]["email"].toString().lastIndexOf('@')),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontFamily: "IBM", fontSize: 15, color: Color(0xff8a8989), fontWeight: FontWeight.w500)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Text(
                                          snapshot.data.docs[i]["tweet"].toString(),
                                          maxLines: 20,
                                          style: TextStyle(
                                            fontFamily: "IBM",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff55636c),
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
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
                                              style:
                                                  TextStyle(fontFamily: "IBM", fontSize: 13, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          FaIcon(
                                            FontAwesomeIcons.retweet,
                                            color: Colors.grey[600],
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('1,500',
                                              style:
                                                  TextStyle(fontFamily: "IBM", fontSize: 13, color: Colors.grey[600], fontWeight: FontWeight.w500)),
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
                                              style:
                                                  TextStyle(fontFamily: "IBM", fontSize: 13, color: Colors.grey[600], fontWeight: FontWeight.w500)),
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
    );
  }
}
