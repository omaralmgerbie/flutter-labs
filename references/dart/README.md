## Dart reference

in this file you will find the basic syntax of dart programming language.

### Table of Contents

- [Dart reference](#dart-reference)
  - [Table of Contents](#table-of-contents)
  - [Variables](#variables)
  - [Data Types](#data-types)
  - [Operators](#operators)
  - [Conditional Statements](#conditional-statements)
  - [Loops](#loops)
  - [Functions](#functions)
  - [Data Structures](#data-structures)
- [Exceptions](#exceptions)
- [Generics](#generics)
- [Libraries](#libraries)
- [Packages](#packages)
- [Asynchronous Programming](#asynchronous-programming)
  - [Streams](#streams)
- [Miscellaneous](#miscellaneous)
- [Resources](#resources)
- [Repository Structure](#repository-structure)
- [Disclaimer](#disclaimer)

### Variables

* mutable variables:
  the mutable variables are declared using the `var` keyword, or by declaring the type of the variable.
  
```dart
// in this line the `age` is assigned the type of `int` and the value of `20`
var age = 20;
// or you can declare the type of the variable
int age = 20;

// in this line the `name` is assigned the type of `String` and the value of `'John Doe'`
String name = 'John Doe';
```

* immutable variables:
  the immutable variables are declared using the `final` or `const` keyword.
  
```dart
// in this line the `age` is assigned the type of `int` and the value of `20`
final age = 20;
// or you can declare the type of the variable
final int age = 20;

// in this line the `name` is assigned the type of `String` and the value of `'John Doe'`
const String name = 'John Doe';
// const's are implicitly final and can only be be assigned with another constant value or a literal. i.e.
const String name = 'John Doe'; // 'John Doe' is a literal value and can be assigned to a const variable
const String name = getName(); // getName() is a function call and can't be assigned to a const variable
```



### Data Types
In Dart, variables must be declared with a specific data type. The data type tells Dart what kind of values the variable can hold. Below are examples of some basic data types in Dart, which are foundational for programming in this language.

```dart
// Integer (int)
// Represents whole numbers without a decimal point.
// Commonly used for counting, indexing, and operations that require whole numbers.
int age = 20;

// Double (double)
// Represents numbers with a decimal point, allowing for fractions and precise measurements.
// Essential for calculations that need more accuracy than whole numbers provide.
double pi = 3.14;

// String (String)
// Represents a sequence of characters, or text. Strings are enclosed in single or double quotes.
// Used for storing and manipulating text such as names, messages, or any other kind of textual data.
String name = 'John Doe';

// Boolean (bool)
// Represents a truth value, which can be either true or false.
// Booleans are fundamental in control structures, like if-else statements, to determine the flow of a program.
bool isTrue = true;
```

### Operators

Dart supports various operators for performing operations on variables and values. These operators include arithmetic, comparison, logical, and assignment operators, among others.

```dart
int a = 10;
int b = 20;

// Addition
int sum = a + b;

// Subtraction
int difference = a - b;

// Multiplication
int product = a * b;

// Division
double quotient = b / a;

// Modulus (remainder)
int remainder = b % a;

// Increment
a++; // a becomes 11

// Decrement
b--; // b becomes 19
```

### Conditional Statements

Dart provides conditional statements like `if`, `else if`, and `else` and `switch` to control the flow of a program based on certain conditions.

```dart
int number = 10;

// If-Else statement
if (number > 0) {
  print('Number is positive');
} else if (number < 0) {
  print('Number is negative');
} else {
  print('Number is zero');
}

// Switch statement
String grade = 'A';

switch (grade) {
  case 'A':
    print('Excellent');
    break;
  case 'B':
    print('Good');
    break;
  case 'C':
    print('Fair');
    break;
  default:
    print('Invalid grade');
}
```

### Loops

Dart supports `for`, `while`, and `do-while` loops for iterating over a sequence of elements or executing a block of code repeatedly.

```dart
// For loop
for (int i = 0; i < 5; i++) {
  print('hello ${i + 1}');
}

// While loop
int j = 0;
while (j < 5) {
  print('world ${j + 1}');
  j++;
}

// Do-While loop
int k = 0;
do {
  print('dart ${k + 1}');
  k++;
} while (k < 5);
```

### Functions

Functions in Dart are blocks of code that can be named and reused. They can take input parameters and return output values.

```dart
// Function with return type
void sayHello(String name) {
  print('Hello, $name!');
}

sayHello('John Doe');
```

in dart functions are first-class objects, which means they can be assigned to variables, passed as arguments, and returned from other functions.

```dart
// Function assigned to a variable
var greet = (String name) => print('Hello, $name!');
greet('Jane Doe');
```

### Data Structures

Dart provides built-in data structures like `List`, `Set`, and `Map` for storing collections of elements.

```dart
// List
List<int> numbers = [1, 2, 3, 4, 5];
// Set
Set<int> uniqueNumbers = {1, 2, 3, 4, 5};
// Map
Map<String, String> user = {
  'name': 'John Doe',
  'email': 'john@doe.com',
};
```
all of these data structures are generic, which means they can hold elements of a specific type.

also they are mutable, which means you can add, remove, and update elements in them.
```dart
// Adding elements
numbers.add(6);
uniqueNumbers.add(6);
user['age'] = '30';
```

the base class for all of these data structures is `Iterable`.
which means you can iterate over them using a `for-in` loop, `map` and `reduce` and `forEach` functions can be used on them.

```dart
// Iterating over a List
for (var number in numbers) {
  print(number);
}

// Iterating over a Set using `forEach`
uniqueNumbers.forEach((number) => print(number));

// Iterating over a Map using `forEach`
user.forEach((key, value) => print('$key: $value'));

// Using `map` to transform a List
var doubledNumbers = numbers.map((number) => number * 2).toList();
print(doubledNumbers); // [2, 4, 6, 8, 10, 12]
```


## Exceptions

Dart provides exception handling using `try`, `catch`, and `throw` blocks to handle errors and unexpected situations in code.

```dart
// Throwing an exception if age is less than 18
void checkAge(int age) {
  if (age < 18) {
    throw Exception('Not old enough');
  } else {
    print('Welcome!');
  }
}

// Catching the exception and printing the error message
try {
  checkAge(17);
} catch (e) {
  print(e);
}
```

## Generics

Dart supports generics, which allow you to write reusable code that works with different data types.

```dart
// List can contain elements of any type or just one type using generics
// Here, List<int> specifies that the list can only contain integers
List<int> intList = [1, 2, 3];
// Here, List<String> specifies that the list can only contain strings
List<String> stringList = ['hello', 'world'];

// Generic function that can add elements to a list of any type
void add<T>(List<T> list, T value) {
  list.add(value);
}

add(intList, 4);
add(stringList, 'dart');
```

## Libraries

To use a library in Dart, you can import it using the `import` statement.

```dart
import 'dart:math';

void main() {
  print(sqrt(4)); // 2.0
}
```

## Packages

Dart packages can be imported using the `pub` package manager. For example, to use the `http` package:

```dart
import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.parse('https://example.com');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
}
```

## Asynchronous Programming

Dart supports asynchronous programming using `Future` and `async`/`await` keywords to handle operations that take time to complete, such as network requests.

```dart
// Simulating a network request that takes 2 seconds
Future<String> fetchUserOrder() => Future.delayed(Duration(seconds: 2), () => 'Cappuccino');

void main() async {
  print('Fetching user order...');
  var order = await fetchUserOrder();
  print('Your order is: $order');
}
```

### Streams

Dart also supports streams, which are sequences of asynchronous events. You can listen to a stream to handle events as they occur.

```dart
import 'dart:async';

void main() {
  var controller = StreamController<int>();

  var subscription = controller.stream.listen((data) {
    print('Data: $data');
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);

  controller.close();
}
```

or you can use the `async*` keyword to create a generator function that yields values asynchronously.

```dart
Stream<int> countStream(int n) async* {
  for (int i = 1; i <= n; i++) {
    yield i;
  }
}

void main() async {
// Using the `await for` loop to listen to the stream
  await for (var value in countStream(3)) {
    print(value);
  }

// or you can use the `listen` function
  countStream(3).listen((value) {
    print(value);
  });
}
```

## Miscellaneous

Dart also supports features like mixins, extension methods, and named constructors which allow for more flexible and powerful code design.

## Resources

- [Official Dart Documentation](https://dart.dev/guides)
- [Dart Packages](https://pub.dev/)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

## Repository Structure

This repository is structured to provide a clear and concise reference to Dart programming concepts, categorized by topics.

## Disclaimer

The information provided in this reference is for educational purposes only. We strive to keep the information up to date and correct.