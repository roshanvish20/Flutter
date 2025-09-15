import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Layout Bar"))),
        body: Align(
  alignment: Alignment.bottomRight, // Direct bottom-right alignment
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text("Left"),    // goes to left edge
    Text("Center"),  // goes to center
    Text("Right"),   // goes to right edge
  ],
)

),


      ),
    );
  }
}


/*

Column(
  mainAxisAlignment: MainAxisAlignment.end, // Push children to bottom
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.end, // Push to right
      children: [
        Text("One"),
        Text("Two"),
      ],
    ),
  ],
),


Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Red Color",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            
      
          ],
        ),

Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            
           Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 100, top: 300),
              child: Container(color: Colors.red, height: 100,))),
            
            
            Expanded(child: Container(color: Colors.blue, height: 100,)),
            Expanded(child: Container(color: Colors.green, height: 100,))
          ],
        )

Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Red COlOr",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(height: 20),
            Text(
              "Blue COlOr",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              "Green COlOr",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 20),
          ],
        ),
 */

/*
mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home, size: 17, color: Colors.red, ),
            SizedBox(height: 13,),
            Icon(Icons.search, size: 17, color: Colors.blue),
            SizedBox(height: 13,),
            Icon(Icons.settings, size: 17, color: Colors.green),
          ],
 */