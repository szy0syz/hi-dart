void main() {
  Map<String, dynamic> person = {'name': "Jerry", 'age': 18, 'height': 180};

  print(person);

  var person2 = <String, dynamic>{
    'name': "Jerry2",
    'age': 18,
  };
  print(person2);

  var name = person["name"];
  print(name);

  person["likesPizza"] = true;
  print(person);

  // for (var item in person) {}

  for (var key in person.keys) {
    print(key);
    print(person[key]);
  }

  for (var value in person.values) {
    print(value);
  }

  for (var entry in person.entries) {
    print('${entry.key}: ${entry.value}');
  }
}
