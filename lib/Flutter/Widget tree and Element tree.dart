/*
### What is widget tree, element tree and render tree?

🧱 1. Widget Tree — What YOU Write ✍️
📌 Definition:
The Widget Tree is the blueprint of your UI — written in your Dart code.

🧠 Think of it like:
🏗️ The architectural plan of your house.

✅ Characteristics:
- Immutable (can’t change once built)
- Stateless or Stateful
- Built by your build() method
- Tells Flutter: "What should be shown?"

👇 Example:

Scaffold(
  appBar: AppBar(title: Text("Roshan")),
  body: Center(child: Text("Hello")),
)
This is a simple widget tree — a hierarchy of widgets.

🧩 2. Element Tree — What Flutter Manages 👷‍♂️
📌 Definition:
The Element Tree is a long-lived structure created by Flutter to manage widget instances and their relationship to the UI.

🧠 Think of it like:
🔌 The wiring and plumbing system built from the architectural plan.

✅ Characteristics:
- Each widget has a corresponding Element
- Elements store references to both the widget and the rendered result
- Handles lifecycle (like initState, didUpdateWidget, etc.)
- More dynamic than the widget tree

Widget = Plan 📝
Element = Active Instance ⚙️

🎨 3. Render Tree — What Gets Drawn 🖌️
📌 Definition:
The Render Tree is the part that Flutter uses to calculate size, position, and paint on screen using Skia.

🧠 Think of it like:
🧱 The actual walls, windows, and paint you see in a finished house.

✅ Characteristics:
- Built using RenderObjects
- Controls layout, hit testing, painting
- Drawn by the Skia engine

🔄 How They Work Together:
Here's a full flow:
You write code → Widget Tree
            ↓
Flutter builds → Element Tree
            ↓
Element creates → Render Tree
            ↓
Skia paints → On screen

🧪 Example in Instagram:
Widget Tree:

Column(
  children: [
    Image.network("story.jpg"),
    Text("Username"),
    Icon(Icons.favorite),
  ],
)

Element Tree:
- Flutter tracks each widget instance
- Knows when to reuse or update them when setState() is called

Render Tree:
- Positions and draws the image, text, and icon
- Handles animation, layout size, etc.


??? Q1. Immutable (can’t change once built)? What if I delete some widget.
🔁 1. “Immutable — can’t change once built”?
Yes — but don’t worry, that doesn’t mean you can’t update the UI!

✅ What it really means:
Widgets are like blueprints — if you want to "change" something, you don’t modify the old one, you just create a new one and Flutter 
replaces the old one with the new one.


🔍 Real-life Example:
You have this:
Text("Hello")

You want to change it to:
Text("Roshan")

- You're not editing the old Text, you're creating a new Text widget, and Flutter says:
- “Okay, replace the old one with this new one.”
- This works because of the Element Tree behind the scenes — keep reading!


??? Q2. What is the Element Tree?
🧠 Simple Idea:
- The Element Tree is Flutter’s way of keeping track of what’s currently on the screen.
- Think of Element as the "glue" between your Widget and the thing shown on screen.

🏗️ Analogy:
Role	What it does
| Role         | What it does                                 |
| ------------ | -------------------------------------------- |
| Widget       | The **blueprint**                            |
| Element      | The **construction manager**                 |
| RenderObject | The **actual wall, window, or button drawn** |


Widget says: “We need a button here.”
Element says: “Okay, I’ll make sure this button stays there and update it if needed.”
RenderObject says: “I'll draw that button.”

Example:
When you write this:

ElevatedButton(
  onPressed: () {},
  child: Text("Click me"),
)
Flutter does this:

Widget → ElevatedButton
↓
Element → StatefulElement (manages updates, lifecycle)
↓
RenderObject → Renders button shape, shadow, layout, position

If you press a button and use setState(), 
Flutter:
- Rebuilds your widget
- Compares old vs new
- Keeps or updates the Element
- And changes the RenderObject if needed

??? Q3. What is a RenderObject?
✅ Definition:
The RenderObject is what actually draws the pixels on the screen — size, color, position, animation, etc.

Examples:
- RenderParagraph → draws a Text
- RenderBox → common base for layout
- RenderImage → draws images

🔍 Real App Example:

Column(
  children: [
    Text("Roshan"),
    Icon(Icons.star),
  ],
)
This creates:

Widget Tree:
  Column
   ├─ Text
   └─ Icon

Element Tree:
  ColumnElement
   ├─ StatelessElement (Text)
   └─ StatelessElement (Icon)

Render Tree:
  RenderFlex (Column layout engine)
   ├─ RenderParagraph (for Text)
   └─ RenderImage (for Icon)
So when you delete or change a widget, you’re not “modifying” the old one — you're giving Flutter a new blueprint, 
and Flutter updates the element + render layers for you.




 ??? Q4. What does “rebuilds your widget” mean?
👉 Simple Explanation:
When something changes (e.g. button click, new data, animation, etc.), Flutter calls your build() method again to recreate the widget tree.
But:
Flutter is smart — it doesn’t rebuild everything blindly.
It compares old vs new widgets and only updates the changed parts.

🔁 Real-Life Analogy:
- You’re rearranging your shelf:
- You remove one book and add a new one.
- You don’t rebuild the entire shelf.
- You just replace that one book — same thing Flutter does during rebuild.

??? Q5. What is RenderFlex?
📌 It’s a RenderObject:
It’s Flutter’s engine behind layouts like Row and Column.
Column → uses RenderFlex in vertical direction
Row → uses RenderFlex in horizontal direction

🧠 Think of it as:
📦 “How do I arrange these boxes (widgets)? Vertically or horizontally?”

Example:
Column(
  children: [
    Text("Roshan"),
    Image.asset("pic.jpg"),
    Text("Welcome"),
  ],
)
Behind the scenes:

Column widget
→ creates Element
→ uses RenderFlex to arrange children vertically
→ children like Text and Image have their own RenderObjects

Q6. What happens if you delete 1st widget (Text("Roshan"))?
Imagine original:

Column(
  children: [
    Text("Roshan"),
    Image.asset("pic.jpg"),
    Text("Welcome"),
  ],
)
Now you change to:

Column(
  children: [
    // removed Text("Roshan")
    Image.asset("pic.jpg"),
    Text("Welcome"),
  ],
)
🧠 Flutter Will Do:
Widget Tree:
Old: 3 children
New: 2 children

Flutter compares:
- 🔍 Sees 1st child (Text) is gone
- 🧹 Removes its corresponding Element
- 🧹 Removes its RenderObject
- 🧩 Moves next widgets (Image & Text) up in the tree

So in Summary:
- It rebuilds your widget tree
- Updates the Element tree (removes 1st element)
- Updates Render tree (removes 1st render object)
- Then Skia repaints new layout

🔁 VISUAL COMPARISON
Before:
Widget Tree:
Column
 ├─ Text("Roshan")
 ├─ Image
 └─ Text("Welcome")

After:
Widget Tree:
Column
 ├─ Image
 └─ Text("Welcome")
Flutter’s Element Tree and Render Tree get updated to reflect this.




??? Q7. creates Element?? Means and why does it mean by every widget has element. 
   And how does rebuild happens what is code and all.


✅ What is an Element?
🔸 When Flutter runs your app, it creates:

Widget → Element → RenderObject
Think of:
- Widget = your blueprint/code
- Element = live instance of widget during app running
- RenderObject = draws it on screen

⚙️ Element is like:
- The connection between the widget code and the thing actually shown.
- It also stores state (in StatefulWidgets) and helps manage updates.

🔹 Why does “Every Widget has an Element”?
Because when Flutter builds the screen, it needs something live that:
- Keeps track of position in the widget tree
- Knows where to update if something changes
- Can hold state (like counter value)

So when you write:

Text("Hi")
Flutter does:

- Creates Text widget
- Creates StatelessElement behind the scenes
- That element creates a RenderParagraph to draw the text

🔁 How does Rebuild Happen?
📌 Rebuild = Flutter calls your build() method again.
Usually triggered by:
- setState() (in StatefulWidget)
- Parent widget changing
- Hot reload (during development)

# What Happens:
- App starts → Flutter calls build() → creates widget tree
- You press button → setState() is called
- Flutter says: “Time to rebuild!”
- It calls build() again → compares old and new widgets
- If anything changed → it updates screen using Element + RenderObject



??? Q8.And If I used column from top to bottom in left side and now I want to use row so where it s going to start from ??


🔹 Column → lays widgets vertically (top to bottom).
Default alignment: left-aligned (i.e. start of screen horizontally)

🔹 Row → lays widgets horizontally (left to right)
Default alignment: top-aligned (i.e. start vertically)

🎯 So, if you write:
Column(
  children: [
    Text("Line 1"),
    Text("Line 2"),
    Row(
      children: [
        Icon(Icons.star),
        Text("5 stars"),
      ],
    ),
  ],
)
It will look like this:

Line 1         ← (Column top to bottom)
Line 2
★ 5 stars      ← (Row starts on left by default)
So:

✅ Your Row will simply continue from the next vertical spot in the Column, and start left to right from there.

🧠 Bonus Tip – Control Alignment!
You can control where the Row or Column aligns using:

For Row:
Row(
  mainAxisAlignment: MainAxisAlignment.center, // center items horizontally
  crossAxisAlignment: CrossAxisAlignment.start, // align top of all items
)

For Column:
Column(
  crossAxisAlignment: CrossAxisAlignment.start, // left-align items
)

 */