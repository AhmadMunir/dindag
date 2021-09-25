import 'package:dindag/bloc/blocs.dart' as bloc;
import 'package:dindag/models/models.dart';
import 'package:dindag/tools/config.dart';
import 'package:dindag/tools/navigate.dart';
import 'package:dindag/views/pages/main.dart';
import 'package:dindag/views/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart' as widget;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = context.watch<bloc.AuthBloc>().state.user;
    print(user);
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: PreferredSize(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: _topbar(context, user),
              ),
            ),
            if (!(user is UnauthenticatedUser))
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _cardWidget(context, title: 'Perusahaan', target: CompanyPage()),
                  _cardWidget(context, title: 'Laporan', target: ReportPage()),
                  _cardWidget(
                    context,
                    title: 'Buat Laporan',
                  ),
                ],
              ),
          ],
        ),
        preferredSize: Size(double.infinity, (user is UnauthenticatedUser) ? 130 : 280),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          color: Colors.white,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Artikel',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              child: BlocBuilder<bloc.ArticleBloc, bloc.ArticleState>(builder: (_, state) {
                return Column(
                  children: List.generate(
                    state.lists.length,
                    (index) => articleCard(state.lists[index].image!, state.lists[index].title!, 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
                  ),
                );
              }),
            ),
            // articleCard(
            //     dummyImage,
            //     "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet,",
            //     't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
            // articleCard(
            //     dummyImage,
            //     "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet,",
            //     't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
            // articleCard(
            //     dummyImage,
            //     "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet,",
            //     't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
            Text(
              'Event',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 150,
              child: BlocBuilder<bloc.EventBloc, bloc.EventState>(
                builder: (context, state) {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        state.lists.length,
                        (index) => eventCard("${state.lists[index].eventStarted!.day}", '${state.lists[index].title}'),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget eventCard(String date, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: widget.Card(
        height: 100,
        width: 100,
        child: Column(
          children: [
            Text(
              date,
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(title, style: TextStyle(fontSize: 14, color: Colors.white), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget articleCard(String image, String title, String descriptions, {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            ClipPath.shape(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), child: Image.network(image, height: 100, width: 100, fit: BoxFit.cover)),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  Text(
                    descriptions,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardWidget(BuildContext context, {String? title, Widget? target}) {
    return InkWell(
      onTap: () {
        print('pressed');
        Navigate.push(target!);
      },
      child: widget.Card(
        color: Colors.indigo[800],
        width: MediaQuery.of(context).size.width / 3.5,
        child: Column(
          //TODO: Temporary, until the image is available
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //TODO: Add Image
            Icon(
              Icons.toll_outlined,
              size: 60,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title ?? "-",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Container _topbar(BuildContext context, User user) {
    String name = (user is UnauthenticatedUser) ? 'Masuk untuk \nexplore' : 'Selamat Datang\n${user.name}';
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //TODO: Add variable for name
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          InkWell(
            onTap: (user is UnauthenticatedUser)
                ? () async {
                    User? user = await Navigator.push(context, MaterialPageRoute(builder: (_) => AuthPage()));
                    if (user != null) {
                      context.read<bloc.AuthBloc>().add(bloc.CheckSession());
                    }
                  }
                : () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/img/default/avatar.png"),
            ),
          )
        ],
      ),
    );
  }
}
