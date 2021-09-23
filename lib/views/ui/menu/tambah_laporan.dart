import '../handling/empty_page.dart';
import 'package:flutter/material.dart';

class TambahLaporan extends StatefulWidget {
  @override
  _TambahLaporanState createState() => _TambahLaporanState();
}

class _TambahLaporanState extends State<TambahLaporan> {
  int data = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Stack(
          children: [
            data == 0
                ? EmptyPage("Laporan", () {})
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
