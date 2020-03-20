import 'package:flutter/material.dart';
import 'package:simple_chat_application/View/ChatListPageView.dart';
import 'package:simple_chat_application/Global/Colors.dart' as myColors;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myColors.blue,
      ),
      home: ChatListPageView(),
    );
  }
}