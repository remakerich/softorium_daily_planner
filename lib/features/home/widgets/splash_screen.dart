import 'package:softorium_daily_planner/core/core.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool nativeSplash = true;
  bool moveAvatar = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => startAnimation());
  }

  startAnimation() async {
    setState(() {
      nativeSplash = false;
    });
    await Future.delayed(Duration(milliseconds: 1300));
    setState(() {
      moveAvatar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          _GradientBackground(moveAvatar),
          _MovingAvatar(moveAvatar),
          _StaticAvatar(moveAvatar),
          _GreetingLine(moveAvatar),
          _NativeSplashTransition(nativeSplash),
        ],
      ),
    );
  }
}

class _NativeSplashTransition extends StatelessWidget {
  const _NativeSplashTransition(this.nativeSplash);

  final bool nativeSplash;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      curve: Curves.ease,
      opacity: nativeSplash ? 1 : 0,
      child: Container(
        color: Color(0xffC8C7F9),
      ),
    );
  }
}

class _GreetingLine extends StatelessWidget {
  const _GreetingLine(this.moveAvatar);

  final bool moveAvatar;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
      opacity: moveAvatar ? 0 : 1,
      child: Padding(
        padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 2) + 70),
        child: Material(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Привет, Анастасия',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StaticAvatar extends StatelessWidget {
  const _StaticAvatar(this.moveAvatar);

  final bool moveAvatar;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !moveAvatar,
      child: Positioned(
        top: (MediaQuery.of(context).size.height / 2) - 50,
        right: (MediaQuery.of(context).size.width / 2) - 50,
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/girl.png'),
        ),
      ),
    );
  }
}

class _MovingAvatar extends StatelessWidget {
  const _MovingAvatar(this.moveAvatar);

  final bool moveAvatar;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      top: moveAvatar ? MediaQuery.of(context).padding.top + 31 : (MediaQuery.of(context).size.height / 2) - 50,
      right: moveAvatar ? 18 : (MediaQuery.of(context).size.width / 2) - 50,
      curve: Curves.ease,
      child: Opacity(
        opacity: moveAvatar ? 1 : 0,
        child: CircleAvatar(
          radius: moveAvatar ? 20 : 50,
          backgroundImage: AssetImage('assets/images/girl.png'),
        ),
      ),
    );
  }
}

class _GradientBackground extends StatelessWidget {
  const _GradientBackground(this.moveAvatar);

  final bool moveAvatar;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(seconds: 1),
      curve: Curves.ease,
      opacity: moveAvatar ? 0 : 1,
      child: Container(
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
      ),
    );
  }
}
