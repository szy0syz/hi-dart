class Complex {
  const Complex(this.re, this.im);
  const Complex.zero()
      : re = 0,
        im = 0;
  const Complex.identity()
      : re = 0,
        im = 0;
  const Complex.real(this.re) : im = 0;
  const Complex.imaginary(this.im) : re = 0;

  final double re;
  final double im;
}

void main() {
  const zero = Complex.zero();

  final identity = Complex.identity();

  // 实数: a+i*0
  final real = Complex.real(3);

  // 虚数 0+i*b
  final imaginary = Complex.imaginary(4);
}
