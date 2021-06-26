# hi-dart

![01](assets/01.png)

## lesson 12 String interpolation

```dart
void main() {
  String name = "jerry";
  int age = 18;
  double height = 1.80;
  bool likesDart = true;

  print("My name is $name. I'm $age years old. I'm $height meters tall.");

  print("plus = ${age + height}");
}
```

## lesson 13 String Escaping

```dart
void main() {
  int a = 10;
  print("$a"); // -> 10
  print("\$a"); // -> $a
  print("\$$a"); // -> $10
}
```

## lesson 14 Multi-line strings

> 直接连着单引号或者三个双引号!

```dart
void main() {
  print('This is a short sentence.\n'
       'This is a longer sentence, I dare say.\n'
       'This is even longer sentence, which will not fit inside a single line.'
  );
}
```

```dart
void main() {
  String s = """
This is a short sentence.
This is a longer sentence, I dare say.
This is even longer sentence, which will not fit inside a single line.
""";

  print(s);
}
```

> 语法糖竟然那么甜！

## lesson 18 Finding and replacing strings

```dart
void main() {
  String title = "I love pizza";
  bool containsPazza = title.contains('pizza');
  print(containsPazza);
  String lovePasta = title.replaceAll('pizza', 'pasta');
  print(lovePasta);
}
```

### lesson 19 Conversations between types

- 不要企图转换非法类型的值，否则一样抛异常！

```dart
void main() {
  String ratingString = '4.5';
  double tating = double.parse(ratingString);
  print(tating);

  String helloString = 'hello';
  print(double.parse(helloString));
}
```

## lesson 20 Arithmetic operators

![02](assets/02.png)

## lesson 21 Exercise: temperature conversion

```dart
void main() {
  double tempFarenheit = 88.88;
  double tempCelsius = (tempFarenheit - 32) / 1.8;

  print('${tempFarenheit}°F = ${tempCelsius.toStringAsFixed(2)}°C');
}
```

## lesson 23 Logical & Relational operators

```dart
void main() {
  print(5 == 2);
  print(5 != 2);
  print(5 >= 2);
  print(5 > 2);
  print(5 <= 2);
  print(5 < 2);

  print(5 < 2.5);   // -> false
  print(5 < 'hi');  // -> ❌ Error: Compilation failed.
}
```

## lesson 25 Hex format, bitwise & shifting operators

```dart
void main() {
  int x = 0xF0; // binary: 111000
  int y = 0x0F; // binary: 000111

  print((x | y).toRadixString(2));    // -> 11111111
  print((x | y).toRadixString(16));   // -> ff
  print((x ^ y).toRadixString(2));   // -> 0
    print((~y).toRadixString(2));
}
```

## lesson 28 Dart Type System

- Static vs dynamic languages
- Type Infernce
- `var`, `final`, `const`, `dynamic` keywords

## leeson 29 Compile

![01](assets/03.png)

Static languages: advantages

- Discover type-related bugs at compile time
  - Huge time saver => hard to discover runtime bugs in big projects
- More readable code
  - Rely on variables having the type they were declared with
- More maintainable code
  - When you change someting, type system warns you about things that break
- Compiled code is more effieient
  - compiler knows more and can optimise things

## lesson 31

- final means `read-only` (can only be set once);
- perfer `final` to `var` whenever possible
- 对，尽可能地使用 `final` 而不是用 `var`

```dart
void main() {
  var name = 'Jerry';
  var age = 30;
  var height = 1.88;

  final newAge = 31;
  newAge = 32; // line 7 • The final variable 'newAge' can only be set once.
}
```

## lesson 32 const

- const defines a `compile-time constant`
- very good for performance => Dart can optimize generated code
- const 的变量只能被赋值常量，为什么字符串转换也不行！
- 说是 `title.toUpperCase()` 只能在 `runtime` 被执行，在编译时无法确定！
- `var` 倒是随便被赋值多少次都可以！
- `final` 只能被赋值一次
- `const` 只能被赋值编译时的常量 -> `compile-time constants`

> **Best Practice**
>
> **const > final > var**

```dart
void main() {
  const title = "Dart 123";
  const titleUppercaed = title.toUpperCase(); // ❌
  // Const variables must be initialized with a constant value.
  print(titleUppercaed);
}
```

