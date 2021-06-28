class Product {
  // 加了花括号不是可选的意思，是按对象传进来，而且各个是必填
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  // 面向对象的写法
  String get displayName => '($initial)${name.substring(1)}: \$$price';
  String get initial => name.substring(0, 1);
}
