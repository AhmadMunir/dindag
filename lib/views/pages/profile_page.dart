import 'package:dindag/bloc/blocs.dart';
import 'package:dindag/models/user.dart';
import 'package:dindag/tools/config.dart' as config;
import 'package:dindag/views/widgets/loading_state.dart';
import 'package:dindag/views/widgets/widgets.dart' as widget;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar(
        title: 'Profile',
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            if (state.message != null)
              config.showFlushbar(context, message: state.message ?? '');
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return LoadingState(
              child: SafeArea(
                child: Center(
                  child: (state.user is UnauthenticatedUser)
                      ? Container(
                          margin: const EdgeInsets.all(36),
                          child: widget.Card(
                              color: Colors.lightBlueAccent.withOpacity(0.45),
                              child: Text(
                                  'Anda belum login, untuk mengakses halaman ini diperlukan login')),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            profileCard(config.dummyImage),
                            nameCard(state.user.name ?? 'Alan Mark',
                                state.user.email ?? 'alan.mark@mark.en'),
                            SizedBox(
                              height: 20,
                            ),
                            menuCard(
                                Icon(Icons.lock_rounded),
                                'Update Data Profile',
                                'update your personal profile '),
                            menuCard(
                                Icon(
                                  Icons.help_center_rounded,
                                ),
                                'Help',
                                'need more help'),
                            menuCard(Icon(Icons.exit_to_app_rounded), 'Logout',
                                'exit or switch account', onTap: () {
                              context.read<AuthBloc>().add(SignOut());
                              config.Navigate.pop();
                            }),
                          ],
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget profileCard(String url) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(url),
        ),
      ),
    );
  }

  Widget menuCard(Widget icon, String title, String description,
      {Function()? onTap}) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
      child: widget.Card(
          color: Colors.white,
          child: ListTile(
            onTap: onTap,
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            title: Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            subtitle: Text(
              description,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            contentPadding: const EdgeInsets.all(0),
            leading: Container(
              height: 50,
              width: 50,
              child: Center(
                child: icon,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
            ),
          )),
    );
  }

  Widget nameCard(String name, String email) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 18, color: Colors.indigo[900]),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            email,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class CardBoard extends StatelessWidget {
  const CardBoard({Key? key, this.children}) : super(key: key);

  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        margin: const EdgeInsets.all(24),
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: children ?? [],
        ),
      ),
    );
  }
}
