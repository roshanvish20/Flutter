import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Runs the app and shows MyApp widget
}

class MyApp extends StatelessWidget {
  // Constructor (optional if you have no parameters)
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This method describes the UI of this widget
    return MaterialApp(
      debugShowCheckedModeBanner: false, // removes the deflaut debig icon
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateless Widget Example"),
        ),
        body: Center(
          child: Text("Hello, Flutter!"),
        ),
        //bottom color
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey,
          child: Center(child: Text("Navigations"),),
        ),
      ),
    );
  }
}

/*
1. How it works (step-by-step)
main() → The starting point.
Runs the app and calls runApp(MyApp()).

2.class MyApp extends StatelessWidget →
Means MyApp is a widget whose UI never changes while the app runs.

3.const MyApp({super.key}); →
Constructor for your widget (default). The super.key is for widget identity.

4.@override Widget build(BuildContext context) →
This method returns the UI of your widget.

5. MaterialApp → Wraps your whole app with Material Design.

6. Scaffold → Basic page layout with an AppBar, Body, Floating Button, etc.


 */

/*

1. It Gives You the Material Design Look
It automatically applies default styles for:
- Buttons
- Text
- App bars
- Navigation
- Icons
Without it, you’d need to style every widget manually.

2. It Handles App-Level Stuff
- When you wrap your root widget in MaterialApp, you get:
- title → The app name (shown in task switcher)
- theme → Global colors, fonts, button styles, etc.
- home → The first screen shown
- routes → Easy navigation between pages
- navigator → Built-in stack for page navigation
- scaffoldMessenger → Snackbars, dialogs, etc.

3. Without MaterialApp
- If you don’t use MaterialApp, your app won’t have:
- Material styling
- Automatic navigation handling
- Default theme colors
- Proper text direction, animations, etc.
- It would just be a bare widget tree, and you’d have to manually build all features (like navigation, theming, etc.) from scratch.


## MaterialApp is basically Flutter’s way of saying:
"Hey, let’s make your app look and behave like a proper Google Material Design app — with all the animations, 
colors, themes, buttons, navigation patterns, etc., already set up for you."
- It’s Google’s official UI/UX design system baked into Flutter.
- Think of it as a starter pack that gives you:
- Default UI elements (AppBar, FloatingActionButton, Drawer, etc.)
- Material theming (colors, typography, shapes)
- Navigation & routing system
- Support for animations & shadows that match Google’s style
- If you don’t use MaterialApp, you’d have to manually recreate these things (which is… painful 🥲).
 */