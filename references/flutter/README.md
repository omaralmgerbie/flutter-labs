### Flutter reference

In this file, you will find the basics of the Flutter framework, including its structure and components.

To get started with Flutter, make sure you have the Flutter SDK installed on your machine. You can download it from the official Flutter website.

### Table of Contents

- [Flutter reference](#flutter-reference)
- [Table of Contents](#table-of-contents)
- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Widgets](#widgets)
  - [Single Child Widgets](#single-child-widgets)
  - [Multi Child Widgets](#multi-child-widgets)
  - [Layout Widgets](#layout-widgets)
  - [Scrolling Widgets](#scrolling-widgets)
  - [Material Components](#material-components)
- [State Management](#state-management)
- [Routing and Navigation](#routing-and-navigation)
- [Packages and Plugins](#packages-and-plugins)
- [Updating Dependencies](#updating-dependencies)
- [Materials and Resources](#materials-and-resources)

### Introduction

Welcome to the Flutter reference guide! In this document, you will find all the essential information about the Flutter framework, its structure, and its components.

### Getting Started

To begin using Flutter, you need to have the Flutter SDK installed on your machine. If you haven't installed it yet, you can download it from the official Flutter website.

Once you have the Flutter SDK installed, you can create a new Flutter project by running the following command in your terminal:

```
flutter create my_flutter_app
```

This command will generate a new directory called `my_flutter_app` with the basic structure of a Flutter project.

Next, navigate to the project directory:

```
cd my_flutter_app
```

Now, you can open the project in your favorite code editor and start building your Flutter app.

### Widgets

Flutter uses a declarative UI approach, where you describe the desired UI using widgets. Widgets are the building blocks of a Flutter app, and they can be combined to create complex UIs.

To learn more about Flutter widgets and how to use them, refer to the official Flutter documentation. It provides detailed explanations and examples for each widget.

Here are some common types of widgets in Flutter:

#### Single Child Widgets

- `Container`: A widget that allows you to customize its appearance, such as color, padding, and border.
- `Button`: A widget that represents a clickable button.
- `SizedBox`: A widget that provides a fixed size box.
- `Padding`: A widget that adds padding around its child widget.
- `Center`: A widget that centers its child widget.
- `Align`: A widget that aligns its child widget within itself.
- `Expanded`: A widget that expands its child widget to fill the available space.
- `ColoredBox`: A widget that fills its area with a solid color.
- `Opacity`: A widget that makes its child widget partially transparent.
- `DecoratedBox`: A widget that paints a decoration behind its child widget.

#### Multi Child Widgets

- `Row`: A widget that arranges its children in a horizontal line.
- `Column`: A widget that arranges its children in a vertical line.
- `ListView`: A widget that displays a scrollable list of children.
- `GridView`: A widget that displays a grid of children.
- `Stack`: A widget that overlays its children on top of each other.
- `Wrap`: A widget that wraps its children to the next line if they overflow.
- `Table`: A widget that displays its children in a table layout.
- `Flow`: A widget that arranges its children in a flow layout.

#### Layout Widgets

- `Padding`: A widget that adds padding around its child widget.
- `Center`: A widget that centers its child widget.
- `Align`: A widget that aligns its child widget within itself.
- `Expanded`: A widget that expands its child widget to fill the available space.
- `Flexible`: A widget that controls how a child widget flexes within a `Row` or `Column`.
- `Spacer`: A widget that creates an empty space between its siblings.
- `AspectRatio`: A widget that enforces a specific aspect ratio on its child widget.
- `ConstrainedBox`: A widget that imposes additional constraints on its child widget.
- `FractionallySizedBox`: A widget that sizes its child widget as a fraction of the available space.
- `IntrinsicHeight`: A widget that forces its child widget to have the same height as its tallest child.
- `IntrinsicWidth`: A widget that forces its child widget to have the same width as its widest child.
- `LimitedBox`: A widget that limits the maximum size of its child widget.
- `Offstage`: A widget that hides its child widget without removing it from the tree.
- `OverflowBox`: A widget that allows its child widget to overflow its constraints.
- `SizedBox`: A widget that provides a fixed size box.
- `Transform`: A widget that applies a transformation to its child widget.
- `CustomSingleChildLayout`: A widget that customizes the layout of its child widget.
- `CustomMultiChildLayout`: A widget that customizes the layout of multiple child widgets.

#### Scrolling Widgets

- `SingleChildScrollView`: A widget that allows its child widget to be scrolled vertically.
- `ListView`: A widget that displays a scrollable list of children.
- `GridView`: A widget that displays a grid of children.
- `NestedScrollView`: A widget that allows for nested scrolling behaviors.
- `CustomScrollView`: A widget that allows for custom scrolling behaviors.
- `Scrollable`: A widget that provides low-level control over scrolling.
- `NotificationListener`: A widget that listens for scroll notifications.
- `RefreshIndicator`: A widget that adds pull-to-refresh functionality to a scrollable widget.
- `SliverAppBar`: A widget that provides an app bar that can expand and collapse.
- `SliverList`: A widget that displays a scrollable list of children within a `CustomScrollView`.

#### Material Components

Flutter provides a set of Material Design widgets that implement the Material Design guidelines. These widgets include buttons, cards, dialogs, and more. To use these widgets, you need to import the `material.dart` library.

Here are some common Material Design widgets in Flutter:

- `AppBar`: A widget that represents the app bar at the top of the screen.
- `BottomNavigationBar`: A widget that provides a navigation bar at the bottom of the screen.
- `FloatingActionButton`: A widget that represents a floating action button.
- `Drawer`: A widget that provides a side drawer for navigation.
- `SnackBar`: A widget that displays a brief message at the bottom of the screen.
- `TabBar`: A widget that provides a tab bar for switching between tabs.
- `Card`: A widget that represents a card with rounded corners.
- `Chip`: A widget that represents a chip with an optional avatar and label.
- `Dialog`: A widget that displays a dialog box with content.
- `Tooltip`: A widget that displays a tooltip when the user long-presses on a widget.
- `PopupMenuButton`: A widget that displays a popup menu when the user taps on it.
- `Slider`: A widget that allows the user to select a value from a range.
- `Switch`: A widget that represents a switch with an on/off state.
- `TextField`: A widget that allows the user to enter text.
- `DatePicker`: A widget that allows the user to select a date.
- `TimePicker`: A widget that allows the user to select a time.
- `Stepper`: A widget that displays a step-by-step process.
- `ExpansionPanel`: A widget that displays a list of expandable panels.
- `SnackBar`: A widget that displays a brief message at the bottom of the screen.
- `Tooltip`: A widget that displays a tooltip when the user long-presses on a widget.

### State Management

State management is an essential aspect of building Flutter apps. Flutter provides several options for managing state, including:

- `setState`: A method that updates the state of a widget and triggers a rebuild.
- `InheritedWidget`: A widget that allows data to be passed down the widget tree.

the difference `StatefulWidget` and `StatelessWidget` is that `StatefulWidget` can change its state during the runtime, while `StatelessWidget` cannot.

### Routing and Navigation

Routing and navigation are crucial for building multi-screen Flutter apps. Flutter provides a `Navigator` class that manages the navigation stack and allows you to push and pop routes.

there two types of navigation in Flutter:

- `Named Routes`: A way to navigate between screens using a route name.
- `Implicit Routes`: A way to navigate between screens without specifying a route name.
  
```dart
// Named Routes
Navigator.pushNamed(context, '/second_screen');

// Implicit Routes
Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
```

passing data between screens in Flutter:

```dart
// Sending Data to a New Screen
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SecondScreen(data: 'Hello from the first screen!'),
  ),
);

// Receiving Data from the Previous Screen
class SecondScreen extends StatelessWidget {
  final String data;

  SecondScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(child: Text(data)),
    );
  }
}


// Returning Data from a Screen
Navigator.pop(context, 'Hello from the second screen!');

// Receiving Returned Data
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SecondScreen(),
  ),
).then((value) {
  print(value);
});


// passing data using arguments with named routes
Navigator.pushNamed(
  context,
  '/second_screen',
  arguments: 'Hello from the first screen!',
);

// Receiving Data from Named Routes
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(child: Text(data)),
    );
  }
}


// Returning Data from Named Routes
Navigator.pop(context, 'Hello from the second screen!');

// Receiving Returned Data from Named Routes
Navigator.pushNamed(
  context,
  '/second_screen',
).then((value) {
  print(value);
});
```

setting up named routes in Flutter:

```dart
// Defining Named Routes
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => FirstScreen(),
    '/second_screen': (context) => SecondScreen(),
  },
);

// or using onGenerateRoute
MaterialApp(
  initialRoute: '/',
  onGenerateRoute: (settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => FirstScreen());
      case '/second_screen':
        return MaterialPageRoute(builder: (context) => SecondScreen());
      default:
        return MaterialPageRoute(builder: (context) => NotFoundScreen());
    }
  },
);

```


### Packages and Plugins

In addition to widgets, Flutter also provides a rich set of packages and plugins that you can use to enhance your app. You can find a wide range of packages on the official Flutter pub.dev website.

To add a package to your Flutter project, you need to specify it in the `pubspec.yaml` file. After adding the package, run the following command in your project directory to fetch the dependencies:

```
flutter pub get
```

### Updating Dependencies

It's important to regularly update your Flutter dependencies to ensure you have the latest features and bug fixes. You can do this by running the following command in your project directory:

```
flutter pub upgrade
```

Make sure to check the release notes of each dependency before upgrading to understand any breaking changes or new features.

That's it! You now have a basic understanding of Flutter!

### Materials and Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Flutter Widget of the Week](https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG)
- [Flutter Samples](https://flutter.dev/docs/cookbook)
- [Awesome Flutter](https://github.com/Solido/awesome-flutter)
- [Flutter Community](https://flutter.dev/community)
- [Flutter on GitHub](https://github.com/flutter/flutter)

