import 'package:chat_screen_ui/model/chat_model.dart';
//import 'package:chat_screen_ui/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'chatMessage.dart';

enum MessageEnum {
  ViewContact,
  Media,
  Search,
  MuteNotifications,
  Wallpaper,
  More,
  share,
  edit,
  viewAddressBook,
  verifySecurity
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.isMe});
  final String text;
  final isMe;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Bubble(
            message: text,
            time: DateTime.now(),
            delivered: true,
            isMe: isMe,
          ),
        ],
      ),
    );
  }
}

class MessageScreen extends StatefulWidget {
  // Use the constructor of this class to pass the data of the person you are chatting with
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  List<ChatMessageModel> chatResponse = List<ChatMessageModel>();
  var chatMessageRecieved;
  String firstName, lastName, token;
  int userId;
  bool noTextDontSend = false;
  String lastSelectedValue;
  // List _receivedMessageList;

  List<dynamic> clientChatHistory = [];
  List<dynamic> myChatHistory = [];
  //popUpMenu
  bool showSecondPop = false;
  GlobalKey _popKey = new GlobalKey();

  onSelect(MessageEnum value) {
    switch (value) {
      case MessageEnum.ViewContact:
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => ViewContact()));
        break;
      case MessageEnum.Media:
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (BuildContext context) => Media()));
        break;
      case MessageEnum.Search:
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (BuildContext context) => Search()));
        break;
      case MessageEnum.MuteNotifications:
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => MuteNotifications()));
        break;
      case MessageEnum.Wallpaper:
      default:
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (BuildContext context) => Wallpaper()));
        break;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void _handleSubmitted(String text) async {
    _textController.clear();
    if (text.isEmpty) return;

    ChatMessage message = ChatMessage(
      text: text,
      isMe: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  // For handling Client message
  void clientChatMessage(String clientMessages) {
    ChatMessage message = ChatMessage(
      text: clientMessages,
      isMe: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildTextComposer() {
    return Stack(
      children: <Widget>[
        Container(
          height: 70,
          color: Color(0xFFEDEDED),
          // color: Colors.red,
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: Container(
            alignment: Alignment.centerLeft,
            height: 50,
            width: MediaQuery.of(context).size.width * 0.82,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  suffixIcon: Container(
                    width: 67,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 0),
                          width: 20,
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              selectCamera();
                            },
                            child: Container(
                              child: IconButton(
                                padding: EdgeInsets.only(right: 25),
                                iconSize: 25,
                                icon: Icon(Icons.attach_file),
                                onPressed: () {
                                  selectCamera();
                                },
                              ),
                              width: 30,
                              height: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          width: 20,
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              cameraImage();
                            },
                            child: Container(
                              child: IconButton(
                                padding: EdgeInsets.only(right: 10),
                                iconSize: 25,
                                icon: Icon(Icons.camera_alt),
                                onPressed: () {
                                  cameraImage();
                                },
                              ),
                              width: 30,
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  border: InputBorder.none,
                  icon: Icon(Icons.mood),
                  hintText: "Type a message",
                  //hintStyle: textGreyBlack,
                  hintStyle: TextStyle(fontSize: 20),
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
                _handleSubmitted(_textController.text);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: new Icon(
                  Icons.keyboard_voice,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        //automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Buchi"),
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
          PopupMenuButton<MessageEnum>(
              key: _popKey,
              onSelected: onSelect,
              child: Icon(Icons.more_vert),
              itemBuilder: (context) => showSecondPop == true
                  ? secondPop(context)
                  : firstPop(context)),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.2,
              child: GestureDetector(
                onHorizontalDragDown: (_) {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Column(children: <Widget>[
                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length,
                    ),
                  ),
                  Divider(height: 1.0),
                  _buildTextComposer(),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PopupMenuEntry<MessageEnum>> firstPop(BuildContext context) {
    return <PopupMenuEntry<MessageEnum>>[
      PopupMenuItem<MessageEnum>(
        value: MessageEnum.ViewContact,
        child: Text("View contact"),
      ),
      PopupMenuItem<MessageEnum>(
        value: MessageEnum.Media,
        child: Text("Media"),
      ),
      PopupMenuItem<MessageEnum>(
        value: MessageEnum.Search,
        child: Text("Search"),
      ),
      PopupMenuItem<MessageEnum>(
        value: MessageEnum.MuteNotifications,
        child: Text("Mute notifications"),
      ),
      PopupMenuItem<MessageEnum>(
          value: MessageEnum.More,
          child: ListTile(
              leading: Text("More"),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade500,
              ),
              onTap: () {
                Navigator.of(context).pop();
                setState(() => showSecondPop = true);
                dynamic state = _popKey.currentState;
                state.showButtonMenu();
                setState(() => showSecondPop = false);
              })),
    ];
  }

  List<PopupMenuEntry<MessageEnum>> secondPop(BuildContext context) {
    return <PopupMenuEntry<MessageEnum>>[
      PopupMenuItem<MessageEnum>(
        value: MessageEnum.ViewContact,
        child: Text("Report"),
      ),
      PopupMenuItem<MessageEnum>(
        value: MessageEnum.Media,
        child: Text("Block"),
      ),
      PopupMenuItem<MessageEnum>(
        value: MessageEnum.Search,
        child: Text("Clear chat"),
      ),
      PopupMenuItem<MessageEnum>(
        value: MessageEnum.Search,
        child: Text("Export chat"),
      ),
      PopupMenuItem<MessageEnum>(
        value: MessageEnum.Search,
        child: Text("Add shortcut"),
      ),
    ];
  }

  Future getImageLibrary() async {
    try {
      var gallery = await ImagePicker.pickImage(
          source: ImageSource.gallery, maxWidth: 700);
      if (gallery == null) return;
      setState(() {
        // _image = gallery;
      });
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

  Future cameraImage() async {
    try {
      var image = await ImagePicker.pickImage(
          source: ImageSource.camera, maxWidth: 700);
      if (image == null) return;
      print(image);
      setState(() {
        // _image = image;
      });
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

  void showDemoActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        setState(() {
          //lastSelectedValue = value;
        });
      }
    });
  }

  selectCamera() {
    showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: const Text(''),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('Snap and share'),
            onPressed: () {
              Navigator.pop(context, 'Snap and share');
              cameraImage();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Upload from library'),
            onPressed: () {
              Navigator.pop(context, 'Upload from library');
              getImageLibrary();
            },
          ),
        ],
      ),
    );
  }

  camera() {
    showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: const Text(''),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('Snap and share'),
            onPressed: () {
              Navigator.pop(context, 'Snap and share');
              cameraImage();
            },
          ),
        ],
      ),
    );
  }
}

class ViewContact extends StatefulWidget {
  @override
  _ViewContactState createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            title: Padding(
//              padding: const EdgeInsets.only(right: 20.0),
//              child: Text("Mosco"),
//            ),
            actions: <Widget>[
              PopupMenuButton<MessageEnum>(
                  itemBuilder: (context) => <PopupMenuEntry<MessageEnum>>[
                        PopupMenuItem<MessageEnum>(
                          value: MessageEnum.share,
                          child: Text("Share"),
                        ),
                        PopupMenuItem<MessageEnum>(
                          value: MessageEnum.edit,
                          child: Text("Edit"),
                        ),
                        PopupMenuItem<MessageEnum>(
                          value: MessageEnum.viewAddressBook,
                          child: Text("View in address book"),
                        ),
                        PopupMenuItem<MessageEnum>(
                          value: MessageEnum.verifySecurity,
                          child: Text("Verify security code"),
                        ),
                      ]),
//              IconButton(
//                icon: Icon(Icons.more_vert),
//                //tooltip: 'Open shopping cart',
//                onPressed: () {
//                  // handle the press
//                },
//              ),
            ],
            // Allows the user to reveal the app bar if they begin scrolling back
            // up the list of items.
            // floating: true,
            //pinned: true,
            floating: true, pinned: true, snap: false,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0),
                child: Text('Mosco'),
              ),
              background: Image.network(
                "https://static.billboard.com/files/media/Nicki-Minaj-press-photo-2020-billboard-1548-1024x677.jpg",
                fit: BoxFit.cover,
                height: 400,
              ),
            ),
            // Make the initial height of the SliverAppBar larger than normal.
            expandedHeight: 300,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.grey[300],
                height: 5,
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Media, links, and docs',
                          style: TextStyle(color: Colors.teal)),
                      Padding(
                        padding: const EdgeInsets.only(left: 160.0),
                        child: Text('20',
                            style: TextStyle(color: Colors.grey.shade500)),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey.shade500,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 0.0),
                  height: 80.0,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Image.network(
                            "https://www.essence.com/wp-content/uploads/2020/02/GettyImages-1193647726-1.jpg",
                            height: 120,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Image.network(
                            "https://static01.nyt.com/images/2018/08/23/arts/23nicki/merlin_142597938_525ffcc1-7132-4623-8e84-f8a65728e3bd-superJumbo.jpg",
                            height: 120,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Image.network(
                            "https://i.hurimg.com/i/hdn/75/0x0/5d25a4b4c03c0e293c96aa02.jpg",
                            height: 120,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Image.network(
                            "https://cdn.vox-cdn.com/thumbor/Vi_ffE1fh-pXW95bWNpY2ax1X3s=/0x0:2768x1845/1200x800/filters:focal(1056x247:1498x689)/cdn.vox-cdn.com/uploads/chorus_image/image/60959443/nicki_minaj_spotify_getty_ringer.0.jpg",
                            height: 120,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/4/45/Nicki_Minaj_MTV_VMAs.jpg",
                            height: 100,
                            width: 120,
                          ),
                        ),
                      ])),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Text('Mute notifications'),
                    Padding(
                      padding: const EdgeInsets.only(left: 180.0),
                      child: Switch(
                        value: isSwitched,
                        onChanged: (bool value) {
                          setState(
                            () {
                              isSwitched = value;
                              // print(isSwitched);
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              new Divider(
                height: 20.0,
              ),
              ListTile(
                title: Text('Custom notifications'),
              ),
              new Divider(
                height: 20.0,
              ),
              ListTile(
                title: Text('Media visibility'),
              ),
              new Divider(
                height: 20.0,
              ),
              ListTile(
                title: Text('Encryption'),
                subtitle: Row(
                  children: <Widget>[
                    Text(
                        'Messages to this chat and calls are secured \n with end-to-end encryption. Tap to verify.'),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Icon(
                        Icons.lock,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[300],
                height: 15,
              ),
              ListTile(
                title: Text(
                  'Phone number',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Text(
                      '+234 816 439 7947',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0, right: 20),
                      child: Icon(Icons.chat, color: Colors.teal),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.call, color: Colors.teal),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.videocam, color: Colors.teal),
                    ),
                  ],
                ),
                subtitle: Text("Mobile"),
              ),
              Container(
                color: Colors.grey[300],
                height: 12,
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.block,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text('Block',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[300],
                height: 12,
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.thumb_down,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text('Report contact',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[300],
                height: 30,
              ),
            ]
                //childCount: 1000,
                ),
          ),
        ],
      ),
    );
  }
}

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Media"),
      ),
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
    );
  }
}

class MuteNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mute Notifications"),
      ),
    );
  }
}

class Wallpaper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpaper"),
      ),
    );
  }
}
