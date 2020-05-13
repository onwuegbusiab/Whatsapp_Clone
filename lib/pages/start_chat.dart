import 'package:flutter/material.dart';

class StartChat extends StatefulWidget {
  StartChat({Key key}) : super(key: key);

  _StartChatState createState() => _StartChatState();
}



class _StartChatState extends State<StartChat> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://media4.s-nbcnews.com/j/newscms/2020_06/3215496/200204-nicki-minaj-mn-1006_d381488be415bbe4886afabe6897cb59.fit-2000w.jpg"),
                  radius: 15,
                ),
                title: Text(
                  "My Favour",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                subtitle: Text(
                  "I am a star",
                  style: TextStyle(color: Colors.white60),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.videocam),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
          ),
          new Icon(Icons.call),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
          ),
          new Icon(Icons.more_vert),
        ],
      ),
      body: new Stack(
      children: <Widget>[
        Container(
          height: 70,
          color: Colors.red,
        ),
        Positioned(
          top: 10.0,
          left: 50.0,
          child: Container(
            alignment: Alignment.centerLeft,
            height: 50,
            width: MediaQuery.of(context).size.width * 0.65,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration.collapsed(
                  hintText: "Type a message",
                  hintStyle: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 10.0,
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                print("TAP");
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                child: Text(
                  "Send",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 15.0,
          bottom: 25,
          child: Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                print("TAP");
              },
              child: Container(
                child: Icon(Icons.attach_file),
                width: 30,
                height: 20,
              ),
            ),
          ),
        )
      ],
    ),
      );
  }
}
