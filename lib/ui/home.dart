import 'package:dindag/ui/bae/event.dart';
import 'package:dindag/ui/menu/laporan.dart';
import 'package:dindag/ui/menu/perusahaan.dart';
import 'package:dindag/ui/menu/tambah_laporan.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List colors = [
    Colors.amber[200],
    Colors.blue[300],
    Colors.pink[200],
    Colors.indigo[300],
    Colors.deepOrange[200],
    Colors.teal[200],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TODO: Add variable for name
                      Text(
                        "Selamat Datang \nKawan",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/img/default/avatar.png"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Start of Menu Item
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Perusahaan(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 150,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            //TODO: Temporary, until the image is available
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //TODO: Add Image
                              Text(
                                "Perusahaan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Laporan(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 150,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            //TODO: Temporary, until the image is available
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //TODO: Add Image
                              Text(
                                "Laporan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TambahLaporan(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 150,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            //TODO: Temporary, until the image is available
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //TODO: Add Image
                              Text(
                                "Buat/Tambah Laporan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //End of Menu Item
                SizedBox(
                  height: 20,
                ),
                //Start White
                Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
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
                            Icon(
                              Icons.event_available_outlined,
                              size: 80,
                              color: Colors.blue[700],
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
                            Icon(
                              Icons.event_available_outlined,
                              size: 80,
                              color: Colors.blue[700],
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
                            Icon(
                              Icons.event_available_outlined,
                              size: 80,
                              color: Colors.blue[700],
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
                      SizedBox(
                        height: 20,
                      ),
                      //Start of event
                      Container(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Event(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 150,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: colors[index],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  //TODO: Temporary, until the image is available
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    //TODO: Add Image
                                    Text(
                                      "Event ${index + 1}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      //End of event
                    ],
                  ),
                ),
                //End White
              ],
            ),
          ),
        ),
      ),
    );
  }
}
