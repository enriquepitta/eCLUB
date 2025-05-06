# eCLUB

Aplicación Flutter para eCLUB Paraguay 2025.  
Este proyecto implementa el look & feel definido en Figma, utilizando componentes visuales personalizados, navegación estructurada y soporte para SVG.

---

## Clonar el repositorio

Desde la terminal:

```bash
git clone https://github.com/enriquepitta/eCLUB.git
cd eCLUB
```

---

## Instalación de dependencias

```bash
flutter pub get
```

---

## Verificación del entorno

Antes de continuar, asegurarse de que todo esté correctamente configurado ejecutando:

```bash
flutter doctor
```

El comando mostrará el estado del entorno. Verificar que no haya errores en los siguientes apartados:

- Flutter
- Android toolchain
- Android Studio
- Connected device (opcional si solo vas a generar APK)

---

## Requisitos

- Flutter SDK (versión 3.x recomendada)
- Android Studio con:
    - Android SDK
    - NDK versión 27.0.12077973
    - Emulador o dispositivo físico conectado
- Git instalado

---

## Generar APK

### Desde la terminal

```bash
flutter build apk --release
```

El archivo generado estará en:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

### Desde Android Studio

1. Abrir el proyecto (carpeta eCLUB) en Android Studio.
2. Esperar a que se sincronicen las dependencias (pub get).
3. En el menú superior, seleccionar:  
   Build > Flutter > Build APK  
   o  
   Build > Build Bundle(s) / APK(s) > Build APK(s)
4. Una vez generado, hacer clic en "locate" para abrir la carpeta del APK.

También se puede acceder manualmente haciendo clic derecho sobre la carpeta del proyecto `eCLUB` en Android Studio y seleccionando **"Reveal in Finder"** o **"Open in Finder"**, luego navegar hasta `build/app/outputs/flutter-apk/`.

---

## Ejecutar la aplicación en modo desarrollo

### Desde la terminal

```bash
flutter run
```

Asegurarse de tener un emulador abierto o un dispositivo conectado.

### Desde Android Studio

1. Seleccionar un emulador o dispositivo real.
2. Presionar el botón "Run" en la barra superior.

---

## Instalar APK en un emulador

Una vez generado el `.apk`, se puede instalar fácilmente en un emulador de Android arrastrando el archivo `app-release.apk` directamente dentro de la ventana del emulador. La instalación se hará automáticamente.

---

## Notas

- Verificar que la versión correcta del NDK esté instalada:  
  Android Studio > Preferences > SDK Tools > NDK (Side by side)

- En caso de errores, ejecutar:

```bash
flutter clean
flutter pub get
```

---

Última actualización: Mayo 2025 – por [@enriquepitta](https://github.com/enriquepitta)