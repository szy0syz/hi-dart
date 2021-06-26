void main() {
  const list = [1, 2, 3, 4, 5];

  final even = list.where((value) => value % 2 == 0);
  print(even);

  final value = list.firstWhere((x) => x == 14, orElse: () => -1);
  print(value);
}
