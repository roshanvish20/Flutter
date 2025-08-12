/*
# What is a Widget?
In Flutter, everything on the screen (text, button, image, layout) is a widget.

##Stateless Widget
A widget that never changes once it's built.

🔹 Easy Example:
- A "Hello, Roshan!" text
- A static logo
- A button that doesn’t do anything

🔹 Think of it like:
📷 A photo — once clicked, it doesn't change unless you take a new one.

✅ Use it when:
- UI does not change over time.
- No interaction or internal update needed.

Code:
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hello, Roshan!");
  }
}


# Q1. If I used a button that navigate user to another page in stateless widget?
✅ Yes, you can absolutely use a button that navigates to another page inside a StatelessWidget.
Because navigation doesn’t change the state of the current widget, it just moves to another screen — 
so you don't need a StatefulWidget for that.

🔁 Remember:
Navigation is a one-time action, not a change in internal state (like a counter or switch toggle), 
so StatelessWidget is perfect for it.

Example:
Code:
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // First screen
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Next Page"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        ),
      ),
    );
  }
}
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(child: Text("You are on Page 2!")),
    );
  }
}


Q2. And if I create a button that color or appears text in stateless widget

❌ You cannot change the color or show new text dynamically inside a StatelessWidget — because it cannot rebuild itself once created.
🧠 Why?
StatelessWidget means:
- It gets built once
- No matter what you do (click, tap), it won’t change anything on the screen
- It doesn't hold or update any data

Q3. Navigation is allowed so if yes then is it possible that i add some animation or transition on that button?
✅ Yes, you can absolutely add animations or transitions to a button inside a StatelessWidget — but there's a 
distinction to make depending on what kind of animation you're referring to:
🔹 1. Page Transition Animation (When Navigating to Another Screen)
You can customize the navigation animation even from a StatelessWidget.
🔹 2. Button Animation (e.g., Tap Effect, Scale, Glow, etc.)
If you want the button itself to animate when pressed or hovered:

#if you want complex or interactive animations (e.g., bouncing, color change, scaling) that depend on user interaction or time-based updates, 
you might need a StatefulWidget or use the flutter_hooks package to simplify state inside function components.

### Real Life Uses:
📱 1. App Logo / Splash Screen
- Example: Instagram’s logo screen when you open the app.
- It shows a static image/text for a few seconds.
- It doesn’t change unless replaced.

🧭 2. Navigation Drawer / Sidebar Items
- Example: Items like “Home,” “Profile,” or “Settings” in a drawer.
- Clicking them navigates, but the item itself doesn’t change dynamically.

🧾 3. Read-Only Product Card
- Example: A card showing product details in Amazon or Flipkart.
- If it’s not interactive (like add to cart), it's just showing text and image.

# 4. Profile Header Info (Static)
- Example: User name, profile picture, and bio shown on the profile page.
- If you’re not editing, it's perfect as a StatelessWidget.

🔲 5. Settings Label or Section Title
Like “Account Settings” or “Privacy” titles that are just bold texts separating parts.

🧠 Simple Rule:
Use StatelessWidget when a widget only displays data and does not change itself after it’s shown.

 */

/*
### What is Statelful Widget:
🟩 Stateful Widget
A widget that can change when something happens (like tap, input, scroll).

🔹 Easy Example:
- A counter that increases when you press a button
- A form where user types something
- A dark mode toggle switch

🔹 Think of it like:
🎥 A video — it moves, changes, and reacts over time.

✅ Use it when:
- UI needs to update/rebuilt
- You want to remember user input, or track changes

Example:
class MyCounter extends StatefulWidget {
  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int count = 0;

  void increment() {
    setState(() {
      count++; // this updates the screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Count: $count"),
        ElevatedButton(
          onPressed: increment,
          child: Text("Increase"),
        ),
      ],
    );
  }
}

## In Simple Words
| Feature             | StatelessWidget   | StatefulWidget            |
| ------------------- | ----------------- | ------------------------- |
| Changes over time?  | ❌ No              | ✅ Yes                     |
| Rebuilds on change? | ❌ Never           | ✅ Yes, using `setState()` |
| Example             | Static text, logo | Counter, form, switch     |

 */

