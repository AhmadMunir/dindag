import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCompanyPage extends StatefulWidget {
  @override
  _AddCompanyPageState createState() => _AddCompanyPageState();
}

class _AddCompanyPageState extends State<AddCompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.indigo,
                    height: 4,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  Container(
                    color: Colors.indigo,
                    height: 4,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  "Tambah Perusahaan Baru",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama Perusahaan",
                  ),
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nomor Telepon",
                  ),
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Entitas Bisnis",
                  ),
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama Kontak",
                  ),
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Tipe Bisnis",
                  ),
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "NPWP",
                  ),
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "NIB",
                  ),
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Alamat",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
