import 'product.dart';

class Item {
  const Item({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;

  // 相当于一个计算属性，没有实际存在，但你实例化后的实例就是有
  double get price => quantity * product.price;

  @override
  String toString() => '$quantity x ${product.name}: \$$price';
}
