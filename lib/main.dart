import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MyaApp",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: 
         Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue.shade300, Colors.redAccent.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )),
          child: 
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadowColor: Colors.blueAccent.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        "This is Firs tMy App",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Image(image: AssetImage('assets/saitama.jpg')),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical:10 )
                          ), child: Text("Like", style: TextStyle(color: Colors.white),)),
                         ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical:10 )
                          ), child: Text("Subscribe", style: TextStyle(color: Colors.white),)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          
        ),
      
    );
  }
}
