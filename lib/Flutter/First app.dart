/*

Perfect! Since you already have Flutter set up, let’s jump straight into **creating your first Flutter app** — the classic:

> 🧪 **"Hello World"** app using Flutter

We'll go step by step, with simple explanations and real-world meanings behind each part.

---

## ✅ Step 1: Create a New Flutter Project

### 📌 In terminal or VS Code:

```bash
flutter create hello_world_app
```

Now go into that folder:

```bash
cd hello_world_app
```

Open it in **VS Code** or **Android Studio**.

---

## ✅ Step 2: Understand the Folder Structure

Here’s what you’ll see:

```
hello_world_app/
├── lib/
│   └── main.dart       👈 Your main code goes here
├── android/            👈 Android-specific code
├── ios/                👈 iOS-specific code
├── pubspec.yaml        👈 For adding packages (like libraries)
```

For now, we’ll focus only on `lib/main.dart`.

---

## ✅ Step 3: Your First App Code (Hello World)

Replace everything in `main.dart` with:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Flutter App'),
        ),
        body: Center(
          child: Text(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
```

---

## 🧠 Explanation (Line by Line)

### 🔹 `import 'package:flutter/material.dart';`

> You're bringing in Flutter’s "material design" — like buttons, text, app bars.

### 🔹 `void main() => runApp(MyApp());`

> Main starting point. You’re telling Flutter: "Start my app using this widget: `MyApp`".

### 🔹 `class MyApp extends StatelessWidget`

> You are creating a **widget** (a piece of UI).
> Here it's a **StatelessWidget** = content doesn't change (static screen).

### 🔹 `MaterialApp(...)`

> Wraps the whole app with settings and themes.
> Like setting up the **base structure** of a building.

### 🔹 `Scaffold(...)`

> Think of `Scaffold` like the **layout** of your screen:

* `AppBar` = Top bar
* `Body` = Main content
* `Drawer`, `BottomBar` = Optional features

### 🔹 `Center(child: Text(...))`

> You're showing “Hello, Flutter!” in the center of the screen.

---

## 🎯 Real-world Example

Let’s say you want to make an app that welcomes users to your tuition class:

```dart
Text('Welcome to Vishwakarma Tutorials!')
```

Or for a restaurant app:

```dart
Text('Welcome to Roshan’s Rasoi!')
```

You just change the text — that’s the power of widgets!

---

## 🚀 Step 4: Run the App

### In VS Code:

* Select your emulator or real device (top bar)
* Press `F5` or click ▶️ Run

You’ll see:

```
My First Flutter App
---------------------
Hello, Flutter!
```


 */