import 'package:flutter/material.dart';

//Model Data class
class Data {
  late final String title;
  late final String description;
  late final String imageUrl;
  late final IconData iconData;

  Data(
    this.title,
    this.description,
    this.imageUrl,
    this.iconData,
  );
}

class PView extends StatefulWidget {
  const PView({Key? key}) : super(key: key);

  @override
  _PViewState createState() => _PViewState();
}

class _PViewState extends State<PView> {
  final List<Data> myData = [
    Data("title1", "description title1", "images/q1.jpg", Icons.add),
    Data("title2", "description title2", "images/q2.jpg", Icons.arrow_back),
    Data("title3", "description title3", "images/q3.jpg", Icons.phone_android),
    Data("title4", "description title4", "images/q4.jpg",
        Icons.message_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          children: myData
              .map((item) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(item.imageUrl),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
