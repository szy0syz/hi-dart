void main() {
  // 在 runtime，很容易出现下面这样情况，此时如果调用null上的一些字符串方法就崩了
  // const cities = <String>['London', 'Paris', null];

  const cities = <String?>['London', 'Paris', null];

  for (var city in cities) {
    print(city?.toUpperCase());
  }
}
