import 'package:custom_appbar/main.dart';
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
    Data("title1", "description1 ", "images/q1.jpg", Icons.add_circle),
    Data("title2", "description2", "images/q2.jpg", Icons.add_box_outlined),
    Data("title3", "description3", "images/q3.jpg", Icons.phone_android),
    Data("title4", "description4", "images/q4.jpg", Icons.message_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/a': (ctx) => MyHomePage()},
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
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
                          Icon(
                            item.iconData,
                            size: 120,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Text(
                            item.title,
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellowAccent),
                          ),
                          Text(
                            item.description,
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellowAccent),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            Builder(
              builder: (ctx) => Align(
                alignment: Alignment(0, 0.8),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    padding: EdgeInsets.all(20),
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(ctx).pushNamed('/a');
                    },
                    child: Text(
                      "GET START",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class indicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Row(
     children: [
       buildContainer(Colors.red),
       buildContainer(Colors.red),
       buildContainer(Colors.red),
       buildContainer(Colors.red),

     ],
   );
  }

  Container buildContainer(Color color) {
    return Container(
   height: 10,
   width: 10,
   decoration: BoxDecoration(
     color: color,
     shape: BoxShape.circle
   ),
 );
  }

}
