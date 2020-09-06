import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/img/hppy_farmer.jpeg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: const Text('Profile'),
            //onTap: () => {Navigator.of(context).pop()},
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Settings'),
            //onTap: () => {Navigator.of(context).pop()},
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: const Text('Feedback'),
            //onTap: () => {Navigator.of(context).pop()},
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            //onTap: () => {Navigator.of(context).pop()},
            onTap: null,
          ),
        ],
      ),
    );
  }
}
