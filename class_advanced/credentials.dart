class Credentials {
  const Credentials({this.email = '', this.password = ''});
  final String email;
  final String password;

  Credentials copyWith({String? email, String? password}) {
    return Credentials(
        email: email ?? this.email, password: password ?? this.password);
  }

  @override
  String toString() => 'Credentials($email, $password)';
}

void main() {
  const credentials = Credentials(email: "123@123.com", password: "123123");
  // credentials.email = 'me@example.com';

  final update1 = credentials.copyWith(email: "me@example.com");
}
