/*
 The Builder interface specifies methods for creating the different parts of
 the Product objects.
*/
abstract class Builder {
  void producePartA();
  void producePartB();
  void producePartC();
}

/*
 The Concrete Builder classes follow the Builder interface and provide
 specific implementations of the building steps. Your program may have several
 variations of Builders, implemented differently.
*/
class ConcreteBuilder1 implements Builder {
  late Product1 _product;

  /*
    A fresh builder instance should contain a blank product object, which is
    used in further assembly.
  */
  ConcreteBuilder1() {
    reset();
  }

  void reset() {
    _product = Product1();
  }

  /*
    All production steps work with the same product instance.
  */
  @override
  void producePartA() {
    _product.parts.add("PartA1");
  }

  @override
  void producePartB() {
    _product.parts.add("PartB1");
  }

  @override
  void producePartC() {
    _product.parts.add("PartC1");
  }

  Product1 getProduct() {
    final result = _product;
    reset();
    return result;
  }
}

/*
  It makes sense to use the Builder pattern only when your products are quite
  complex and require extensive configuration.
 
  Unlike in other creational patterns, different concrete builders can produce
  unrelated products. In other words, results of various builders may not
  always follow the same interface.
*/
class Product1 {
  List<String> parts = <String>[];

  void listParts() {
    print("Product parts: ${parts.join(", ")}\n");
  }
}

/*
  The Director is only responsible for executing the building steps in a
  particular sequence. It is helpful when producing products according to a
  specific order or configuration. Strictly speaking, the Director class is
  optional, since the client can control builders directly.
*/
class Director {
  late Builder _builder;

  /*
    The Director works with any builder instance that the client code passes
    to it. This way, the client code may alter the final type of the newly
    assembled product.
  */
  void setBuilder(Builder builder) {
    _builder = builder;
  }

  /*
    The Director can construct several product variations using the same
    building steps.
  */
  void buildMinimalViableProduct() {
    _builder.producePartA();
  }

  void buildFullFeaturedProduct() {
    _builder.producePartA();
    _builder.producePartB();
    _builder.producePartC();
  }
}

/*
  The client code creates a builder object, passes it to the director and then
  initiates the construction process. The end result is retrieved from the
  builder object.
*/
void clientCode(Director director) {
  final builder = ConcreteBuilder1();
  director.setBuilder(builder);

  print("Standard basic product:");
  director.buildMinimalViableProduct();
  builder.getProduct().listParts();

  print("Standard full featured product:");
  director.buildFullFeaturedProduct();
  builder.getProduct().listParts();
}

void main(List<String> arguments) {
  final director = Director();
  clientCode(director);
}