/*

### Stateless V/S Stateful 
## In Simple Words
| Feature             | StatelessWidget   | StatefulWidget            |
| ------------------- | ----------------- | ------------------------- |
| Changes over time?  | ❌ No              | ✅ Yes                     |
| Rebuilds on change? | ❌ Never           | ✅ Yes, using `setState()` |
| Example             | Static text, logo | Counter, form, switch     |


Q1. In over all app which one is most used?
🟦 StatelessWidgets are more common overall.
🔍 Why?
Because most parts of an app:
- Just display data (text, image, icons, layout)
- Don’t need to update themselves
- Are simple and lightweight

📊 Real-World Ratio (on average):
| Type              | Rough Ratio in App |
| ----------------- | ------------------ |
| `StatelessWidget` | ✅ **70–80%**       |
| `StatefulWidget`  | ✅ **20–30%**       |

🧠 Example App Breakdown (e.g., Shopping App):
| Screen/Widget                          | Stateless or Stateful |
| -------------------------------------- | --------------------- |
| Product card (title, price, image)     | Stateless ✅           |
| App bar, drawer menu, icons            | Stateless ✅           |
| Category list/grid layout              | Stateless ✅           |
| Search bar with input tracking         | Stateful ✅            |
| Favorite button (heart toggle)         | Stateful ✅            |
| Cart screen (updates when items added) | Stateful ✅            |
| Checkout button (just displays text)   | Stateless ✅           |

🧱 Best Practice in Flutter:
Build most of your UI using StatelessWidgets
and only use StatefulWidget when necessary — where something must change/react.


### Breakdwon and analysis of Real life apps:
## 📺 NETFLIX App – Widget Breakdown
🔹 1. Home Screen UI
| UI Element                    | Widget Type              | Reason                                            |
| ----------------------------- | ------------------------ | ------------------------------------------------- |
| App bar with Netflix logo     | `Stateless` ✅            | Just displays static logo                         |
| Movie categories ("Trending") | `Stateless` ✅            | Just labels, no state                             |
| Horizontal movie sliders      | `Stateless` ✅            | Scrolling handled by ScrollView, not widget state |
| Movie posters                 | `Stateless` ✅            | Static image cards                                |
| Tap on movie poster → details | Navigation (Stateless) ✅ | Navigation doesn't need state                     |
| "Play", "My List" buttons     | `Stateful` ✅             | Needs to toggle states (e.g., saved or not)       |

🔹 2. Search Screen
| UI Element          | Widget Type   | Reason                               |
| ------------------- | ------------- | ------------------------------------ |
| Search input box    | `Stateful` ✅  | Tracks text input & triggers search  |
| Search results      | `Stateful` ✅  | Rebuilds when user types             |
| Static filters/tabs | `Stateless` ✅ | Doesn’t change with user interaction |

🔹 3. Player Screen
| UI Element              | Widget Type   | Reason                |
| ----------------------- | ------------- | --------------------- |
| Play/Pause button       | `Stateful` ✅  | Tracks playback state |
| Progress bar/timeline   | `Stateful` ✅  | Continuously updates  |
| Title/Video description | `Stateless` ✅ | Just shows info       |



📸 INSTAGRAM App – Widget Breakdown
🔹 1. Home Feed
| UI Element             | Widget Type   | Reason                    |
| ---------------------- | ------------- | ------------------------- |
| User profile pic, name | `Stateless` ✅ | Doesn’t change            |
| Post image             | `Stateless` ✅ | Static unless refreshed   |
| Like/Comment icons     | `Stateful` ✅  | Changes color when tapped |
| Number of likes        | `Stateful` ✅  | Increases when user likes |
| Caption/text area      | `Stateless` ✅ | Static unless editing     |
| Stories at top         | `Stateful` ✅  | Highlights as watched     |

🔹 2. Explore/Search Tab
| UI Element    | Widget Type   | Reason                     |
| ------------- | ------------- | -------------------------- |
| Search field  | `Stateful` ✅  | Tracks text input          |
| Grid of posts | `Stateless` ✅ | Usually static once loaded |

🔹 3. Reels (Video Player)
| UI Element            | Widget Type   | Reason                       |
| --------------------- | ------------- | ---------------------------- |
| Play/Pause            | `Stateful` ✅  | Video control changes        |
| Like, Comment buttons | `Stateful` ✅  | Visual change on interaction |
| Hashtags, captions    | `Stateless` ✅ | Just display content         |

🔹 4. Profile Page
| UI Element          | Widget Type   | Reason                           |
| ------------------- | ------------- | -------------------------------- |
| Username, bio       | `Stateless` ✅ | Static unless edited             |
| Edit profile button | `Stateful` ✅  | Opens state-changing form        |
| Followers/following | `Stateful` ✅  | May change in real-time          |
| Grid of photos      | `Stateless` ✅ | Scrollable but not self-updating |

🔚 Summary Table
| App       | Mostly Stateless In              | Mostly Stateful In                    |
| --------- | -------------------------------- | ------------------------------------- |
| Netflix   | UI layouts, movie cards, titles  | Play buttons, search input, toggles   |
| Instagram | Posts, profile info, static text | Like buttons, reels, comments, search |

 */



