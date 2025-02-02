import 'package:cvrnet/home_page.dart';
import 'package:cvrnet/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'main.dart'; //not sure why this isn't maked as used lol
import 'credits.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Settings"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return new Center(
      child: Column(
        children: [
          Text("CVR Social App Settings"), //pointless text
          Text("CVRNet App TEGU BUILD (fork of v1.0.2)"),
          //darkmode switch
          Switch.adaptive(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(value);
              }),
          //TOS
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {},
            child: Text('Terms of Service'),
          ),
          //Text Size
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Text('Text Size'),
          ),
          //Credits page link (why is it here?)
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Credits()),
              );
            },
            child: Text('Credits'),
          )
        ],
      ),
    );
  }
}

//* This page is due for a full rework as it currently is hard to use */
