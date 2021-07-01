Future<void> countDown(int n) async {
  for (var i = 0; i < n; i++) {
    await Future.delayed(Duration(seconds: 1), () => print(i));
  }
}

Future<void> main() async {
  await countDown(5);
  print("Done");
}
