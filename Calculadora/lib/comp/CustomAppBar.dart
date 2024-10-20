import 'package:calc_upeu/theme/AppTheme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.accionx})
      : preferredSize = const Size.fromHeight(50.0);

  final Function accionx;

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState(accionx);
}

class _CustomAppBarState extends State<CustomAppBar> {
  _CustomAppBarState(this.accionx);

  final Function accionx;
  int coloS = 0; // Variable para almacenar el color seleccionado

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: AppTheme.useMaterial3
            ? const Text("Material 3")
            : const Text("Material 2"),
      ),
      actions: [
        // Botón para cambiar entre modo claro y oscuro
        IconButton(
          icon: AppTheme.useLightMode
              ? const Icon(Icons.wb_sunny_outlined)
              : const Icon(Icons.wb_sunny),
          onPressed: () {
            setState(() {
              AppTheme.useLightMode = !AppTheme.useLightMode; // Toggle de modo
              AppTheme.themeData = ThemeData(
                colorSchemeSeed: AppTheme.colorOptions[AppTheme.colorSelected],
                useMaterial3: AppTheme.useMaterial3,
                brightness:
                AppTheme.useLightMode ? Brightness.light : Brightness.dark,
              );
              accionx(); // Llama a la función pasada como callback
            });
          },
          tooltip: "Toggle brightness",
        ),
        // Botón para cambiar entre Material 2 y Material 3
        IconButton(
          icon: AppTheme.useMaterial3
              ? const Icon(Icons.filter_3)
              : const Icon(Icons.filter_2),
          onPressed: () {
            setState(() {
              AppTheme.useMaterial3 = !AppTheme.useMaterial3; // Cambia entre Material 2 y 3
              AppTheme.themeData = ThemeData(
                colorSchemeSeed: AppTheme.colorOptions[AppTheme.colorSelected],
                useMaterial3: AppTheme.useMaterial3,
                brightness:
                AppTheme.useLightMode ? Brightness.light : Brightness.dark,
              );
              accionx();
            });
          },
          tooltip:
          "Switch to Material ${AppTheme.useMaterial3 ? 2 : 3}", // Tooltip dinámico
        ),
        // Menú desplegable para seleccionar el color del tema
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          itemBuilder: (context) {
            return List.generate(AppTheme.colorOptions.length, (index) {
              return PopupMenuItem(
                value: index,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        index == AppTheme.colorSelected
                            ? Icons.color_lens
                            : Icons.color_lens_outlined,
                        color: AppTheme.colorOptions[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(AppTheme.colorText[index]),
                    ),
                  ],
                ),
                onTap: () {
                  coloS = index; // Almacena el color seleccionado
                  AppTheme.colorSelected = coloS;
                },
              );
            });
          },
          onSelected: (valor) {
            setState(() {
              AppTheme.themeData = ThemeData(
                colorSchemeSeed: AppTheme.colorOptions[coloS],
                useMaterial3: AppTheme.useMaterial3,
                brightness:
                AppTheme.useLightMode ? Brightness.light : Brightness.dark,
              );
              accionx();
            });
          },
        ),
      ],
    );
  }
}
