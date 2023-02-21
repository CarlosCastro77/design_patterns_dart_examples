abstract class Shape {
  int? x;
  int? y;
  String? color;

  Shape();

  Shape.prototype(Shape target) {
    x = target.x;
    y = target.y;
    color = target.color;
  }

  Shape clone();

  @override
  bool operator ==(Object other) =>
    other is Shape &&
    other.x == x &&
    other.y == y &&
    other.color == color;
    
  @override
  int get hashCode => Object.hash(x, y, color);
}

class Rectangle extends Shape {
  int? height;
  int? width;

  Rectangle();

  Rectangle.prototype(Rectangle source) {
    height = source.height;
    width = source.width;
  }
  
  @override
  Shape clone() {
    return Rectangle.prototype(this);
  }

  @override
  bool operator ==(Object other) =>
    other is Rectangle &&
    other.height == height &&
    other.width == width;
    
  @override
  int get hashCode => Object.hash(height, width);
}

class Circle extends Shape {
  int? radius;

  Circle();

  Circle.prototype(Circle target) {
    radius = target.radius;
  }

  @override
  Shape clone() {
    return Circle.prototype(this);
  }

  @override
  bool operator ==(Object other) =>
    other is Circle &&
    other.radius == radius;
    
  @override
  int get hashCode => radius.hashCode;
}

void main(List<String> arguments) {
  List<Shape> shapes = <Shape>[];

  Circle circle = Circle();
  circle.x = 10;
  circle.y = 10;
  circle.radius = 20;
  circle.color = "red";
  shapes.add(circle);

  Circle anotherCircle = circle.clone() as Circle;
  shapes.add(anotherCircle);

  Rectangle rectangle = Rectangle();
  rectangle.height = 20;
  rectangle.width = 10;
  rectangle.color = "blue";
  shapes.add(rectangle);

  businessLogic(shapes);
}

void businessLogic(List<Shape> shapes) {
  List<Shape> shapesCopy = <Shape>[];

  for (Shape shape in shapes) {
    shapesCopy.add(shape.clone());
  }
}