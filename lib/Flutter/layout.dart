/*

🧱 What is a Layout in Flutter?
A layout in Flutter tells where and how to place things (widgets) on the screen.

Just like:
- You arrange furniture in a room 🪑🛏️🖼️
- Flutter arranges widgets in a screen

🔹 1. Column – Arrange Vertically (Top to Bottom)

Column(
  children: [
    Text("Line 1"),
    Text("Line 2"),
  ],
)
📌 Think of it like a vertical stack of books 📚

📱Output:
Line 1
Line 2

🔹 2. Row – Arrange Horizontally (Left to Right)

Row(
  children: [
    Icon(Icons.star),
    Text("5 stars"),
  ],
)
📌 Like chairs in a row 🪑🪑🪑

📱Output:
⭐  5 stars

🔹 3. Stack – Widgets on Top of Each Other (Like Layers)


Stack(
  children: [
    Image.asset("bg.jpg"),
    Text("Welcome"),
  ],
)
📌 Like stickers on a photo
Background: Image
On top: Text

🔹 🟩 What is a Container in Flutter?
A Container is like a box you can use to hold other widgets and style them.
You can:

- Add padding, margin
- Set color, width, height
- Add borders, shadows, round corners
- Place other widgets inside it

🧠 Imagine This:
You have a gift box 🎁
- Inside: A toy (your child widget)
- Outside: You wrap it in colored paper (background color)
- Add soft cotton inside (padding)
- Leave space from other boxes (margin)
- That's exactly what Container does.

📦 Basic Syntax
Container(
  width: 200,
  height: 100,
  color: Colors.blue,
  child: Text("Hello World"),
)
📱 Output:
A blue box (200x100) with text inside

🔹 5. SizedBox 
🟨 What is SizedBox?
A SizedBox is a blank, invisible box used to:
- Add space between widgets
- Or give a widget a fixed size

🔹 Vertical SizedBox
📌 Use: To add vertical space (i.e., top to bottom)
Column(
  children: [
    Text("First Line"),
    SizedBox(height: 20), // vertical space
    Text("Second Line"),
  ],
)
📱 Output:

First Line
<--- 20 pixels vertical gap --->

Second Line
🧠 Real-Life Example:
Like putting a book on a shelf and leaving gap above it before the next book.

🔸 Horizontal SizedBox
📌 Use: To add horizontal space (i.e., left to right)

Row(
  children: [
    Icon(Icons.star),
    SizedBox(width: 10), // horizontal space
    Text("5 stars"),
  ],
)
📱 Output:

⭐         5 stars
   <-- 10 pixels horizontal gap -->
🧠 Real-Life Example:
Like two people sitting on a bench with space between them 🪑 🪑

✅ You Can Also Use SizedBox for Both
SizedBox(
  width: 100,
  height: 50,
)
🟦 This will create a box of size 100x50, even if it's empty.

### Visual Summary:

Column (vertical):
Text 1
⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛  <- SizedBox(height)
Text 2

Row (horizontal):
[Icon] ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛ [Text]
         <- SizedBox(width)

📱 Instagram Example: Story Bubbles Row
At the top of Instagram, you see circular story icons placed side-by-side with a small gap between them:

[Your Story]   [Friend 1]   [Friend 2]   [Friend 3]
To create that horizontal space between each story bubble, you’d use SizedBox(width: 8)
 (or any spacing) inside a Row or ListView.


(🔴)    ← SizedBox →    (🔵)    ← SizedBox →    (🟢)
Your     Friend 1         Friend 2


###🔹 6. Center – Center the Child in Parent

Center(
  child: Text("I'm centered"),
)
📌 It moves the child to the center of the screen or parent box.

### 🔹 7. Expanded & Flexible 
🟦 What are Expanded and Flexible?
Both are used inside Row or Column to make widgets take up flexible space.

| Widget     | Purpose                                           |
| ---------- | ------------------------------------------------- |
| `Expanded` | Forces a widget to **take all available space**   |
| `Flexible` | Gives a widget space **if needed** (more relaxed) |


🔹 Real-Life Analogy:
- Imagine a bookshelf with three books:
- Expanded: Each book must stretch to fill the whole shelf equally.
- Flexible: Each book can grow to fill space only if it wants to.

✅ Example 1: Using Expanded

Row(
  children: [
    Expanded(
      child: Container(color: Colors.red, height: 100),
    ),
    Expanded(
      child: Container(color: Colors.green, height: 100),
    ),
    Expanded(
      child: Container(color: Colors.blue, height: 100),
    ),
  ],
)

📱 Output:
The 3 containers each take equal width of the screen.
|   RED   |   GREEN   |   BLUE   |
✅ Example 2: Using Flexible

Row(
  children: [
    Flexible(
      child: Container(color: Colors.red, height: 100, width: 80),
    ),
    Flexible(
      child: Container(color: Colors.green, height: 100),
    ),
  ],
)
📱 Output:
The first box stays 80px wide, the second one takes the remaining space
| RED(80px) |      GREEN (fills rest)     |

📊 Summary Table
| Feature          | `Expanded`               | `Flexible`                           |
| ---------------- | ------------------------ | ------------------------------------ |
| Fills all space? | Yes                      | Only if needed                       |
| Use case         | Equal space distribution | Content with flexible sizing         |
| Shrinkable?      | No (forces full space)   | Yes (can be small if child is small) |
| Forces grow?     | Yes                      | Optional                             |


🔁 Use Case Example: Instagram Post Layout
Let’s say you have a Row:
- Left: User profile picture (fixed)
- Middle: Username (takes remaining space)
Right: More icon (fixed)

Row(
  children: [
    CircleAvatar(radius: 20), // Fixed size
    SizedBox(width: 8),
    Expanded(
      child: Text("username", overflow: TextOverflow.ellipsis),
    ),
    Icon(Icons.more_vert), // Fixed size
  ],
)
🟢 Expanded here ensures the username takes as much space as it can, but doesn't push away the icon.
📌 Divide space evenly between children.


🔹 8. ListView – Scrollable Column

ListView(
  children: [
    Text("Item 1"),
    Text("Item 2"),
    Text("Item 3"),
  ],
)

📌 When to Use ListView?
Use ListView when you want to
| 🧠 Purpose                               | ✅ Example Use Case                           |
| ---------------------------------------- | -------------------------------------------- |
| Show a **scrollable list**               | Chat messages, Instagram feed, contacts list |
| Have **more items than fit on screen**   | Product catalog, articles, menus             |
| Dynamically load a list                  | Use `ListView.builder()` with APIs or data   |
| Add **vertical or horizontal scrolling** | Story reels, image sliders                   |


Example:
1. 📞 Contacts App
ListView(
  children: [
    ListTile(title: Text("Alice")),
    ListTile(title: Text("Bob")),
    ListTile(title: Text("Charlie")),
  ],
)
You scroll to view all your contacts.

📦 Types of ListView
| Type                            | Simple Meaning                               | When to Use It                                                                                                          | Real App Example                                                        |
| ------------------------------- | -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| **`ListView(children: [...])`** | 📦 Normal list with items you write manually | ➤ When you know the list items in advance<br>➤ List is small (like 3–10 items)<br>➤ Example: Menu list, settings screen | ⚙️ **Instagram Settings** screen (Notification settings, Privacy, etc.) |
| **`ListView.builder()`**        | 🏗️ Builds items one by one, from data       | ➤ When your list is big or comes from a variable/API<br>➤ Example: Chat messages, user list from database               | 💬 **WhatsApp Chats List**, **Instagram Feed**                          |
| **`ListView.separated()`**      | ➖ Adds space or line between items           | ➤ When you want to add lines or space between items<br>➤ Example: Contacts list with dividers between names             | 📇 **Phone Contacts App** with lines between names                      |
| **Horizontal `ListView`**       | ↔️ Scrolls left to right                     | ➤ When you want items to scroll **sideways** (left/right)<br>➤ Example: Instagram stories, product images               | 📸 **Instagram Stories**, 🛒 Amazon product images                      |


### 🟨 What is Padding?
Padding is the space inside a container, between the content (child) and the border/background of the container.

🎁 Real-Life Example:
Imagine you put a fragile gift inside a box and wrap it with bubble wrap 🫧 to protect it.
That bubble wrap is the padding — space inside the box around the gift.

📦 Flutter Example:
Container(
  padding: EdgeInsets.all(16),
  color: Colors.orange,
  child: Text("Hello"),
)
🟧 = Container
🟨 = Padding
🔤 = Text

+------------------------+  <- container border (with color)
|  🟨                🟨  |  <- padding space
|  🟨     Hello      🟨  |
|  🟨                🟨  |
+------------------------+

### 🟦 What is Margin?
Margin is the space outside a container, between the container and other widgets or screen edges.

🎁 Real-Life Example:
If your gift box is placed on a table and you leave some space between this box and other boxes, that space is the margin.

📦 Flutter Example:
Container(
  margin: EdgeInsets.all(16),
  color: Colors.blue,
  child: Text("Hello"),
)
This gives space around the container itself.
 */


