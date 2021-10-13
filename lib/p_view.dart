import 'package:flutter/material.dart';

class PView extends StatefulWidget {
  const PView({Key? key}) : super(key: key);

  @override
  _PViewState createState() => _PViewState();
}

class _PViewState extends State<PView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          children: [
            Text("Page 1", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text("Page 2", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text("Page 3", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
