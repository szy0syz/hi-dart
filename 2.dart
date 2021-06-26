class Strings {
  static const welcome = 'Welcome';
  static const signIn = 'Sign In';
  static String greet(String name) => 'Hi, $name';

  // 实例方法
  void foo() {
    print(welcome);
  }
}

void main() {
  print(Strings.welcome);
  print(Strings.greet('jerry'));
}
