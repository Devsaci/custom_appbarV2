import 'package:flutter/material.dart';

//Model Data class
class Data {
  final String title;
  final String description;
  final String imageUrl;
  final IconData iconData;

  Data(
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.iconData,
  );
}

class PView extends StatefulWidget {
  const PView({Key? key}) : super(key: key);



  @override
  _PViewState createState() => _PViewState();
}



class _PViewState extends State<PView> {

  final List<Data> myData = [
    Data("title1", "description title1", "images/q1.jpg",  Icons.add),
    Data("title2", "description title2", "images/q2.jpg",  Icons.arrow_back),
    Data("title3", "description title3", "images/q3.jpg",  Icons.phone_android),
    Data("title4", "description title4", "images/q4.jpg",  Icons.message_outlined),

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          children: [
            Text(
              "Page 1",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "Page 2",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "Page 3",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
