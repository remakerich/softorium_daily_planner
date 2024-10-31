import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/home/models/app_page.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({
    super.key,
    required this.page,
  });

  final AppPage page;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            page.svgIcon,
            height: 60,
          ),
          SizedBox(height: 20),
          Text(
            page.name,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
