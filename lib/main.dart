import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

  late int _currentIndex = 0;
  List imgList = [
    "images/s1.jpg",
    "images/s2.jpg",
    "images/s3.jpg",
  ];

  int _radioValue = 0;
  String? result;
  Color? resultColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              "Guess the answer :2+2 =?",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            buildRow(3, "Error", Colors.red),
            buildRow(4, "Correct", Colors.green),
            buildRow(5, "Error", Colors.red),
          ],
        ),
      ),
    );
  }

  myDialog() {
    var ad = AlertDialog(
        content: Container(
          height: 100,
          child: Column(
              children: [
                Text("$result",style: TextStyle(color: resultColor),),
                Divider(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Right Answer = 4"),
                ),

              ],

          ),
        ),

    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ad;
        });
  }

  Row buildRow(int value, String result, Color resultColor) {
    return Row(
      children: [
        Radio(
          value: value,
          onChanged: (value) {
            setState(() {
              _radioValue == value;
              result = result;
              resultColor = resultColor;
              myDialog();
            });
          },
          groupValue: _radioValue,
        ),
        Text("$value"),
      ],
    );
  }

  ListView buildCarousel() {
    return ListView(
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        const Text("Slider 1 : Initial Page Index 0\n\n",
            textAlign: TextAlign.center),
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            autoPlayInterval: const Duration(seconds: 2),
            scrollDirection: Axis.vertical,
            autoPlay: true,
            enlargeCenterPage: true,
            height: 250,
            initialPage: 0,
          ),
          items: imgList.map((imageUrl) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildContainerCircular(0),
            buildContainerCircular(1),
            buildContainerCircular(2),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const Text("Slider 2 : Initial Page Index 1\n\n",
            textAlign: TextAlign.center),
        CarouselSlider.builder(
            itemCount: imgList.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                width: double.infinity,
                // margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  imgList[index],
                  fit: BoxFit.fill,
                ),
              );
            },
            options: CarouselOptions(
              autoPlayInterval: const Duration(seconds: 1),
              autoPlay: true,
              enlargeCenterPage: true,
              height: 250,
              initialPage: 0,
            )),
      ],
    );
  }

  Container buildContainerCircular(index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: _currentIndex == index ? Colors.yellow : Colors.red,
          shape: BoxShape.circle),
      width: 40,
      height: 40,
    );
  }

  Column SelectableTextPropertes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SelectableText(
          "This is A Clipped Text ",
          showCursor: true,
          cursorHeight: 30,
          cursorWidth: 10,
          style: TextStyle(fontSize: 15),
          toolbarOptions:
              ToolbarOptions(copy: true, selectAll: true, paste: true),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 200,
          height: 50,
          color: Colors.green,
          child: const Text(
            "This is A Clipped Text This is A Clipped Text This is A Clipped Text ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: 200,
          height: 50,
          color: Colors.green,
          child: const Text(
            "This is A Clipped Text This is A Clipped Text This is A Clipped Text ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: 200,
          height: 50,
          color: Colors.green,
          child: const Text(
            "This is A Clipped Text This is A Clipped Text This is A Clipped Text ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: 200,
          height: 50,
          color: Colors.green,
          child: const Text(
            "This is A Clipped Text This is A Clipped Text This is A Clipped Text ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            overflow: TextOverflow.visible,
            softWrap: false,
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  RaisedButton buildRaisedButton() {
    return RaisedButton(
      child: const Text(" Show Flushbar"),
      onPressed: () {
        // buildFlushBar(context);
      },
    );
  }

  void buildFlushBar(BuildContext context) {
    Flushbar(
      title: "title",
      message: "message",
      messageText: const Text(
        "messageText",
        style: TextStyle(color: Colors.black),
      ),
      leftBarIndicatorColor: Colors.red,
      backgroundColor: Colors.amber,
      icon: const Icon(
        Icons.account_circle,
        size: 50,
      ),
      duration: const Duration(seconds: 3),
      mainButton: FlatButton(
          onPressed: () {
            setState(() {
              //Close FlushBar
              Navigator.of(context).pop();
            });
          },
          child: const Text("Close")),
      flushbarPosition: FlushbarPosition.BOTTOM,
    ).show(context);
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
