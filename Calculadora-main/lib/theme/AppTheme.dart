import 'package:flutter/material.dart';

class AppTheme {
  // Definición de un color personalizado
  static Color colorX = Color(0xff99ff05);

  // Lista de opciones de colores para el tema de la app
  static List<Color> colorOptions = [
    Colors.purple,  // Opción de color púrpura
    Colors.green,   // Opción de color verde
    Colors.teal,    // Opción de color teal
    Colors.yellow,  // Opción de color amarillo
    Colors.orange,  // Opción de color naranja
    Colors.pink,    // Opción de color rosa
    colorX         // Opción de color personalizado
  ];

  // Constructor privado para evitar la creación de instancias de esta clase
  AppTheme._();

  // Lista de nombres de colores que corresponden a las opciones anteriores
  static List<String> colorText = <String>[
    "Purple",      // Nombre para púrpura
    "Green",       // Nombre para verde
    "Teal",        // Nombre para teal
    "Yellow",      // Nombre para amarillo
    "Orange",      // Nombre para naranja
    "Pink",        // Nombre para rosa
    "Personalizado", // Nombre para el color personalizado
  ];

  // Variable para alternar entre Material Design 2 y 3
  static bool useMaterial3 = false;

  // Variable para alternar entre modo claro y oscuro
  static bool useLightMode = true;

  // Índice para el color seleccionado en la lista de colores
  static int colorSelected = 1; // Por defecto es verde (índice 1)

  // Tema actual de la aplicación, que se ajusta dinámicamente según las opciones
  static ThemeData themeData = ThemeData(
    // Color base de la app, basado en la lista de colores y el color seleccionado
    colorSchemeSeed: AppTheme.colorOptions[AppTheme.colorSelected],
    // Uso de Material Design 3 o no
    useMaterial3: AppTheme.useMaterial3,
    // Modo de brillo (claro u oscuro)
    brightness: AppTheme.useLightMode ? Brightness.light : Brightness.dark,
  );
}
