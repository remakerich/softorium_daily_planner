<img src="assets/screenshots/1.png" alt="image" width="auto" height="200"> <img src="assets/screenshots/2.png" alt="image" width="auto" height="200"> <img src="assets/screenshots/3.png" alt="image" width="auto" height="200">

## Задание

- [ТЗ](https://docs.google.com/document/d/13lOHtIi1ilRMXs6qc8Gl0oRrPM03D0Hiuyc3y0CL-hs/edit?tab=t.0#heading=h.e0lwp1j3jtso)

- [Макет](https://www.figma.com/design/xzlbsdNK7ezZHT69Urw39C/Untitled?node-id=0-1&node-type=canvas&t=l7FoR63gs2m11SdV-0)

## Релиз

- [APK-файл приложения](https://drive.google.com/file/d/1GuNmK7Xyv2FacjHQz0pHfo-sh2Xfe_lo/view?usp=sharing)

## Инструкция по сборке и запуску

1. Для базовой настройки окружения воспользуйтесь [официальной документацией](https://docs.flutter.dev/get-started/install)

2. На момент создания проекта использовались:
    - Flutter 3.24.4
    - Xcode 16.1
    - Android Studio 2024.2

3. Склонируйте проект и перейдите в его директорию

4. Выполните `flutter pub get` для загрузки зависимостей

5. Запустить unit и widget тесты `flutter test`, либо с помощью интерфейса IDE

6. Для запуска интеграционного теста подключить эмулятор или реальное устройство и выполнить

`flutter driver --target=integration_test/test_app.dart --driver=integration_test/integration_test.dart`

7. Для сборки apk-файла выполните `flutter build apk`