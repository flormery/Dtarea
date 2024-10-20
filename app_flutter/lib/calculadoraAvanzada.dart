void main() {
  final calculadoraAvanzada = CalculadoraAvanzada();

  print('Suma: ${calculadoraAvanzada.suma(4, 2)}');
  print('Resta: ${calculadoraAvanzada.resta(4, 2)}');
  print('Multiplicación: ${calculadoraAvanzada.multiplicacion(4, 2)}');
  print('División: ${calculadoraAvanzada.division(4, 2)}');
}

// Clase base Operacion
class Operacion {
  int suma(int a, int b) {
    return a + b;
  }

  int resta(int a, int b) {
    return a - b;
  }

  int multiplicacion(int a, int b) {
    return a * b;
  }
}

// Clase derivada CalculadoraAvanzada
class CalculadoraAvanzada extends Operacion {
  double division(int a, int b) {
    if (b == 0) {
      throw Exception('No se puede dividir por cero');
    }
    return a / b;
  }
}