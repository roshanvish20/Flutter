/*
Flutter V/s React Native
| Feature              | **Flutter**                                   | **React Native**                         |
| -------------------- | --------------------------------------------- | ---------------------------------------- |
| **Creator**          | Google                                        | Facebook (now Meta)                      |
| **Language**         | Dart 🟦                                       | JavaScript |
| **UI Rendering**     | Draws everything from scratch (custom engine) | Uses native components of Android/iOS    |
| **Performance**      | Very fast (near native) 🚀                    | Good, but sometimes slightly slower      |
| **UI Customization** | Easy and beautiful, consistent across devices | Depends on native look, may need linking |
| **Learning Curve**   | Easy if you know Dart or new to coding        | Easier if you already know JavaScript    |
| **Hot Reload**       | ✅ Yes (super fast)                            | ✅ Yes (very fast too)                    |
| **Community**        | Growing fast                                  | Larger and more mature                   |
| **App Size**         | Slightly bigger                               | Smaller than Flutter in most cases       |
| **Web Support**      | Getting better, still in progress             | Better with Expo or React Native Web     |
| **Plugins/Packages** | Plenty via `pub.dev`                          | Huge ecosystem via `npm`                 |



#🔍 What is Flutter?
Flutter is a UI framework by Google that lets you build beautiful apps for Android, iOS, web, desktop — all with one codebase using the Dart language.
- UI is made of widgets
- Uses its own graphics engine (Skia) to draw everything
- Great for custom UI and animations

#🔍 What is React Native?
React Native is a framework by Meta (Facebook) that lets you build mobile apps using JavaScript and React — write once, run on both Android and iOS.
- Uses native components under the hood
- Easy to learn for web developers (JavaScript/React)
- Needs native code (Java/Kotlin/Swift) sometimes for advanced features

##Which one is Better?
| Situation                                    | Better Choice    | Why?                                     |
| -------------------------------------------- | ---------------- | ---------------------------------------- |
| You want beautiful, custom UI                | **Flutter**      | Full control over visuals and animations |
| You're a web developer with React/JS skill   | **React Native** | You already know the language and tools  |
| You want best performance on animations      | **Flutter**      | Built-in engine gives smoother UI        |
| You need many libraries or third-party tools | **React Native** | More mature, older community             |
| You want to support **web and desktop** too  | **Flutter**      | One codebase for everything              |
| You want to build fast MVP or prototype      | **React Native** | Fast with Expo and JS skills             |
| You care about smaller app size              | **React Native** | Flutter’s engine adds to app size        |
| Team has JavaScript experience               | **React Native** | No need to learn Dart                    |
| Team wants long-term performance/custom UI   | **Flutter**      | Better structure and speed               |


## Q1. Can React Native Build Web & Desktop Apps?
Yes, but with help:
- Web: Use react-native-web to run the same code in browsers.
- Desktop: Use react-native-windows and react-native-macos for desktop apps.
- Not as smooth or powerful as Flutter or React for web.

 ##Q2. What is Expo?
Expo is a toolkit built on top of React Native that makes it super easy to build and test mobile apps — even if you don’t know native code.

what it offers:
| Feature      | Description                                              |
| ------------ | -------------------------------------------------------- |
| Fast Setup   | Create apps instantly with one command                   |
| Easy Testing | Use Expo Go app to view your app live                    |
| Native APIs  | Camera, GPS, Notifications, etc. — no native code needed |
| Build Tools  | Build APKs without Android Studio using `eas build`      |
| Web Support  | You can run the same app on Web using `expo start --web` |

###🧰 7. How to Make a Ready-Made App Using Expo
Steps:
1.Install Expo CLI
2.Run expo init my-app
3.Edit App.js to build your UI (e.g., To-Do list)
4. Run expo start and scan the QR using Expo Go
5. See live preview and make changes instantly
6. Optionally, build .apk or publish using eas build

## 🧠 TL;DR (Too Long, Didn't Read)
- Flutter = Google’s UI toolkit (Dart) = best for custom, beautiful apps on many platforms.
- React Native = Facebook’s framework (JS) = great if you know React, good for mobile.
- Expo = A shortcut tool to build React Native apps faster without native code.

### 🎨 What is Skia?
Skia is a 2D graphics rendering engine used by Flutter to draw everything you see on the screen — buttons, text, images, animations, etc.

🔍 In Simple Words:
- Imagine Skia as a digital paintbrush that Flutter uses to draw your app.
- Instead of using native Android or iOS UI elements, Flutter draws its own UI from scratch using Skia.
- That’s why Flutter apps look and behave the same across all platforms.

✅ Why Skia is Important in Flutter:
| Feature       | Benefit                                   |
| ------------- | ----------------------------------------- |
| Fast drawing  | Smooth animations, high FPS               |
| Consistent UI | Looks the same on Android, iOS, Web, etc. |
| Custom design | Full control over every pixel             |

###🌉 What is a Bridge (in React Native)?
In React Native, the Bridge is a system that allows JavaScript code to talk to native Android/iOS code.

🔍 In Simple Words:
- React Native runs your app logic in JavaScript.
- But Android and iOS use native code (Java/Kotlin or Swift/Objective-C).
- The bridge connects these two worlds — like a translator between JavaScript and native code.

🔁 Example:
When your app says:
"Alert.alert("Hello!")""
- What happens behind the scenes:
- JS sends a message through the bridge to native code.
- Native code shows a real alert dialog.
- If there's a response, it’s sent back to JS via the bridge.

⚠️ Why the Bridge Matters:

| Feature       | React Native                                                                      |
| ------------- | --------------------------------------------------------------------------------- |
| Communication | Needs the JS-to-native bridge                                                     |
| Performance   | Can slow down if too many calls cross the bridge (e.g., animations or large data) |
| UI            | Uses real native UI components                                                    |

Flutter vs React native ( skia vs bridg):
| Feature        | **Flutter**                      | **React Native**                            |
| -------------- | -------------------------------- | ------------------------------------------- |
| Drawing Engine | Uses **Skia** to draw everything | Uses **native UI components**               |
| Communication  | No bridge needed, all in Dart    | Needs **Bridge** to connect JS ↔ Native     |
| Performance    | Very fast, fewer layers          | Slight delay due to bridge (in heavy tasks) |
| UI Consistency | Looks the same everywhere        | Depends on platform (iOS, Android)          |

##🎨 What is a Graphics Engine?
A graphics engine is a special part of a system or tool that draws things on the screen — like buttons, text, images, shapes, animations, and even games.

🧱 Imagine This:
- You are making an app or game. You tell the app:
- “Show a red square with white text in the center.”
- But how does that actually appear on your screen?
- That job is done by the graphics engine — it's like an artist inside your phone that paints everything you see.

##What does a graphic engine do?
| Task                  | Example                                  |
| --------------------- | ---------------------------------------- |
| 🖼️ Draw shapes       | Circles, squares, buttons                |
| 📝 Draw text          | “Hello World” in bold and color          |
| 📷 Show images        | Photos, icons, logos                     |
| 🎞️ Handle animations | Fade in/out, move, rotate                |
| 📏 Manage pixels      | Control what shows where and how clearly |

🎨 Example: Skia (Flutter’s Graphics Engine)
- Skia is the graphics engine that Flutter uses.
- It draws the entire app UI from scratch (not using native Android or iOS components).
- This gives Flutter the power to make custom, beautiful, and consistent UIs on all platforms.

*/