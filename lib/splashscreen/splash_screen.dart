import 'package:bullpen/theme/color_data.dart' as AppColors;
import 'package:google_fonts/google_fonts.dart';

import '../_lib.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _mascotController;
  late final AnimationController _logoController;
  late final Animation<double> _mascotScale;
  late final AnimationController _textController;
  late final Animation<double> _mascotBob;
  late final Animation<double> _logoFade;
  late final Animation<Offset> _logoSlide;
  late final Animation<double> _textFade;
  late final Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
    _mascotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _mascotScale = CurvedAnimation(
      parent: _mascotController,
      curve: const Interval(0.0, 0.65, curve: Curves.elasticOut),
    );
    _textFade = CurvedAnimation(parent: _textController, curve: Curves.easeOut);
    _textSlide = Tween<Offset>(begin: const Offset(0.4, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
        );
    _mascotBob = Tween<double>(begin: -32, end: 4).animate(
      CurvedAnimation(
        parent: _mascotController,
        curve: const Interval(0.65, 1.0, curve: Curves.easeInOutSine),
      ),
    );

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _logoFade = CurvedAnimation(parent: _logoController, curve: Curves.easeOut);
    _logoSlide = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));

    _mascotController.forward();
    Future.delayed(const Duration(milliseconds: 550), () {
      if (mounted) _logoController.forward();
    });

    Future.delayed(const Duration(milliseconds: 1100), () {
      if (mounted) _textController.forward();
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) _mascotController.repeat(reverse: true, min: 0.65, max: 1.0);
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // final cachedUser = await UserSharedPreference.getUser();
        Constant.sendToReplacementNext(context, Routes.onboardingPath);

        //    if (cachedUser != null) {
        //    Constant.sendToReplacementNext(context, Routes.dashboardRoute);
        // } else {
        //   Constant.sendToReplacementNext(context, Routes.onBoardingRoute);
        // }
      }
    });
  }

  final baloo = GoogleFonts.baloo2TextTheme();
  final manrope = GoogleFonts.manropeTextTheme();

  @override
  void dispose() {
    _mascotController.dispose();
    _logoController.dispose();
    _textController.dispose(); // NEW

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/svg/splash-screen.svg',
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: _mascotController,
                  builder: (context, child) {
                    final bob = _mascotController.value > 0.65
                        ? _mascotBob.value
                        : 0.0;
                    return Transform.translate(
                      offset: Offset(0, bob),
                      child: Transform.scale(
                        scale: _mascotScale.value,
                        child: child,
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/svg/01_welcome_mascot.svg',
                    width: 190,
                    height: 165,
                  ),
                ),
                YMargin(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KidText(
                      'Bull',
                      style: baloo.bodySmall?.copyWith(
                        color: AppColors.dark,
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        letterSpacing: 2,
                      ),
                    ),
                    KidText(
                      'Pen',
                      style: baloo.bodySmall?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SlideTransition(
                  position: _textSlide,

                  child: FadeTransition(
                    opacity: _textFade,

                    child: Text.rich(
                      TextSpan(
                        text: 'LEARN',
                        style: baloo.bodySmall?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          letterSpacing: 2,
                        ),
                        children: [
                          TextSpan(
                            children: [
                              TextSpan(
                                children: [
                                  TextSpan(
                                    children: [TextSpan()],
                                    text: ' into the Game',
                                    style: baloo.bodySmall?.copyWith(
                                      color: AppColors.dark,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ],
                                text: 'GROW',
                                style: baloo.bodySmall?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                            text: ' the Game, ',
                            style: baloo.bodySmall?.copyWith(
                              color: AppColors.dark,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
