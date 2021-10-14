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
    Data("title1", "description1 ", "images/q1.jpg", Icons.add),
    Data("title2", "description2", "images/q2.jpg", Icons.arrow_back),
    Data("title3", "description3", "images/q3.jpg", Icons.phone_android),
    Data("title4", "description4", "images/q4.jpg",
        Icons.message_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          children: myData
              .map(
                (item) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage(item.imageUrl),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.iconData,size: 120,color: Colors.white,),
                      Text(item.title,style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold, color: Colors.yellowAccent ),),
                      Text(item.description,style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold, color: Colors.yellowAccent ),),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
