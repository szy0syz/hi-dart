Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}

Future<int> sumStream2(Stream<int> stream) =>
    stream.reduce((previous, element) => previous + element);

Stream<int> countStream(int n) async* {
  for (var i = 0; i < n; i++) {
    // 这里可以加各种异步
    // await Future.delayed(Duration(seconds: 1));
    // print(i);
    // 我们可以在一个函数内用 Stream generators 在未来的时间里来获取多个异步值
    yield i;
  }
}

Iterable<int> count(n) sync* {
  for (var i = 0; i < n; i++) {
    // *
    // await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  final stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);
  final sum = await sumStream(stream);
  print("Sum: $sum");

  // -----
  final stream2 = countStream(6); // 0+1+2+3+4+5
  final sum2 = await sumStream(stream2);
  print(sum2);

  // -----
  final cc = count(10);
  print(cc);
}
