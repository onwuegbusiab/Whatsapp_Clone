import 'package:flutter/material.dart';
import 'pages/call_screen.dart';
import 'pages/camera_screen.dart';
import 'pages/chat_screen.dart';
import 'pages/status_screen.dart';
import 'pages/create_chat.dart';
import 'package:flutter/cupertino.dart';
import 'pages/account.dart';

enum PageEnum {
  NewGroup,
  NewBroadCast,
  WhatsAppWeb,
  StarredMessages,
  Settings,
  StatusPrivacy,
}

class WhatsAppHome extends StatefulWidget {
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  ValueNotifier<int> currentIndex = ValueNotifier(1);

  _onSelect(PageEnum value) {
    switch (value) {
      case PageEnum.NewGroup:
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (BuildContext context) => NewGroup()));
        break;
      case PageEnum.NewBroadCast:
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => NewBroadCast()));
        break;
      case PageEnum.WhatsAppWeb:
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => WhatsAppWeb()));
        break;
      case PageEnum.StarredMessages:
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => StarredMessages()));
        break;
      case PageEnum.Settings:
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (BuildContext context) => Settings()));
        break;
      case PageEnum.StatusPrivacy:
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => StatusPrivacy()));
        break;
      default:
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (BuildContext context) => NewGroup()));
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      //setState(() {
      print(_tabController.index);
      currentIndex.value = _tabController.index;
      // });
//      if (_tabController.index == 1) {
//        showFab = true;
//      } else {
//        showFab = false;
//      }
      //setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("WhatsApp"),
          elevation: 0.7,
          bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.camera_alt)),
              new Tab(text: "CHATS"),
              new Tab(
                text: "STATUS",
              ),
              new Tab(
                text: "CALLS",
              ),
            ],
          ),
          actions: <Widget>[
            new Icon(Icons.search),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
            ),
            // overflow menu
            Center(
                child: ValueListenableBuilder(
              valueListenable: currentIndex,
              builder: (context, int val, _) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (val == 1)
                      PopupMenuButton<PageEnum>(
                        onSelected: _onSelect,
                        child: Icon(Icons.more_vert),
                        itemBuilder: (context) => <PopupMenuEntry<PageEnum>>[
                          PopupMenuItem<PageEnum>(
                            value: PageEnum.NewGroup,
                            child: Text("New group"),
                          ),
                          PopupMenuItem<PageEnum>(
                            value: PageEnum.NewBroadCast,
                            child: Text("New broadcast"),
                          ),
                          PopupMenuItem<PageEnum>(
                            value: PageEnum.WhatsAppWeb,
                            child: Text("WhatsApp Web"),
                          ),
                          PopupMenuItem<PageEnum>(
                            value: PageEnum.StarredMessages,
                            child: Text("Starred messages"),
                          ),
                          PopupMenuItem<PageEnum>(
                            value: PageEnum.Settings,
                            child: Text("Settings"),
                          ),
                        ],
                      ),
                    if (val == 2)
                      PopupMenuButton<PageEnum>(
                        onSelected: _onSelect,
                        child: Icon(Icons.more_vert),
                        itemBuilder: (context) => <PopupMenuEntry<PageEnum>>[
                          PopupMenuItem<PageEnum>(
                            value: PageEnum.StatusPrivacy,
                            child: Text("Status privacy"),
                          ),
                          PopupMenuItem<PageEnum>(
                            value: PageEnum.Settings,
                            child: Text("Settings"),
                          ),
                        ],
                      ),
                    if (val == 3)
                      PopupMenuButton<PageEnum>(
                        onSelected: _onSelect,
                        child: Icon(Icons.more_vert),
                        itemBuilder: (context) => <PopupMenuEntry<PageEnum>>[
                          PopupMenuItem<PageEnum>(
                            value: PageEnum.Settings,
                            child: Text("Settings"),
                          ),
                        ],
                      ),
                  ],
                );
              },
            ))
          ],
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new CameraScreen(),
            new ChatScreen(),
            new StatusScreen(),
            new CallsScreen(),
          ],
        ),
        floatingActionButton: ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, int val, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (val == 1)
                  FloatingActionButton(
                    heroTag: 'tab',
                    backgroundColor: Theme.of(context).accentColor,
                    child: new Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateChat())),
                  ),
                SizedBox(height: 10),
                if (val == 2)
                  FloatingActionButton(
                    heroTag: 'tab1',
                    backgroundColor: Theme.of(context).accentColor,
                    child: new Icon(
                      Icons.create,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateChat())),
                  ),
                SizedBox(height: 10),
                if (val == 3)
                  FloatingActionButton(
                    heroTag: 'tab2',
                    backgroundColor: Theme.of(context).accentColor,
                    child: new Icon(
                      Icons.add_call,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateChat())),
                  ),
                if (val == 0) SizedBox()
              ],
            );
          },
        ));
  }
}

class NewGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Group"),
      ),
    );
  }
}

class NewBroadCast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Broadcast"),
      ),
    );
  }
}

class WhatsAppWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp Web"),
      ),
    );
  }
}

class StarredMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Starred Messages"),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: ListTile.divideTiles(
              //          <-- ListTile.divideTiles
              context: context,
              tiles: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ListTile(
                    leading: new CircleAvatar(
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.grey,
                      backgroundImage: new NetworkImage(
                          "https://pbs.twimg.com/profile_images/1187814172307800064/MhnwJbxw_400x400.jpg"),
                      radius: 30,
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "Buchi",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: new Text(
                            "Thanks to Flutter Lagos",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
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
                        Icons.lock,
                        size: 25.0,
                        color: Colors.teal,
                      ),
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "Account",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: new Text(
                            "Privacy, security, change number",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Account())),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: new Icon(
                        Icons.chat,
                        size: 30.0,
                        color: Colors.teal,
                      ),
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "Chats",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: new Text(
                            "Themes, wallpapers, chat history",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
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
                        Icons.notifications,
                        size: 30.0,
                        color: Colors.teal,
                      ),
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "Notifications",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: new Text(
                            "Message, group & call tones",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
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
                        Icons.donut_large,
                        size: 30.0,
                        color: Colors.teal,
                      ),
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "Data and storage usage",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: new Text(
                            "Network usage, auto-download",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
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
                        Icons.help_outline,
                        size: 30.0,
                        color: Colors.teal,
                      ),
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "Help",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: new Text(
                            "FAQ, contact us, privacy policy",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
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
                        Icons.group,
                        size: 30.0,
                        color: Colors.teal,
                      ),
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "Invite a friend",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ]).toList(),
        ));
  }
}

class StatusPrivacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status Privacy"),
      ),
    );
  }
}
