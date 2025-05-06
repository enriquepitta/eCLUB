# eCLUB

Aplicación Flutter desarrollada para representar el look & feel de la app eCLUB Paraguay 2025.  
La interfaz se basa en diseños realizados en Figma, e implementa navegación estructurada y componentes visuales personalizados.

## Tecnologías utilizadas

- Flutter 3.x
- Dart

## Principales dependencias

Este proyecto utiliza las siguientes librerías para mejorar la experiencia visual y funcional:

- **flutter_svg**: Renderizado de íconos SVG escalables.
- **google_fonts**: Tipografías personalizadas desde Google Fonts.
- **fl_chart**: Gráficos animados y responsivos para visualización de datos.
- **intl**: Formateo de fechas, números y monedas según la localización.

Para ver todas las dependencias, consultar el archivo [`pubspec.yaml`](pubspec.yaml).

## Estructura general

- Pantallas estructuradas según navegación definida en Figma
- Componentes reutilizables con estilos personalizados
- Sistema de navegación tipo BottomNavigationBar
- Compatible con emuladores y dispositivos físicos Android y iOS

## Estructura de archivos

La estructura del proyecto sigue una organización modular por función:

```
lib/
├── models/
│   ├── movement_model.dart
│   └── notification_model.dart
│
├── screens/
│   ├── analysis/
│   │   └── analysis_screen.dart
│   ├── expenses/
│   │   ├── expenses_analysis_screen.dart
│   │   └── widgets/
│   │       ├── expense_category_list.dart
│   │       ├── expense_pie_chart.dart
│   │       └── month_calendar.dart
│   └── home/
│       ├── home_screen.dart
│       └── widgets/
│           └── home_screen.dart
│
├── themes/
│   ├── app_colors.dart
│   └── app_icons.dart
│
├── widgets/
│   ├── dashboard_sections/
│   │   ├── movements_section.dart
│   │   ├── notifications_section.dart
│   │   └── reais_section.dart
│   ├── custom_bottom_navigation_bar.dart
│   └── dashboard_header.dart
│
└── main.dart
```

## Capturas de pantalla

Vista previa de algunas pantallas de la aplicación:

<p align="center">
  <img src="https://i.postimg.cc/Nj5Y38LF/Simulator-Screenshot-i-Phone-16-Pro-Max-2025-05-04-at-23-29-15.png" alt="Pantalla de inicio" width="180"/>
  <img src="https://i.postimg.cc/DwJkj2Yb/Simulator-Screenshot-i-Phone-16-Pro-Max-2025-05-04-at-23-29-21.png" alt="Lista de movimientos" width="180"/>
  <img src="https://i.postimg.cc/3RZP4WWz/Simulator-Screenshot-i-Phone-16-Pro-Max-2025-05-04-at-23-29-24.png" alt="Pantalla de análisis" width="180"/>
  <img src="https://i.postimg.cc/2y8g4mZy/Simulator-Screenshot-i-Phone-16-Pro-Max-2025-05-04-at-23-29-29.png" alt="Gastos por categoría" width="180"/>
</p>

## Créditos

Desarrollado por [@enriquepitta](https://github.com/enriquepitta)

Para más detalles técnicos sobre instalación y ejecución, ver [INSTALL_GUIDE.md](INSTALL_GUIDE.md)