import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/home/widgets/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const Home(),
    );
  }
}