/*
### Stateless and Stateful (Quick Recap):

🧠 CORE DIFFERENCES 
| Feature                  | StatelessWidget 🟦 | StatefulWidget 🟩         |
| ------------------------ | ------------------ | ------------------------- |
| Rebuilds on interaction? | ❌ No               | ✅ Yes (with `setState()`) |
| Holds data?              | ❌ No               | ✅ Yes (inside `State<T>`) |
| Lightweight?             | ✅ Yes              | ⚠️ Slightly heavier       |
| Used for?                | Static UI            | Dynamic/Interactive UI    |


🔍 UNDERSTANDING THE STRUCTURE
🟦 StatelessWidget

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hello");
  }
}
Only 1 class → build() called once

🟩 StatefulWidget
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Text("Counter: $counter");
  }
}

Two classes
StatefulWidget (immutable) → Creates
_MyWidgetState (mutable) → Holds state and updates

⚠️ THINGS YOU SHOULD KNOW
1. 🧠 setState() is the key in StatefulWidget

setState(() {
  // Any change here triggers rebuild
});

- Only available in Stateful widgets
- Triggers the UI to update

2. 🛑 Avoid putting heavy logic in build()
- build() can run many times (e.g., after each setState)
- Keep it clean and UI-focused only

3. ♻️ Use StatelessWidget wherever possible
- Better performance
- Easier to read and test
- Flutter encourages composition with many small stateless widgets

4. 🎯 Use initState() in StatefulWidget for one-time setup

@override
void initState() {
  super.initState();
  // e.g., fetch data from API once
}

5. ⛔ Common mistakes
❌ Trying to change state in StatelessWidget
❌ Modifying variables without setState()
❌ Doing API calls or long logic in build()

🧩 Bonus: When to Convert Stateless → Stateful?
You should convert when:
- You need to track user interaction
- You need to store temporary data
- The widget's UI depends on internal changes

Example:
- Liking a post
- Toggling dark mode
- Switching tabs manually

 */

/*
### Q1. Why we use Override method here? And we don't use then?

Why @override is used here
@override means:
“I am overriding a method from the parent class.”
- Here, StatelessWidget already has a method named build(BuildContext context).

You must override it because:
- That’s where you describe what the widget looks like.
- Without overriding it, Flutter wouldn’t know what to draw.

So:
@override
Widget build(BuildContext context) {
  return Container(); // Your UI here
}
is basically your own version of the build method.


1.In a StatelessWidget, the build(BuildContext context) method is where you describe what the widget should look like.
2.If you don’t override it, then the widget will just inherit the default behavior from the StatelessWidget class — and in that class, 
the default build() method simply throws an error saying:

"StatelessWidget.build() is not implemented."

3.That’s because StatelessWidget is an abstract class — it’s like a blueprint. 
Flutter doesn’t know what UI to draw unless you tell it by overriding build().
4. So there is no default look — without build(), your widget can’t render anything at all.

It’s like saying:
“Here’s a canvas. What do you want me to draw?”
If you don’t answer, Flutter just says “Well… I can’t draw anything, so error!"

 */