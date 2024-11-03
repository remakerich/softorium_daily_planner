import 'package:flutter_driver/flutter_driver.dart';
import 'package:softorium_daily_planner/core/config/integration_test_constants.dart';
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
    final pageViewFinder = find.byValueKey(IntegrationTestConstants.mainPageViewKey);
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
    final newTaskButtonFinder = find.byValueKey(IntegrationTestConstants.newTaskLineKey);
    await driver.tap(newTaskButtonFinder);
    await Future.delayed(Duration(milliseconds: 500));
    await driver.enterText(IntegrationTestConstants.testTaskText);
    await Future.delayed(Duration(milliseconds: 500));
    await driver.sendTextInputAction(TextInputAction.done);
    await Future.delayed(Duration(milliseconds: 500));
    final newTaskFinder = find.text(IntegrationTestConstants.testTaskText);
    await driver.scroll(newTaskFinder, 0, 0, Duration(milliseconds: 500));
    await Future.delayed(Duration(milliseconds: 500));
    await driver.scroll(newTaskFinder, 0, 0, Duration(milliseconds: 500));
    await Future.delayed(Duration(milliseconds: 500));

    // scroll days list view
    final dateScrollFinder = find.byValueKey(IntegrationTestConstants.datesScrollKey);
    final lastDayFinder = find.byValueKey(IntegrationTestConstants.lastDayButtonKey);
    await driver.scrollUntilVisible(dateScrollFinder, lastDayFinder, dxScroll: -200);
    await Future.delayed(Duration(milliseconds: 500));
    await driver.tap(lastDayFinder);
    await Future.delayed(Duration(milliseconds: 500));
    final firstDayFinder = find.byValueKey(IntegrationTestConstants.firstDayButtonKey);
    await driver.scrollUntilVisible(dateScrollFinder, firstDayFinder, dxScroll: 200);
    await Future.delayed(Duration(milliseconds: 500));
    await driver.tap(firstDayFinder);
    await Future.delayed(Duration(milliseconds: 500));
    final currentDayFinder = find.byValueKey(IntegrationTestConstants.currentDayButtonKey);
    await driver.scrollUntilVisible(dateScrollFinder, currentDayFinder, dxScroll: -200);
    await Future.delayed(Duration(milliseconds: 500));
    await driver.tap(currentDayFinder);
    await Future.delayed(Duration(milliseconds: 500));

    // deleting task
    await driver.tap(newTaskFinder);
    await Future.delayed(Duration(milliseconds: 500));
    final deleteButtonFinder = find.byValueKey(IntegrationTestConstants.deleteTaskButtonKey);
    await driver.tap(deleteButtonFinder);
    await Future.delayed(Duration(seconds: 2));
  });
}
