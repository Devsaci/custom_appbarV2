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
      debugShowCheckedModeBanner: false,
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
  // final GlobalKey<ScaffoldState> _x = GlobalKey<ScaffoldState>();

  String str = "UI Flutter Custom Bar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _x,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.teal,
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.pink, Colors.deepPurple]),
          ),
        ),
        centerTitle: true,
        title: Text(
          str,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text(" Show SnackBar "),
          onPressed: () {
            setState(() {
              str = '';
            });
            // final sBar = SnackBar(content: Text("SnackBar"));
            // _x.currentState.showSnackBar(sBar);
            buildSnackBar(context);
          },
        ),
      ),
    );
  }

  void buildSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
            label: "Undo",
            textColor: Colors.black,
            onPressed: () {
              setState(() {
                str = "UI Flutter Custom Bar";
              });
            }),
        duration: const Duration(seconds: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.red,
        // margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        content: Text('A SnackBar has been shown.'),
      ),
    );
  }

  void builddDialog(BuildContext context) {
    final AlertDialog alert = AlertDialog(
      backgroundColor: Colors.cyan,
      title: Text("Title Alert"),
      content: Container(
          height: 200,
          child: Column(
            children: [
              const Divider(
                thickness: 6,
                color: Colors.deepPurple,
              ),
              const Text("ALERT"),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.pink,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.build),
                      Text(
                        "Build Dialog",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
    showDialog(
        barrierColor: Colors.red.withOpacity(0.5),
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
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
