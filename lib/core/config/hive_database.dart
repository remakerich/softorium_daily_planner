import 'package:softorium_daily_planner/core/core.dart';

class HiveBoxes {
  static const String dailyTasks = 'daily_tasks';
}

class HiveDatabase {
  static Future<void> init() async {
    final appDir = await getApplicationDocumentsDirectory();

    Hive.init('${appDir.path}/hive');

    await Hive.openBox(HiveBoxes.dailyTasks);
  }
}