/*
🧭 What is Alignment in Flutter?
- Alignment decides where to place a widget inside its parent.
- Imagine you have a photo inside a frame — should it be in the center, top-left, bottom-right? That’s alignment.

🔄 Common Types of Alignment (using Alignment class)
You use them with widgets like Container, Align, etc.
| Alignment Constant       | Position             | Visual Example |
| ------------------------ | -------------------- | -------------- |
| `Alignment.center`       | Center of the parent | 🎯             |
| `Alignment.topLeft`      | Top-left corner      | ↖️             |
| `Alignment.topRight`     | Top-right corner     | ↗️             |
| `Alignment.bottomLeft`   | Bottom-left corner   | ↙️             |
| `Alignment.bottomRight`  | Bottom-right corner  | ↘️             |
| `Alignment.centerLeft`   | Center left          | ◀️             |
| `Alignment.centerRight`  | Center right         | ▶️             |
| `Alignment.topCenter`    | Top center           | ⬆️             |
| `Alignment.bottomCenter` | Bottom center        | ⬇️             |


## 🎨 What is decoration in Flutter?
decoration is used to style a widget (usually Container), like adding background color, borders, radius (rounded corners), gradients, etc.

🖌️ BoxDecoration Properties:
| Property       | What it does             | Example                                   |
| -------------- | ------------------------ | ----------------------------------------- |
| `color`        | Background color         | `color: Colors.blue`                      |
| `borderRadius` | Rounds the corners       | `borderRadius: BorderRadius.circular(10)` |
| `border`       | Adds borders             | `border: Border.all(color: Colors.red)`   |
| `gradient`     | Adds gradient background | `gradient: LinearGradient(...)`           |
| `image`        | Add background image     | `image: DecorationImage(...)`             |

🎨 Example:
Container(
  height: 100,
  width: 100,
  decoration: BoxDecoration(
    color: Colors.orange,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.red, width: 2),
  ),
  alignment: Alignment.center,
  child: Text("Styled!"),
)
✅ This creates:

- An orange box
- Rounded corners
- Red border
- Centered "Styled!" text

📱 Real Life Example:
- Instagram Post Box: Uses decoration to round corners, maybe show gradient.
- Story Bubbles: Use alignment to center the profile picture inside the circle.
 */








