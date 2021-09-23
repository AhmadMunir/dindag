import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/img/default/event.jpg",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.6,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.6,
                      alignment: Alignment.center,
                      child: Text(
                        "Lorem ipsum dolor sit amet",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.6,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.indigo[300],
                        child: Row(
                          children: [
                            //TODO: Add news, article, and event image
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/img/default/avatar.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 65,
                              width: MediaQuery.of(context).size.width * 0.6,
                              // color: Colors.teal,
                              child: ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                children: [
                                  Text(
                                    "Berita",
                                    style: TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.indigo[300],
                        child: Row(
                          children: [
                            //TODO: Add news, article, and event image
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/img/default/avatar.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 65,
                              width: MediaQuery.of(context).size.width * 0.6,
                              // color: Colors.teal,
                              child: ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                children: [
                                  Text(
                                    "Artikel",
                                    style: TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                  Text(
                                    "Consectetur adipiscing elit",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.indigo[300],
                        child: Row(
                          children: [
                            //TODO: Add news, article, and event image
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/img/default/avatar.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 65,
                              width: MediaQuery.of(context).size.width * 0.6,
                              // color: Colors.teal,
                              child: ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                children: [
                                  Text(
                                    "Event",
                                    style: TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                  Text(
                                    "sed do eiusmod tempor",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