## lesson 33 Exercise: var, final and const

Given the following program:

```dart
void main() {
  String text = 'I like pizza';
  String topping = 'with tomatoes';
  String favourite = '$text $topping';
  String newText = favourite.replaceAll('pizza', 'pasta');
  favourite = 'Now I like curry';
  print(newText);
}
```

Can you guess which variables can be declared as `const`, `final`, and `var`, while still resulting in a valid program?

Remember: prefer `const` over `final` over `var`.

```dart
void main() {
  const text = 'I like pizza';
  const topping = 'with tomatoes';
  String favourite = '$text $topping';
  final newText = favourite.replaceAll('pizza', 'pasta');
  favourite = 'Now I like curry';
  print(newText);
}
```

## lesson 34 The 'dynamic' keyword

- use dynamic to `opt-out` of type safety
- 使用 dynamic 去过类型安全检查？
- `var` 的变量可以多次赋值相同类型的值，但不能跨类型赋值

```dart
void main() {
  var x = 10;
  x = true; // -> ❌  A value of type 'bool' can't be assigned to a variable of type 'int'.

  dynamic y = 10;
  y = true;
}
```

- 🔥 `dynamic` is useful in very specific cases
- for erverthing else, use `var`, `final`, `const`

> 终于乱清楚了 Dart 里的 `var`, `final`, `const`

## lesson 41 'break' and 'continue'

- `for` 循环用 `var` 挺好
- `for (var i = 1; i<=15; i++)`
- Use `break` and `continue` to alter the flow inside `for/while` loops
- Not always necessary (can implement fizz buzz with if/else only)
- Use them as needed

## lesson 43 enumerations

- 用起来很轻松

```dart
enum Medal { gold, silver, bronze }
```

## lesson 44 Exercise: simple calculator

```dart
enum Operation { plus, minus, multiply, divide }

void main() {
  const a = 4;
  const b = 2;
  const op = Operation.plus;

  switch (op) {
    case Operation.plus:
      print('$a + $b = ${a + b}');
      break;
    case Operation.minus:
      print('$a - $b = ${a - b}');
      break;
    case Operation.multiply:
      print('$a + $b = ${a * b}');
      break;
    case Operation.divide:
      print('$a - $b = ${a / b}');
      break;
    default:
      break;
  }
}
```

## Dart Initial

- `https://dart.dev/tools/sdk/archive`
- 解压安装包后将 `bin` 目录固定好
- 修改终端配置，添加环境变量
  - `export PATH=/Users/szy0syz/workspace/dart/dart-sdk/bin:$PATH`
- VSCode plugins
  - `dart`
  - dracula official
  - Bracket Pari Colorizer 2
  - Error Lens

## Project: Rock, Paper & Scissors

![04](assets/04.png)

```dart
enum Move { rock, paper, scissors }
// index: 0,1,2,3...

void main() {
  final rng = Random();
  while (true) {
    stdout.write("Rock, paper or scissors? (r/p/s)");
    final input = stdin.readLineSync();
    if (input == 'r' || input == 'p' || input == 's') {
      // playerMove is declared without an initializer (defaults to null)
      var playerMove;
      if (input == 'r') {
        playerMove = Move.rock;
      } else if (input == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];

      print('You played: $playerMove');
      print('AI played: $aiMove');

      // --- 判断比赛结果 ---
      if (playerMove == aiMove) {
        print("It's a draw");
      } else if (playerMove == Move.rock && aiMove == Move.scissors ||
          playerMove == Move.paper && aiMove == Move.rock ||
          playerMove == Move.scissors && aiMove == Move.paper) {
        print("You win");
      } else {
        print("You lose");
      }
    } else if (input == 'q') {
      break;
    } else {
      print("Invalid input");
    }
  }
}
```

## Collections

> A collection is a group of values that belong together

- Lists, sets, maps
- How to use them, common operations
- Type system & type inference with collections
- Collection-if, collection-for, spreads

- Dart 中 List 照样不能越界
- `[].first` -> ❌
- final  variabs cant be `re-assigned`
- but you can still modify `their contents`

Warp Up

