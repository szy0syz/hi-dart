Stream<int> countStream(int n) async* {
  for (var i = 0; i < n; i++) {
    await Future.delayed(Duration(seconds: 1));
    // 这里可以加各种异步
    // await Future.delayed(Duration(seconds: 1));
    // print(i);
    // 我们可以在一个函数内用 Stream generators 在未来的时间里来获取多个异步值
    yield i;
  }
}

Future<void> main() async {
  // final stream = Stream.fromIterable([1,2,3]);
  final stream = countStream(5);

  final doubles = stream.map((value) => value * 2).where((value) => value > 0);
  print(doubles);
  await doubles.forEach(print);
}
