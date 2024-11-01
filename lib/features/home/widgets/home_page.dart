import 'package:flutter/services.dart';
import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/home/models/app_page.dart';
import 'package:softorium_daily_planner/features/home/providers/page_provider.dart';

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
    return Scaffold(
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
            _Pages(),
            _BottomNavBar(),
          ],
        ),
      ),
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
              'Привет, Джамшутушка',
              style: TextStyle(fontSize: 16),
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/girl.png'),
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
    return Container(
      margin: EdgeInsets.fromLTRB(18, 0, 18, MediaQuery.of(context).padding.bottom + 18),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.5),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...AppPage.all.map(_NavBarButton.new),
        ],
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton(this.page);

  final AppPage page;

  @override
  Widget build(BuildContext context) {
    final currentTab = context.select<PageProvider, int>(
      (e) => e.currentTab,
    );

    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        context.read<PageProvider>().onNavBarButtonTap(page.index);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: currentTab == page.index ? Color(0xffBEB7EB) : Color(0xffF4F4F5),
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgPicture.asset(
          page.svgIcon,
        ),
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages();

  @override
  Widget build(BuildContext context) {
    final pageController = context.select<PageProvider, PageController>(
      (e) => e.pageController,
    );

    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: 4,
        physics: CustomPageViewScrollPhysics(),
        onPageChanged: context.read<PageProvider>().onPageChanged,
        itemBuilder: (context, index) => KeepAlivePage(child: AppPage.all[index].page),
      ),
    );
  }
}
