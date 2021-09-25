import 'package:dindag/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dindag/bloc/blocs.dart' as bloc;

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = context.watch<bloc.AuthBloc>().state.user;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context),
            _profile(context, user),
            SizedBox(
              height: 20,
            ),
            _profileMenu(context)
          ],
        ),
      ),
    );
  }

  Container _profileMenu(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Card(
            shadowColor: Colors.grey,
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text(
                "Setting",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ),
          ),
          Card(
            shadowColor: Colors.grey,
            child: ListTile(
              leading: Icon(
                Icons.credit_card,
                color: Colors.black,
              ),
              title: Text(
                "Billing Details",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ),
          ),
          Card(
            shadowColor: Colors.grey,
            child: ListTile(
              leading: Icon(
                Icons.supervised_user_circle,
                color: Colors.black,
              ),
              title: Text(
                "User Management",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.black,
            height: 5,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            shadowColor: Colors.grey,
            child: ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.black,
              ),
              title: Text(
                "Information",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ),
          ),
          Card(
            shadowColor: Colors.grey,
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                "Log out",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _topBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
              size: 30,
            ),
          ),
          Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.more_horiz,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
    );
  }

  Container _profile(BuildContext context, User user) {
    String name = (user is UnauthenticatedUser) ? 'Masuk untuk \nexplore' : '${user.name}';
    return Container(
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/img/default/avatar.png"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