/*
1. MainAxisAlignment
- Controls space distribution along the main axis of a layout.
- Main axis = the primary direction of children in that widget:
- In Row → main axis = horizontal
- In Column → main axis = vertical

Examples:
- MainAxisAlignment.start → all items at the start.
- MainAxisAlignment.center → all items in center.
- MainAxisAlignment.spaceBetween → spread out with space only between items.

Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    CircleAvatar(), // Story 1
    CircleAvatar(), // Story 2
    CircleAvatar(), // Story 3
  ],
)


2. CrossAxisAlignment
- Controls alignment along the cross axis (the other direction).
- Cross axis = perpendicular to main axis:
- In Row → cross axis = vertical
- In Column → cross axis = horizontal

Examples:
- CrossAxisAlignment.start → items align to top (Row) or left (Column).
- CrossAxisAlignment.center → items align in middle.
- CrossAxisAlignment.stretch → items expand to fill cross axis.

Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Image.network("thumb.jpg"), // Video thumbnail
    Text("Video title"),        // Stays at top
  ],
)


3. Spacer
What it is: An invisible widget that takes up all available space, pushing others apart.
📱 Example:
- In Instagram top bar, the logo is on the left, camera icon on the right, and there’s empty space in between — that’s a Spacer.

Row(
  children: [
    Icon(Icons.camera_alt),
    Spacer(),
    Icon(Icons.send),
  ],
)

4. Align / Alignment
What it is: Positions a single child inside its parent in a specific spot.

📱 Example:
- In WhatsApp status, the "add" (+) button is at the bottom right of the profile picture.
- In Instagram reels, the heart, comment, and share buttons are bottom right aligned.

Align(
  alignment: Alignment.bottomRight,
  child: Icon(Icons.add_circle),
)

5. FractionallySizedBox
What it is: Makes a widget take up a fraction of its parent’s size.

📱 Example:
- In YouTube, the progress bar at the bottom of the video might take 100% width but only a tiny height.
- In Instagram story progress indicator, each bar takes a fraction of total width.

FractionallySizedBox(
  widthFactor: 0.5, // Half of parent's width
  child: Container(color: Colors.red, height: 5),
)


6. Wrap
Similar to Row/Column but:
- If items don’t fit in one line, they wrap to the next line (like text).
- Useful for chips, tags, buttons, etc.
- Has direction (Axis.horizontal or Axis.vertical)
and alignment for both main and cross axes (but with slightly different names).

Example:
Wrap(
  spacing: 8,
  runSpacing: 8,
  children: [
    Chip(label: Text("#flutter")),
    Chip(label: Text("#dart")),
    Chip(label: Text("#mobiledev")),
  ],
)


7. Table
What it is: Creates a grid layout with rows and columns.

📱 Example:

- In Instagram profile, the grid of posts is like a table (3 columns).
- In Google Sheets app, cells are in a table structure.

Table(
  children: [
    TableRow(children: [
      Image.asset("post1.jpg"),
      Image.asset("post2.jpg"),
      Image.asset("post3.jpg"),
    ]),
  ],
)


8. AspectRatio
What it is: Keeps a widget’s width-to-height ratio fixed, no matter the screen size.

📱 Example:
- In Instagram posts, square images always keep a 1:1 ratio.
- In YouTube videos, the player keeps a 16:9 ratio.

AspectRatio(
  aspectRatio: 1, // Square
  child: Image.asset("post.jpg"),


9. LayoutBuilder
What it is: Lets you build a layout based on how much space the parent gives.

📱 Example:
- In Instagram Explore, grid layout changes depending on screen width.
- In e-commerce apps, number of product cards changes based on device size.

LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return Text("Tablet layout");
    } else {
      return Text("Phone layout");
    }
  },
)
 */