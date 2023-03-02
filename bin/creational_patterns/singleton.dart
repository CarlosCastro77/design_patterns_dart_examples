class Singleton {
  static Singleton? _instance;

  Singleton._();

  factory Singleton() {
    _instance ??= Singleton._();

    return _instance!;
  }
  
  void businessLogic() {}
}

void clientCode() {
  final Singleton s1 = Singleton();
  final Singleton s2 = Singleton();

  if (s1 == s2) {
    print('Singleton works, both variables contain the same instance.');
  } else {
    print('Singleton failed, variables contain different instances.');
  }
}

void main(List<String> arguments) {
  clientCode();
}
