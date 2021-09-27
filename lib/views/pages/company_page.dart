import 'package:dindag/views/pages/main.dart';
import 'package:dindag/views/screen/menu/addcompany_page.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Data Perusahaan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        leadingWidth: 0,
        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // EmptyPage('testing', context),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: index == 9 ? 60 : 0),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Perusahaan A",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.height * 0.2,
                                child: Text(
                                  "Jl. Raya Ajung, Ajung, Jember",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.height * 0.2,
                                child: Text(
                                  "0823433433433",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => AddCompanyPage(),
                    ),
                  );
                },
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
