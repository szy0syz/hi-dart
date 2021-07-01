Future<String> fetchUserOrder() =>
    Future.delayed(Duration(seconds: 2), () => "~Cafe~"
        // () => throw Exception('Out of mile'),
        );

Future<String> fetchUserOrder2() => Future.value('Jerry');

Future<String> fetchUserOrder3() => Future.error(Exception("Out of mile"));

void main() async {
  print('Program started');
  fetchUserOrder()
      .then((value) => print(value))
      .catchError((error) => print(error))
      .whenComplete(() => print('Done'));

  // -> Unhandled exception
  try {
    final order = await fetchUserOrder();
    print(order);

    final order2 = await fetchUserOrder2();
    print(order2);
  } catch (e) {
    print(e);
  } finally {
    print('~Done~');
  }
}
