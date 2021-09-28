import 'package:dindag/views/widgets/current_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCompanyPage extends StatefulWidget {
  @override
  _AddCompanyPageState createState() => _AddCompanyPageState();
}

class _AddCompanyPageState extends State<AddCompanyPage> {
  final nameNode = FocusNode();
  final notelNode = FocusNode();
  final entNode = FocusNode();
  final contactNode = FocusNode();
  final typeNode = FocusNode();
  final npwpNode = FocusNode();
  final nibNode = FocusNode();
  final addressNode = FocusNode();
  final zipNode = FocusNode();
  final employeeNode = FocusNode();
  final maleNode = FocusNode();
  final femaleNode = FocusNode();
  final foreignEmployeeNode = FocusNode();
  final vehicleTypeNode = FocusNode();
  final vehicleTotalNode = FocusNode();
  final landOwnershipNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String bussinesEntity = 'Pilih Entitas Bisnis';

  final itemDropdown = <String>[
    'Pilih Entitas Bisnis',
    'CV',
    'PO',
    'UD',
    'PD',
    'PT',
  ];

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
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CurrentTextFormField(
                      focusNode: nameNode,
                      labelText: "Nama Perusahaan",
                      keyboardKey: TextInputType.name,
                      formKey: _formKey,
                      nextNode: notelNode,
                    ),
                    CurrentTextFormField(
                      focusNode: notelNode,
                      labelText: "Nomor Telepon",
                      keyboardKey: TextInputType.number,
                      formKey: _formKey,
                      nextNode: entNode,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: DropdownButtonFormField(
                        focusNode: entNode,
                        value: bussinesEntity,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          errorStyle: TextStyle(color: Colors.red),
                        ),
                        items: itemDropdown.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        isDense: true,
                        onChanged: (val) {
                          setState(() {
                            bussinesEntity = val.toString();
                          });
                          FocusScope.of(context).requestFocus(contactNode);
                        },
                        validator: (val) {
                          if (val == null || val == 'Pilih Entitas Bisnis') {
                            return "Choose Bussines Entity";
                          }

                          return null;
                        },
                      ),
                    ),
                    CurrentTextFormField(
                      focusNode: contactNode,
                      labelText: "Nama Kontak",
                      keyboardKey: TextInputType.name,
                      formKey: _formKey,
                      nextNode: typeNode,
                    ),
                    CurrentTextFormField(
                      focusNode: typeNode,
                      labelText: "Tipe Bisnis",
                      keyboardKey: TextInputType.name,
                      formKey: _formKey,
                      nextNode: npwpNode,
                    ),
                    CurrentTextFormField(
                      focusNode: npwpNode,
                      labelText: "NPWP",
                      keyboardKey: TextInputType.number,
                      formKey: _formKey,
                      nextNode: nibNode,
                    ),
                    CurrentTextFormField(
                      focusNode: nibNode,
                      labelText: "NIB",
                      keyboardKey: TextInputType.name,
                      formKey: _formKey,
                      nextNode: addressNode,
                    ),
                    CurrentTextFormField(
                      focusNode: addressNode,
                      labelText: "Alamat",
                      keyboardKey: TextInputType.streetAddress,
                      formKey: _formKey,
                      nextNode: zipNode,
                    ),
                    CurrentTextFormField(
                      focusNode: zipNode,
                      labelText: "Kode Pos",
                      keyboardKey: TextInputType.number,
                      formKey: _formKey,
                      nextNode: employeeNode,
                    ),
                    CurrentTextFormField(
                      focusNode: employeeNode,
                      labelText: "Total Karyawan",
                      keyboardKey: TextInputType.number,
                      formKey: _formKey,
                      nextNode: maleNode,
                    ),
                    CurrentTextFormField(
                      focusNode: maleNode,
                      labelText: "Karyawan Laki-laki",
                      keyboardKey: TextInputType.number,
                      formKey: _formKey,
                      nextNode: femaleNode,
                    ),
                    CurrentTextFormField(
                      focusNode: femaleNode,
                      labelText: "Karyawan Perempuan",
                      keyboardKey: TextInputType.number,
                      formKey: _formKey,
                      nextNode: foreignEmployeeNode,
                    ),
                    CurrentTextFormField(
                      focusNode: foreignEmployeeNode,
                      labelText: "Karyawan Asing",
                      keyboardKey: TextInputType.number,
                      formKey: _formKey,
                      nextNode: vehicleTypeNode,
                    ),
                    CurrentTextFormField(
                      focusNode: vehicleTypeNode,
                      labelText: "Tipe Kendaraan",
                      keyboardKey: TextInputType.name,
                      formKey: _formKey,
                      nextNode: vehicleTotalNode,
                    ),
                    CurrentTextFormField(
                      focusNode: vehicleTotalNode,
                      labelText: "Total Kendaraan",
                      keyboardKey: TextInputType.number,
                      formKey: _formKey,
                      nextNode: landOwnershipNode,
                    ),
                    CurrentTextFormField(
                      focusNode: landOwnershipNode,
                      labelText: "Kepemilikan Tanah",
                      keyboardKey: TextInputType.name,
                      formKey: _formKey,
                      nextNode: null,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 50,
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Batal"),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    margin: EdgeInsets.only(right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        _formKey.currentState!.validate();
                      },
                      child: Text(
                        "Simpan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
