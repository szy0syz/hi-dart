abstract class Widget {}

class Text extends Widget {
  Text(this.text);

  final String text;
}

class Button extends Widget {
  Button({required this.child, this.onPressed});

  final Widget child;
  final void Function()? onPressed;
}

void main() {
  // Button class doesn't know what it's child looks like.
  final button =
      Button(child: Text('Hello'), onPressed: () => print('button pressed!'));
  // Button: Scalable approach, Use composition to create complex UIs
}
