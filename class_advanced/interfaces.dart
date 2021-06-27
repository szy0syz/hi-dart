abstract class InterfaceA {
  void a();
}

abstract class InterfaceB {
  void b();
}

class AB implements InterfaceA, InterfaceB {
  @override
  void a() {
    print('a');
  }

  @override
  void b() {
    print('b');
  }
}

abstract class Base {
  void foo(); // -> 抽象方法
  void bar() => print('bar');
}

class Subclass extends Base {
  @override
  void foo() => print('foo');
}