- you can declare list variables as var, final, const
- final, const variables can only be `set once`
- can still `modify` contents of final variables
- but not with const variables
- Sets are collections of `unique` values
- List can contain `deplicate` values

Sets

```dart
var euCountries = {'Italy', "UK", "Russia"};
var asianCountries = {'Inida', 'China'};
euCountries.add("UK");
print(euCountries); // -> {Italy, UK, Russia}
print(euCountries.union(asianCountries));
// -> {Italy, UK, Russia, Inida, China}
print(euCountries.intersection(asianCountries)); // -> {}
print(euCountries.difference(asianCountries));
// -> {Italy, UK, Russia}
```

Map

> JSON

```dart
Map<String, dynamic> person = {'name': "Jerry", 'age': 18, 'height': 180};

var person2 = <String, dynamic>{
  'name': "Jerry2",
  'age': 18,
};

var name = person["name"];
print(name);

person["likesPizza"] = true;
print(person);

// 要是想确定它的类型，好打点的话
var name = person['name'] as String;
```

- 和JS一样的，类似于Object，还能增加额外属性嘛
- 如果你用 `dynamic` 确定map的属性值的类型，那么可以用 `as` 操作符

- 注意 `Map` 上没有迭代器，所以不能使用 `// for (var item in person) {}` 迭代 ❌
- 但可以像 js 那个获取 keys ，通过 keys 来遍历
- 竟然也有 `Map.values` 和 js 的 object 很像

```dart
for (var key in person.keys) {
  print(key);
  print(person[key]);
}

for (var value in person.values) {
  print(value);
}

for (var entry in person.entries) {
  print('${entry.key}: ${entry.value}');
}
```

## lesson 66  Exercise: Pizza Ordering

```dart
void main() {
  const pizzPrices = {'margherita': 5.5, 'pepperoni': 7.5, 'vegetarian': 6.5};
  const order = ['margherita', 'pepperoni', 'hot'];
  var total = 0.0;

  for (var item in order) {
    final price = pizzPrices[item];
    if (price != null) {
      total += price;
    } else {
      print('$item pizza is not on the menu');
    }
  }

  print('Total: \$$total');

  /*
  hot pizza is not on the menu
  Total: $13.0
  */
}
```

## lesson 68 Exercise: Restaurant ratings

```dart
void main() {
  var restaurants = [
    {
      'name': 'Pizza Mario',
      'cuisine': 'Italian',
      'ratings': [5.0, 3.5, 4.5],
    },
    {
      'name': 'Chez Anne',
      'cuisine': 'French',
      'ratings': [5.0, 4.5, 4.0],
    },
    {
      'name': 'Navaratna',
      'cuisine': 'Italian',
      'ratings': [4.0, 4.5, 4.0],
    },
  ];

  for (var restaurant in restaurants) {
    final ratings = restaurant['ratings'] as List<double>;
    var total = 0.0;
    for (var rating in ratings) {
      total += rating;
    }
    final avgRating = total / ratings.length;
    restaurant['avgRating'] = avgRating.toStringAsFixed(2);
    print(restaurant);
  }
}
```

## lesson 69 Collection-if

> 竟然可以在声明集合时用 if

```dart
void main() {
  const addBlue = false;
  const addRed = true;
  const extraColors = ['yellow', 'green'];
  final colors = [
    'grey',
    'brown',
    if (addBlue) 'blue',
    if (addRed) 'red',
  ];
  colors.addAll(extraColors);
  print(colors);
}
```

## lesson 70 Collection-for

```dart
const extraColors = ['yellow', 'green'];
final colors = [
  'grey',
  'brown',
  if (addBlue) 'blue',
  for (var color in extraColors) color,
];
```

## lesson 71 Spreads

```dart
final colors = [
  'grey',
  'brown',
  if (addBlue) 'blue',
  ...extraColors,
];
```

- 到底该怎么用 `Collection-if` / `Collection-for`
- 目前场景就是在一个根据条件生成的新Map时，是直接字面量生成法

```dart
const grans = {
  'rice': '1kg'
}

var shoppingList = {
  if (bann > 0) 'bann': 123,
  if (apples > 0) 'apples': 'ok',
  if (addGrains) ...grans
}
```

### lesson 73 Copying collections

