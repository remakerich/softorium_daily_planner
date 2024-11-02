import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/home/models/app_page.dart';
import 'package:softorium_daily_planner/features/home/providers/page_provider.dart';
import 'package:softorium_daily_planner/features/home/widgets/splash_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffC8C7F9),
                  Color(0xffFCC8C5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                _GreetingAndPhoto(),
                Expanded(child: _Pages()),
                _BottomNavBar(),
              ],
            ),
          ),
        ),
        SplashScreen(),
      ],
    );
  }
}

class _GreetingAndPhoto extends StatelessWidget {
  const _GreetingAndPhoto();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(28, MediaQuery.of(context).padding.top + 31, 18, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Привет, Анастасия',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 0, 18, MediaQuery.of(context).padding.bottom + 18),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: SmoothPageIndicator(
              controller: context.read<PageProvider>().pageController,
              count: AppPage.all.length,
              effect: WormEffect(
                dotWidth: 56,
                dotHeight: 56,
                radius: 56,
                spacing: 20,
                dotColor: Color(0xffF4F4F5),
                activeDotColor: Color(0xffBEB7EB),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...AppPage.all.map(_NavBarIcon.new),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  const _NavBarIcon(this.page);

  final AppPage page;

  @override
  Widget build(BuildContext context) {
    final isCurrentTab = context.select<PageProvider, bool>(
      (e) => e.currentTab == page.index,
    );

    return GestureDetector(
      onTap: () {
        context.read<PageProvider>().onNavBarButtonTap(page.index);
      },
      child: Container(
        width: 76,
        height: 76,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          page.svgIcon,
          colorFilter: ColorFilter.mode(
            isCurrentTab ? Colors.white : Colors.black,
            BlendMode.srcATop,
          ),
        ),
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: context.read<PageProvider>().pageController,
      itemCount: AppPage.all.length,
      physics: CustomPageViewScrollPhysics(),
      onPageChanged: context.read<PageProvider>().onPageChanged,
      itemBuilder: (context, index) => KeepAlivePage(child: AppPage.all[index].page),
    );
  }
}
