import 'package:flutter/material.dart';
import 'package:g_project/widgets/add_asset.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('BADMINTON ASSETS'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('/'); //nnti letak page sini
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('/'); //nnti letak page sini
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text(
              'Add Asset',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
               MaterialPageRoute(builder:(context) =>  addAssetScreen() )); //nnti letak page sini
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Provider.of<Auth>(context,listen:false).logout();
            },
          ),
        ],
      ),
    );
  }
}
