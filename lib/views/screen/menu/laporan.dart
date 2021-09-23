import 'package:dindag/views/pages/main.dart';

import '../bae/event.dart';
import '../menu/perusahaan.dart';
import '../menu/tambah_laporan.dart';
import 'package:flutter/material.dart';

class Laporan extends StatefulWidget {
  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  int data = 1;

  List<double> progressValue = [
    60 / 100,
    90 / 100,
    50 / 100,
  ];
  List<String> progressName = [
    "Ekspor",
    "Perdagangan antar daerah",
    "Perdagangan Daerah",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SafeArea(
        child: Stack(
          children: [
            data == 0
                ? EmptyPage("Laporan", context)
                :
                //TODO: Add widget if data not empty
                //Start of Menu Item

                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                          "Progress",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              int progress = (progressValue[index] * 100).toInt();
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Event(),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5, bottom: 8),
                                      width: 150,
                                      height: 150,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              height: 80,
                                              width: 80,
                                              child: CircularProgressIndicator(
                                                color: Colors.indigo,
                                                strokeWidth: 10,
                                                value: progressValue[index],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "$progress %",
                                              style: TextStyle(
                                                color: Colors.indigo,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      width: 150,
                                      child: Text(
                                        progressName[index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
            //End of Menu Item,
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(13),
                color: Colors.indigo[800],
                child: Text(
                  "TAMBAH DATA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
