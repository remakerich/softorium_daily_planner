import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

// flutter driver --target=test/test_app.dart --driver=test/integration_test.dart

void main() {
  late FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    await driver.waitUntilFirstFrameRasterized();
  });

  tearDownAll(() {
    driver.close();
  });

  test('integration test', () async {
    // main page view test
    await Future.delayed(Duration(seconds: 2));
    final pageViewFinder = find.byValueKey('main page view');
    await driver.scroll(pageViewFinder, -400, 0, Duration(milliseconds: 200));
    await Future.delayed(Duration(milliseconds: 500));
    await driver.scroll(pageViewFinder, -400, 0, Duration(milliseconds: 200));
    await Future.delayed(Duration(milliseconds: 500));
    await driver.scroll(pageViewFinder, -400, 0, Duration(milliseconds: 200));
    await Future.delayed(Duration(milliseconds: 500));
    await driver.scroll(pageViewFinder, 400, 0, Duration(milliseconds: 200));
    await Future.delayed(Duration(milliseconds: 500));
    await driver.scroll(pageViewFinder, 400, 0, Duration(milliseconds: 200));
    await Future.delayed(Duration(milliseconds: 500));
    await driver.scroll(pageViewFinder, 400, 0, Duration(milliseconds: 200));
    await Future.delayed(Duration(milliseconds: 500));

    // creating task, toggle isDone
    final newTaskButtonFinder = find.byValueKey('new task line');
    await driver.tap(newTaskButtonFinder);
    await Future.delayed(Duration(milliseconds: 500));
    await driver.enterText('test task');
    await Future.delayed(Duration(milliseconds: 500));
    await driver.sendTextInputAction(TextInputAction.done);
    await Future.delayed(Duration(milliseconds: 500));
    final newTaskFinder = find.text('test task');
    await driver.scroll(newTaskFinder, 0, 0, Duration(milliseconds: 500));
    await Future.delayed(Duration(milliseconds: 500));
    await driver.scroll(newTaskFinder, 0, 0, Duration(milliseconds: 500));
    await Future.delayed(Duration(milliseconds: 500));

    // scroll days list view
    final dateScrollFinder = find.byValueKey('dates scroll view');
    final lastDayFinder = find.byValueKey('last day button');
    await driver.scrollUntilVisible(dateScrollFinder, lastDayFinder, dxScroll: -200);
    await Future.delayed(Duration(milliseconds: 500));
    await driver.tap(lastDayFinder);
    await Future.delayed(Duration(milliseconds: 500));
    final firstDayFinder = find.byValueKey('first day button');
    await driver.scrollUntilVisible(dateScrollFinder, firstDayFinder, dxScroll: 200);
    await Future.delayed(Duration(milliseconds: 500));
    await driver.tap(firstDayFinder);
    await Future.delayed(Duration(milliseconds: 500));
    final currentDayFinder = find.byValueKey('current day button');
    await driver.scrollUntilVisible(dateScrollFinder, currentDayFinder, dxScroll: -200);
    await Future.delayed(Duration(milliseconds: 500));
    await driver.tap(currentDayFinder);
    await Future.delayed(Duration(milliseconds: 500));

    // deleting task
    await driver.tap(newTaskFinder);
    await Future.delayed(Duration(milliseconds: 500));
    final deleteButtonFinder = find.text('Удалить');
    await driver.tap(deleteButtonFinder);
    await Future.delayed(Duration(seconds: 2));
  });
}
