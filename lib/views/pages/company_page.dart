import 'package:dindag/bloc/blocs.dart';
import 'package:dindag/models/models.dart';
import 'package:dindag/views/pages/company/create_company.dart';
import 'package:dindag/views/pages/main.dart';
import 'package:dindag/views/widgets/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart' as widget;
import '../../tools/config.dart' as config;

class CompanyPage extends StatelessWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.appBar(title: 'Perusahaan'),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(20),
          child: CurrentButton(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CreateCompany()));
            },
            title: Text('Tambah Perusahaan'),
          ),
        ),
        body: BlocListener<CompanyBloc, CompanyState>(
          listener: (context, state) {
            if (state is CompanyError) {
              print(state.message);
              config.showFlushbar(context, message: state.message);
            }
          },
          child: BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, state) {
              return LoadingState(
                  child: state.lists.isEmpty
                      ? EmptyPage('Perusahaanmu', context)
                      : ListView(
                          padding: const EdgeInsets.all(20),
                          children: [
                            ...List.generate(
                              state.lists.length,
                              (index) => companyCard(state.lists[index]),
                            ),
                          ],
                        ));
            },
          ),
        ));
  }

  Widget companyCard(Company company) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: widget.Card(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company.name!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text("${company.contactPhone!} - ${company.contactName!}"),
                Text(
                    "${company.address == null ? '-' : company.address!.city!}"),
              ],
            )),
      ),
    );
  }
}
