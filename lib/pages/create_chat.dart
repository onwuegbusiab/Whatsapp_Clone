import 'package:flutter/material.dart';

class CreateChat extends StatefulWidget {
  CreateChat({Key key}) : super(key: key);

  _CreateChatState createState() => _CreateChatState();
}

class _CreateChatState extends State<CreateChat> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Column(
          children: <Widget>[
            new Text("Select Contact"),
            Padding(
              padding: const EdgeInsets.only(right: 45.0),
              child: new Text(
                "100 Contacts",
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
          ),
          new Icon(Icons.more_vert),
        ],
      ),
      body: new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(1.0),
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 15,
                        child: Icon(
                          Icons.people,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      title: Text(
                        "New group",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 15,
                        child: Icon(
                          Icons.person_add,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      title: Text(
                        "New contact",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    ListTile(
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
                            color: Colors.black),
                      ),
                      subtitle: Text("I am a star"),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.biography.com/.image/t_share/MTQ3NTI2OTA4NzY5MjE2MTI4/drake_photo_by_prince_williams_wireimage_getty_479503454.jpg"),
                        radius: 15,
                      ),
                      title: Text(
                        "Smith",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text("Hey there! I am using Whatsapp."),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.rollingstone.com/wp-content/uploads/2018/09/shutterstock_9794543ar.jpg?resize=1800,1200&w=1800"),
                        radius: 15,
                      ),
                      title: Text(
                        "Sir williams",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text(
                          "programmer * Data Analyst* Financial Market..."),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.rollingstone.com/wp-content/uploads/2018/09/shutterstock_9794543ar.jpg?resize=1800,1200&w=1800"),
                        radius: 15,
                      ),
                      title: Text(
                        "Sir Fabs",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text("Way to the top!"),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.rollingstone.com/wp-content/uploads/2018/09/shutterstock_9794543ar.jpg?resize=1800,1200&w=1800"),
                        radius: 15,
                      ),
                      title: Text(
                        "Dirisujesse",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text("Emoji"),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://media.voltron.voanews.com/Drupal/01live-166/styles/sourced/s3/2019-12/AP_19206704285722.jpg?itok=GI9OOV1z"),
                        radius: 15,
                      ),
                      title: Text(
                        "Kolapo",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text("npm start"),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://media.voltron.voanews.com/Drupal/01live-166/styles/sourced/s3/2019-12/AP_19206704285722.jpg?itok=GI9OOV1z"),
                        radius: 15,
                      ),
                      title: Text(
                        "Jay",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text("tech . Music . Movies . Books . Games"),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://media.voltron.voanews.com/Drupal/01live-166/styles/sourced/s3/2019-12/AP_19206704285722.jpg?itok=GI9OOV1z"),
                        radius: 15,
                      ),
                      title: Text(
                        "Cheelz",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text("Trust the Process"),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.biography.com/.image/t_share/MTQ3NTI2OTA4NzY5MjE2MTI4/drake_photo_by_prince_williams_wireimage_getty_479503454.jpg"),
                        radius: 15,
                      ),
                      title: Text(
                        "osborn",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text("No whine me... Make god no whine you"),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.biography.com/.image/t_share/MTQ3NTI2OTA4NzY5MjE2MTI4/drake_photo_by_prince_williams_wireimage_getty_479503454.jpg"),
                        radius: 15,
                      ),
                      title: Text(
                        "Vik",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text("Inside life -- Web developer..."),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
