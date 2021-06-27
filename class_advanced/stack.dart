class Stack<T> {
  // We created a Stack using a List(composition)
  final List<T> _items = [];

  void push(T item) => _items.add(item);

  T pop() => _items.removeLast();
}

void main() {
  final stack = Stack<int>();

  stack.push(1);
  stack.push(2);

  print(stack.pop());
  print(stack.pop());

  final names = Stack<String>();
  names.push('Jerry');
  names.push('Tom');
}
