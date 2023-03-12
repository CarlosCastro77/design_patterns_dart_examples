import 'dart:math';

class RoundHole {
  late double _radius;

  RoundHole(double radius) {
    _radius = radius;
  }

  double getRadius() {
    return _radius;
  }

  bool fits(RoundPeg peg) {
    return getRadius() >= peg.getRadius();
  }
}

class RoundPeg {
  late double _radius;

  RoundPeg();

  RoundPeg.withRadius(double radius) {
    _radius = radius;
  }

  double getRadius() {
    return _radius;
  }
}

class SquarePeg {
  late double _width;

  SquarePeg(double width) {
    _width = width;
  }

  double getWidth() {
    return _width;
  }

  double getSquare() {
    return pow(_width, 2).toDouble();
  }
}

class SquarePegAdapter extends RoundPeg {
  late SquarePeg _peg;

  SquarePegAdapter(SquarePeg peg) {
    _peg = peg;
  }

  @override
  double getRadius() {
    return sqrt(pow((_peg.getWidth() /2), 2) * 2);
  }
}

void main(List<String> arguments) {
  RoundHole hole = RoundHole(5);
  RoundPeg peg = RoundPeg.withRadius(5);

  if (hole.fits(peg)) {
    print("Round peg r5 fits round hole r5.");
  }

  SquarePeg smallSquarePeg = SquarePeg(2);
  SquarePeg largeSquarePeg = SquarePeg(20);

  SquarePegAdapter smallSquarePegAdapter = SquarePegAdapter(smallSquarePeg);
  SquarePegAdapter largeSquarePegAdapter = SquarePegAdapter(largeSquarePeg);

  if (hole.fits(smallSquarePegAdapter)) {
    print("Square peg w2 fits round hole r5.");
  }
  if (!hole.fits(largeSquarePegAdapter)) {
    print("Square peg w20 does not fit into round hole r5.");
  }
}
