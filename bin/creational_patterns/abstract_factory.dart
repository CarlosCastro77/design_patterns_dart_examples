abstract class AbstractFactory {
  AbstractProductA createProductA();
  AbstractProductB createProductB();
}

class ConcreteFactory1 implements AbstractFactory {
  @override
  createProductA() {
    return ConcreteProductA1();
  }

  @override
  AbstractProductB createProductB() {
    return ConcreteProductB1();
  }
}

class ConcreteFactory2 implements AbstractFactory {
  @override
  AbstractProductA createProductA() {
    return ConcreteProductA2();
  }

  @override
  AbstractProductB createProductB() {
    return ConcreteProductB2();
  }
  
}

abstract class AbstractProductA {
  String usefulFunctionA();
}

class ConcreteProductA1 implements AbstractProductA {
  @override
  String usefulFunctionA() {
    return "The result of the product A1.";
  }
}

class ConcreteProductA2 implements AbstractProductA {
  @override
  String usefulFunctionA() {
    return "The result of the product A2.";
  }
}

abstract class AbstractProductB {
  String usefulFunctionB();

  String anotherUsefulFunctionB(AbstractProductA collaborator);
}

class ConcreteProductB1 implements AbstractProductB {
  @override
  String usefulFunctionB() {
    return "The result of the product B1.";
  }

  @override
  String anotherUsefulFunctionB(AbstractProductA collaborator) {
    final result = collaborator.usefulFunctionA();
    return "The result of the B1 collaborating with the ($result)";
  }
}

class ConcreteProductB2 implements AbstractProductB {
  @override
  String usefulFunctionB() {
    return "The result of the product B2.";
  }

  @override
  String anotherUsefulFunctionB(AbstractProductA collaborator) {
    final result = collaborator.usefulFunctionA();
    return "The result of the B2 collaborating with the ($result)";
  }
}

void clientCode(AbstractFactory factory) {
  final productA = factory.createProductA();
  final productB = factory.createProductB();
  
  print(productB.usefulFunctionB());
  print(productB.anotherUsefulFunctionB(productA));
}

void main(List<String> arguments) {
  print("Client: Testing client code with the first factory type...");
  clientCode(ConcreteFactory1());

  print("");
  
  print("Client: Testing the same client code with the second factory type...");
  clientCode(ConcreteFactory2());
}