> 和js一样的，用 `Spreads` `...`
>
> 当然还是有 shallow vs deep copy
>
> collections 不能少了 `filter` `map` `reduce`

## Project: Data Processing

- 要点：`Code Defensively`  -> `Fail Gracefully`
- 防御性编程  ->  优雅的处理异常
- Top Tip: Choose `descriptive` names for variables, as the carry more `meaning`
- 给变量取一个有描述意义的名称，这样它讲带来更多意义，使人读起来好理解

```dart
void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart totals.dart <inputFile.csv>');
    exit(1);
  }

  final inputFile = args.first;
  // 要注意FS异常，一般这么做：
  // 先检查文件是否存在，再去读它。
  final lines = File(inputFile).readAsLinesSync();
  final totalDurationByTag = <String, double>{};

  // 不要表头
  lines.removeAt(0);

  var totalDutation = 0.0;
  for (var line in lines) {
    final values = line.split(',');
    final durationStr = values[3].replaceAll('"', '');
    final duration = double.parse(durationStr);
    final tag = values[5].replaceAll('"', '');
    final previousTotal = totalDurationByTag[tag];

    if (previousTotal == null) {
      totalDurationByTag[tag] = duration;
    } else {
      totalDurationByTag[tag] = previousTotal + duration;
    }

    totalDutation += duration;
  }

  for (var entry in totalDurationByTag.entries) {
    final durationFormatted = entry.value.toStringAsFixed(1);
    final tag = entry.key == '' ? 'Unallocated' : entry.key;
    print('$tag: ${durationFormatted}h');
  }

  print('\nTotalDutation: ${totalDutation.toStringAsFixed(1)}h');
}
```

## Null Safty

> nullable & non-nullable types
>
> Null Safty 竟然就是 ? ! ?? 操作符 🥶

```dart
void main(List<String> args) {
  int a = 1;
  int? b;

  print(a + b);  -> ❌
  // The argument type 'int?' can't be assigned to the parameter type 'num'.
}
```

- Flow Analysis: Promotion
- Nullable variables can be promoted to non-nullable
- 我们可以在流程上提前处理 null 的情况

- Flow Analysis: Definite Assignment
- Dart knows for sure when a varible is assigned


```dart
if (b == null) {
  print('a is null');
} else {
  print(a + b);
}
```

- Dart without Null Safety -> Runtime error
- Dart with Null Safety -> Compile-time error
- -> the compiler helps us to write safer programs
- 这难道就是 `Null Safty` 的奥义把！
- `Null Safty` makes us more `productive`
  - great advantage on bigger programs
  - 当然可以在大型项目中带来巨大的优势
- Dart can tell us when we're doing something wrong

## leeson 82 The assertion operator

- 断言操作符 (!)
- 不摆了，就是和ts差不多的
- if you are sure that a nullable variable will always have a non-nullable value,
- it is safe to assign it to a non-nullable variable with the `!` operator.
- but if you are wrong, you will get a runtime error
- `!` is also called the `bang` operator 💥
- 传说中的 💣 `炸弹操作符`，真逗！

## lesson 83 The if-null operator

- `int? maybeValue;`
- `int value = maybeValue == null ? 0 : maybeValue;`
- -> `int value = maybeValue == null ?? 0;`
- -> `maybeValue ??= 0;`

## lesson 84 Null Safety with type inference

```dart
void main() {
  const x = -1;
  var maybeValue;
  if (x > 0) {
    maybeValue = x;
  }
  maybeValue ??= 0;
  final value = maybeValue;
  print(value);
}
```

- Should we use type inference or decalare types explicity?
- 我们到底应该使用类型声明还是多用类型推断？
- initialize variables when you declare them,
- and use type inference
- 建议我们在定义和初始化变量时，可以使用类型推断
- Type inference and Null Safty work well with each other
- 应该使用类型推断和 Null Safty 组合起来用更好

## lesson 85 Null Safety with collections

```dart
void main() {
  // 在 runtime，很容易出现下面这样情况，此时如果调用null上的一些字符串方法就崩了
  // const cities = <String>['London', 'Paris', null];

  const cities = <String?>['London', 'Paris', null];

  for (var city in cities) {
    print(city?.toUpperCase());
  }
}
```

- Calling methods on null variables is a very common mistake -> 赞同 👍

l-80
