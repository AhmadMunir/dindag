import 'dart:convert';
import 'dart:io';

import 'package:dindag/models/company.dart';
import 'package:dindag/views/widgets/current_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailCompanyPage extends StatefulWidget {
  const DetailCompanyPage({Key? key, required this.company}) : super(key: key);

  final Company? company;
  @override
  _DetailCompanyPageState createState() => _DetailCompanyPageState();
}

class _DetailCompanyPageState extends State<DetailCompanyPage> with TickerProviderStateMixin {
  TabController? tabController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text(
            "Detail Perusahaan",
          ),
        ),
        leading: Icon(
          Icons.arrow_back_ios_new,
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          // shrinkWrap: true,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "UD. SUKA MAJU".toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Pertanian",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.pin_drop_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Jember",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                indicatorColor: Colors.indigo,
                controller: tabController,
                tabs: [
                  Tab(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.business_sharp,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Detail",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.card_membership,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Lisensi",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: TabBarView(
                controller: tabController,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        _companyDetail(),
                        _companyOwner(),
                        _companyAddress(),
                        _companyAssets(),
                      ],
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    // color: Colors.white,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            index == 0
                                ? InkWell(
                                    enableFeedback: true,
                                    onTap: () {},
                                    child: Card(
                                      elevation: 2,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              "Tambah Lisensi",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 0,
                                    width: 0,
                                  ),
                            Card(
                              elevation: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Column(
                                  children: [
                                    _itemDetailCompany("Nama Lisensi", "NPWP (Nomor Pokok Wajib Pajak)"),
                                    _itemDetailCompany("Penyedia Agensi", "DJP Jember"),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _companyDetail() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detail Perusahaan",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          _itemDetailCompany("Nama Perusahaan", "UD. SUKA MAJU"),
          _itemDetailCompany("Entitas Bisnis", "UD"),
          _itemDetailCompany("Nomor Telepon", "083234432234"),
          _itemDetailCompany("Tipe Bisnis", "Pertanian"),
          _itemDetailCompany("NPWP", "234223232323232"),
          _itemDetailCompany("NIB", "82928928"),
        ],
      ),
    );
  }

  Container _companyOwner() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pemilik Perusahaan",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          _itemDetailCompany("Nomor Identitas (KTP)", "35112982982901929"),
          _itemDetailCompany("Nama Pertama", "Suratnam"),
          _itemDetailCompany("Nama Belakang", "Sanjaya"),
          _itemDetailCompany("Nomor Telepon", "089982982989"),
          _itemDetailCompany("Nomor WhatsApp", "089982982989"),
          _itemDetailCompany("Email", "sanjayasuratnam@sukamaju.id"),
        ],
      ),
    );
  }

  Container _companyAssets() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aset Perusahaan",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          _itemDetailCompany("Total Karyawan", "20"),
          _itemDetailCompany("Karyawan Laki-laki", "13"),
          _itemDetailCompany("Karyawan Perempuan", "7"),
          _itemDetailCompany("Karyawan Asing", "-"),
          _itemDetailCompany("Tipe Kendaraan ", "Roda 7"),
          _itemDetailCompany("Total Kendaraan", "20"),
          _itemDetailCompany("Kepemilikan Tanah", "Sendiri"),
        ],
      ),
    );
  }

  Container _companyAddress() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Alamat Perusahaan",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          _itemDetailCompany("Alamat", "Jalan Mastrip 14, Sumbersari, Jember"),
          _itemDetailCompany("Kode POS", "67287"),
        ],
      ),
    );
  }

  Container _itemDetailCompany(String subItem, String value) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 2,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              subItem,
              style: TextStyle(
                color: Colors.black,
                // fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              value,
              maxLines: 2,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.indigo,
          )
        ],
      ),
    );
  }
}
