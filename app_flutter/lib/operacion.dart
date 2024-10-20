void main() {
  final calculadora = Calculadora();

  print('Suma: ${calculadora.suma(3, 2)}');
  print('Resta: ${calculadora.resta(4, 2)}');
  print('Multiplicación: ${calculadora.multiplicacion(4, 2)}');
}

// Clase abstracta Operacion
abstract class Operacion {
  int suma(int a, int b);
  int resta(int a, int b);
  int multiplicacion(int a, int b);
}

// Clase derivada que implementa Operacion
class Calculadora implements Operacion {
  @override
  int suma(int a, int b) => a + b;

  @override
  int resta(int a, int b) => a - b;

  @override
  int multiplicacion(int a, int b) => a * b;
}