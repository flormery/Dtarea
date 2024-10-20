import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String? text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function? callback;

  const CalcButton({
    Key? key,
    this.text,
    this.fillColor = 0xFFFFB74D,  // Color por defecto para el botón
    this.textColor = 0xFF6C807F,  // Color por defecto del texto
    this.textSize = 20,           // Tamaño de texto por defecto
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        width: 70,  // Ancho del botón
        height: 70, // Alto del botón
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(fillColor), // Cambiar primary a backgroundColor
            shape: RoundedRectangleBorder( // Bordes redondeados
              borderRadius: BorderRadius.circular(10),
            ),
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: () {
            if (callback != null) {
              callback!(text);  // Llamada a la función asociada al botón
            }
          },
          child: Text(
            text ?? '',  // Texto del botón
            style: TextStyle(
              fontSize: textSize,   // Tamaño de la fuente
              color: Color(textColor), // Color del texto
            ),
          ),
        ),
      ),
    );
  }
}
