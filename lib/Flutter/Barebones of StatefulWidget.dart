/*
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
 State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello"),

        ),
        body: Column(
          children: [
            Text("Nirmayiii"),
            Text("Roshan"),
          ],
        ),
      )
    );
  }
}
*/


/*


### 🔹 Workflow of a StatefulWidget

When you run your code:

#1. main() starts your app

void main() {
  runApp(MyApp());
}
Flutter takes MyApp and tries to put it into the widget tree.


#2. MyApp is a StatefulWidget
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
Flutter says: “Okay, this is Stateful, so I need to create a State object.”

It calls createState() → returns _MyAppState.

👉 That’s why createState is written before build.
Because without creating the state object, Flutter cannot manage updates for this widget.

#3. Flutter creates a State object
class _MyAppState extends State<MyApp> {
  ...
}

- This is where all your widget’s logic & variables live.
- This object will stay alive as long as the widget exists in the tree.
- Only this state object can call setState() to rebuild.

#4. Flutter calls build()

Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Hello")),
      body: Column(
        children: [Text("Nirmayiii"), Text("Roshan")],
      ),
    ),
  );
}

The build() function tells Flutter:
“Here is my UI right now.”
👉 Flutter then passes this to the Element Tree → Render Tree → Painter → drawn on screen.

#5. When something changes (setState)
- Suppose you press a button and call setState(() {}).
- Flutter marks the State object as “dirty” (means: needs rebuilding).
- Flutter calls build() again only for that widget.
- Painter updates the UI on screen.

##🔹 Easy Analogy
Think of it like this:

- StatefulWidget = Blueprint (like a car model).
- State object = The actual car you are driving.
- build() = Every time you repaint the car with new color or polish.
- createState() = Factory that first makes the car before you can drive it.
- setState() = You telling the mechanic: “Repaint the car with new changes.”

✅ So the reason createState exists before build is:
Flutter first needs to create a State object (storage + logic), and only then it can build UI from it.



## What is State Object:
- In Flutter, the State object is the mutable part of a StatefulWidget. While a StatefulWidget itself is an immutable configuration, 
its corresponding State object is persistent across rebuilds and holds the data that can change over time.

- This separation of mutable state and immutable widget is a core concept of Flutter's reactive, declarative framework. 
When the state inside a State object changes, you call setState() to notify the framework to rebuild the UI with the new data


###🔹 Difference Between StatefulWidget and State
StatefulWidget (MyApp)
- This is just a configuration / blueprint.
- It is immutable (cannot change once created).
- Think of it like a business card: it says “I’m MyApp, I will use _MyAppState for my behavior.”
- When Flutter needs to rebuild, it can throw away the old MyApp object and create a new one — because 
  it’s just data, cheap to recreate.

State (_MyAppState)
- This is the mutable object that actually holds values (like counter = 0, themeColor = red, etc.).
- It is attached to the StatefulWidget.
- This is what survives rebuilds and is updated when you call setState().

🔹 Who tells Renderer?
When something changes:
- You call setState() inside _MyAppState.
- Flutter marks that State object as dirty.
- Flutter calls _MyAppState.build() again.
- Inside build, you return a new MyApp widget tree (immutable widget objects).
- Flutter’s Element Tree compares old vs new widgets and decides what needs repainting.
- The Renderer/Painter updates the screen.

👉 So to your exact question:
- Does <MyApp> (the widget) tell renderer?
- No. Because MyApp is immutable, it cannot directly tell anyone anything.

Who tells renderer then?
- The State object (_MyAppState) tells Flutter framework → framework rebuilds widgets → renderer updates screen.

🔹 Why then do we need StatefulWidget at all?
Because Flutter separates:
- Immutable description (StatefulWidget = MyApp)
- Mutable state (State = _MyAppState)
- This separation makes it easier for Flutter to throw away widgets and rebuild them quickly, while keeping the underlying state alive.

⚡ Easy Analogy
- StatefulWidget (MyApp) = Recipe (immutable, always the same instructions).
- State (_MyAppState) = Cook (mutable, can change how spicy the food is today).
- Flutter = Kitchen manager.
- Renderer = Plates the food on the table (screen).
- When recipe changes (widget rebuild), the cook (State) can adjust and send new food (UI) to the renderer.

So the real mutable brain is _MyAppState, not MyApp.
MyApp is only the entry ticket to say: “I’m a special widget that needs a State object to live.”

 */
/*
###     setState
 

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState()=> _MyAppState();
}

class _MyAppState extends State<MyApp>{
int counter =0;
@override
Widget build(BuildContext context){
  return MaterialApp(
    debugShowCheckedModeBanner:false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Counter Card"),
      ),
      body: Center(
  child: Text("Counter $counter"),
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
        setState(() {
          counter++;
        });
        
      },
      child: Icon(Icons.add),),
    ),
  );
}
}

/*

- Why onPressed: () { ... }
- onPressed is a callback property of FloatingActionButton.
- Flutter expects you to give it a function that should run when the button is tapped.

() { ... } is an anonymous function (also called a lambda or closure in Dart).

👉 The empty () means:
“This function takes no parameters.”
👉 The { ... } means:
“This is the body of the function.”

So here, () { setState(() { counter++; }); } is literally saying:
“Whenever the button is pressed, run the code inside these curly braces.”
If you had a named function, you could also write:

void incrementCounter() {
  setState(() {
    counter++;
  });
}

FloatingActionButton(
  onPressed: incrementCounter,
  child: Icon(Icons.add),
)
Both ways are valid. The () { ... } is just the inline version.


## 2. What does setState do here?
Inside the anonymous function, you wrote:

setState(() {
  counter++;
});

- counter++ → increases the value of your counter variable by 1.
- But just changing the variable alone is not enough — Flutter won’t magically redraw 
the screen unless you tell it to.
- That’s where setState() comes in:

👉 setState() tells Flutter:
“Hey framework, I’ve changed some data in this State object. Please rebuild the UI with the new values.”
- The function you pass into setState(() { ... }) is where you mutate your state variables (like counter).
- After that finishes, Flutter automatically re-runs your build() method.
- In your build(), the new value of counter is inserted into:
- Text("Counter $counter")


Flutter compares old widget tree vs new widget tree and updates only that text.

### Flow when you tap button
- User taps FAB.
- onPressed triggers → runs () { setState(...); }.
- Inside setState, counter is incremented.
- Flutter marks this widget’s state as dirty and re-calls build().
- UI updates → new counter is shown.
 */
*/



/*
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Theme Changer",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: Text("Theme Changer"),),
        body: Center(
          child: Text( isDark ? "Dark Mode" : "Light Mode", style:TextStyle(fontSize: 25) ,),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            isDark = !isDark;
          });
        },
        child:Icon(Icons.brightness_7) ,),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;   // for theme
  String name = "";      // for text input

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Step 2: Input & State"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextField for user input
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter your name",
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;   // update state when typing
                  });
                },
              ),

              SizedBox(height: 20),

              // Show typed text live
              Text(
                name.isEmpty ? "No name yet..." : "Hello, $name 👋",
                style: TextStyle(fontSize: 22),
              ),

              SizedBox(height: 40),

              // Switch for theme toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Light"),
                  Switch(
                    value: isDark,
                    onChanged: (value) {
                      setState(() {
                        isDark = value;
                      });
                    },
                  ),
                  Text("Dark"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
