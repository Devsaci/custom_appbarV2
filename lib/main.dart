import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //98. TextSpan & Toast
  Widget myWidget() {
    return myWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Flutter Demo HomePage"),
      ),
      body: Center(child: buildFlatButton(context)),
    );
  }

  FlatButton buildFlatButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        showToast(context);
      },
      child: buildRichText(),
    );
  }

  Future<bool?> showToast(context) {
    return Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 20.0);
  }

  RichText buildRichText() {
    return RichText(
      text: const TextSpan(children: [
        TextSpan(
            text: 'Pink',
            style: TextStyle(
                color: Colors.pink, fontSize: 35, fontWeight: FontWeight.bold)),
        TextSpan(
            text: '/',
            style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: 'Amber',
            style: TextStyle(
                color: Colors.amber,
                fontSize: 35,
                fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
