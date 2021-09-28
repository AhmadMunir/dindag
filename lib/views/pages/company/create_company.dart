import 'package:dindag/views/pages/main.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../widgets/widgets.dart' as widget;

class CreateCompany extends StatefulWidget {
  const CreateCompany({Key? key}) : super(key: key);

  @override
  _CreateCompanyState createState() => _CreateCompanyState();
}

class _CreateCompanyState extends State<CreateCompany> {
  final _pageController = PageController();

  int initialPage = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (initialPage == 0) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('Apakah anda ingin keluar?'),
                  content: Text('tulisan anda akan dihapus'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Batal')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('Ya')),
                  ],
                );
              });
        } else if (initialPage > 0) {
          _pageController.jumpToPage(initialPage - 1);
        }
        return false;
      },
      child: Scaffold(
        appBar: widget.appBar(
          title: 'Tambah Perusahaan',
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: CurrentButton(
              onTap: () {
                if (initialPage >= 0) {
                  _pageController.jumpToPage(initialPage + 1);
                }
              },
              title: Text('Berikutnya')),
        ),
        body: PageView(
          onPageChanged: (int page) {
            setState(() {
              initialPage = page;
            });
          },
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            _companyDetailForm(),
            _companyAddress(),
          ],
        ),
      ),
    );
  }

  ListView _companyDetailForm() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        widget.CurrentTextField(
          hint: 'Nama Perusahaan',
          icon: Icons.storefront_outlined,
        ),
        widget.CurrentTextField(
          hint: 'Bentuk Badan Usaha',
          icon: Icons.credit_card,
        ),
        widget.CurrentTextField(
          hint: 'Jenis Usaha',
          icon: Icons.store_mall_directory_outlined,
        ),
        widget.CurrentTextField(
          hint: 'NPWP',
          icon: Icons.credit_card,
        ),
        widget.CurrentTextField(
          hint: 'NIB',
          icon: Icons.credit_card,
        ),
        widget.CurrentTextField(
          hint: 'Jumlah Pekerja Laki-laki',
          icon: Icons.male,
        ),
        widget.CurrentTextField(
            hint: 'Jumlah Pekerja Perempuan', icon: Icons.female),
        widget.CurrentTextField(
          hint: 'Jumlah Pekerja Asing',
          icon: Icons.person_rounded,
        ),
        widget.CurrentTextField(
          hint: 'Jumlah Kendaraan',
          icon: MdiIcons.car2Plus,
        ),
        widget.CurrentTextField(hint: 'Jenis Kendaraan', icon: MdiIcons.car),
        widget.CurrentTextField(
          hint: 'Kepemilikan Lahan',
          icon: MdiIcons.homeCircleOutline,
        ),
      ],
    );
  }

  ListView _companyAddress() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        widget.CurrentTextField(
          hint: 'Nama Perusahaan',
          icon: Icons.storefront_outlined,
        ),
        widget.CurrentTextField(
          hint: 'Bentuk Badan Usaha',
          icon: Icons.credit_card,
        ),
        widget.CurrentTextField(
          hint: 'Jenis Usaha',
          icon: Icons.store_mall_directory_outlined,
        ),
        widget.CurrentTextField(
          hint: 'NPWP',
          icon: Icons.credit_card,
        ),
        widget.CurrentTextField(
          hint: 'NIB',
          icon: Icons.credit_card,
        ),
        widget.CurrentTextField(
          hint: 'Jumlah Pekerja Laki-laki',
          icon: Icons.male,
        ),
        widget.CurrentTextField(
            hint: 'Jumlah Pekerja Perempuan', icon: Icons.female),
        widget.CurrentTextField(
          hint: 'Jumlah Pekerja Asing',
          icon: Icons.person_rounded,
        ),
        widget.CurrentTextField(
          hint: 'Jumlah Kendaraan',
          icon: MdiIcons.car2Plus,
        ),
        widget.CurrentTextField(hint: 'Jenis Kendaraan', icon: MdiIcons.car),
        widget.CurrentTextField(
          hint: 'Kepemilikan Lahan',
          icon: MdiIcons.homeCircleOutline,
        ),
      ],
    );
  }
}
