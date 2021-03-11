import 'package:flutter/material.dart';
import 'package:simple_chat_application/Global/Colors.dart' as MyColors;
import 'package:simple_chat_application/Global/Settings.dart' as Settings;
import 'package:simple_chat_application/Widget/ReceivedMessageWidget.dart';
import 'package:simple_chat_application/Widget/SendedMessageWidget.dart';

class ChatPageView extends StatefulWidget {
  final String username;

  const ChatPageView({
    Key key,
    this.username,
  }) : super(key: key);

  @override
  _ChatPageViewState createState() => _ChatPageViewState();
}

class _ChatPageViewState extends State<ChatPageView> {
  TextEditingController _text = new TextEditingController();
  ScrollController _scrollController = ScrollController();
  var childList = <Widget>[];

  @override
  void initState() {
    super.initState();
    childList.add(Align(
        alignment: Alignment(0, 0),
        child: Container(
          margin: const EdgeInsets.only(top: 5.0),
          height: 25,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              )),
          child: Center(
              child: Text(
            "Today",
            style: TextStyle(fontSize: 11),
          )),
        )));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: 'Hello',
        time: '21:36 PM',
        isImage: false,
      ),
    ));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: 'How are you? What are you doing?',
        time: '21:36 PM',
        isImage: false,
      ),
    ));
    childList.add(Align(
      alignment: Alignment(-1, 0),
      child: ReceivedMessageWidget(
        content: 'Hello, Mohammad.I am fine. How are you?',
        time: '22:40 PM',
        isImage: false,
      ),
    ));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content:
            'I am good. Can you do something for me? I need your help my bro.',
        time: '22:40 PM',
        isImage: false,
      ),
    ));
    childList.add(Align(
      alignment: Alignment(-1, 0),
      child: ReceivedMessageWidget(
        content: 'this is fun 😂',
        time: '22:57 PM',
        isImage: true,
        imageAddress: 'assets/images/fun.jpg',
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 65,
                    child: Container(
                      color: Settings.isDarkMode
                          ? Colors.grey[900]
                          : MyColors.blue,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.username ?? "Jimi Cooke",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(
                                "online",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 12),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: Container(
                              child: ClipRRect(
                                child: Container(
                                    child: SizedBox(
                                      child: Image.asset(
                                        "assets/images/person1.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    color: MyColors.orange),
                                borderRadius: new BorderRadius.circular(50),
                              ),
                              height: 55,
                              width: 55,
                              padding: const EdgeInsets.all(0.0),
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5.0,
                                        spreadRadius: -1,
                                        offset: Offset(0.0, 5.0))
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: Colors.black54,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/chat-background-1.jpg"),
                            fit: BoxFit.cover,
                            colorFilter: Settings.isDarkMode
                                ? ColorFilter.mode(
                                    Colors.grey[850], BlendMode.hardLight)
                                : ColorFilter.linearToSrgbGamma()),
                      ),
                      child: SingleChildScrollView(
                          controller: _scrollController,
                          // reverse: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: childList,
                          )),
                    ),
                  ),
                  Divider(height: 0, color: Colors.black26),
                  Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        maxLines: 20,
                        controller: _text,
                        decoration: InputDecoration(
                          suffixIcon: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(Icons.send),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.image),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          border: InputBorder.none,
                          hintText: "enter your message",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
