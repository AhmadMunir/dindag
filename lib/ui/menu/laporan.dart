import 'package:dindag/ui/handling/empty_page.dart';
import 'package:flutter/material.dart';

class Laporan extends StatefulWidget {
  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  int data = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Stack(
          children: [
            data == 0
                ? EmptyPage("Laporan", context)
                :
                //TODO: Add widget if data not empty
                Container(
                    width: 0,
                    height: 0,
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(13),
                color: Colors.indigo[800],
                child: Text(
                  "TAMBAH DATA",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
