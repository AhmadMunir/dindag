import 'package:dindag/bloc/blocs.dart';
import 'package:dindag/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart' as widget;

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  Company? company;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.appBar(title: 'Laporan'),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              BlocBuilder<CompanyBloc, CompanyState>(
                builder: (context, state) {

                  if (company == null) {
                    company = state.lists.isEmpty ? null : state.lists.first;
                  }
                  return widget.Card(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(
                          'Pilih Perusahaan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardProgress(),
                  cardProgress(),
                  cardProgress(),
                ],
              ),
              Container(),
            ],
          ),
        ));
  }

  widget.Card cardProgress() {
    return widget.Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: CircularProgressIndicator(
                color: Colors.indigo,
                strokeWidth: 10,
                backgroundColor: Colors.indigo.withOpacity(0.20),
                value: 45 / 100,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Total Nilai\nProduksi',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
