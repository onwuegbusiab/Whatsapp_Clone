import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: ListView(
          children: <Widget>[
//            new Divider(
//              height: 10.0,
//            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Icon(
                    Icons.lock,
                    size: 25.0,
                    color: Colors.teal,
                  ),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Privacy",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Icon(
                    Icons.security,
                    size: 30.0,
                    color: Colors.teal,
                  ),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Security",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Icon(
                    Icons.vpn_lock,
                    size: 30.0,
                    color: Colors.teal,
                  ),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Two-step verification",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Icon(
                    Icons.add_to_home_screen,
                    size: 30.0,
                    color: Colors.teal,
                  ),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Change number",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Icon(
                    Icons.library_books,
                    size: 30.0,
                    color: Colors.teal,
                  ),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Request account info",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Icon(
                    Icons.delete,
                    size: 30.0,
                    color: Colors.teal,
                  ),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Delete my account",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
      )
    );
  }
}
