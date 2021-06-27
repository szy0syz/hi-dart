class Animal {
  Animal({required this.age});

  final int age;

  void sleep() => print('sleep');
  void move() => print('move');
  void eat() => print('eat');
}

class Dog extends Animal {
  Dog({required int age}) : super(age: age);

  void bark() => print('bark');

  @override
  void sleep() {
    // sleep(); -> ❌ 千万别这样调用，否则会无线递归调用自己
    super.sleep();
    print('dog: sleep');
  }
}

class Cow extends Animal {
  Cow({required int age}) : super(age: age);

  void moo() => print('moo');
}

class CleverDog extends Dog {
  CleverDog({required int age}) : super(age: age);

  void catchBall() => print('catch');
}

void main() {
  final animal = Animal(age: 10);
  animal.sleep();

  final dog = Dog(age: 11);
  dog.sleep();
  dog.bark();

  final cow = Cow(age: 12);
  cow.sleep();
  cow.moo();

  final celverDog = CleverDog(age: 13);
  celverDog.sleep();
  celverDog.catchBall();
}
