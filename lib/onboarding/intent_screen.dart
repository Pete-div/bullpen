import 'package:bullpen/theme/color_data.dart' as AppColors;
import '../_lib.dart';

class IntentOption {
  final String label;
  final String icon;

  const IntentOption({required this.label, required this.icon});
}

class IntentQuestionModel {
  final String eyebrow;
  final String title;
  final String subtitle;
  final List<IntentOption> options;

  const IntentQuestionModel({
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    required this.options,
  });
}

const intentQuestion = IntentQuestionModel(
  eyebrow: '🎯 Quick question',
  title: "What's your goal in\nlearning to invest?",
  subtitle: 'Your goal helps our AI Coach build your\npersonalized roadmap.',
  options: [
    IntentOption(
      label: 'I want to actually invest one day',
      icon: 'assets/svg/growing-plant-svgrepo-com.svg',
    ),
    IntentOption(
      label: "I'm just curious how the market works",
      icon: 'assets/svg/diagram-bar-downtrend-svgrepo-com.svg',
    ),
    IntentOption(
      label: 'My parents / school pushed me here',
      icon: 'assets/svg/push-pin-tools-and-utensils-svgrepo-com.svg',
    ),
    IntentOption(
      label: 'I want to compete with friends',
      icon:
          'assets/svg/competitive-game-compete-competition-tug-or-war-svgrepo-com.svg',
    ),
  ],
);

const experienceQuestion = IntentQuestionModel(
  eyebrow: '📈 One more thing',
  title: "Where's your\nstarting point?",
  subtitle: 'This helps us pick the right pace for you.',
  options: [
    IntentOption(
      label: 'Never looked at a stock chart',
      icon: 'assets/svg/trending-down-svgrepo-com.svg',
    ),
    IntentOption(
      label: 'I know the basics',
      icon: 'assets/svg/stock-svgrepo-com.svg',
    ),
    IntentOption(
      label: 'I already trade or invest',
      icon: 'assets/svg/stock-up-svgrepo-com.svg',
    ),
  ],
);

class IntentScreen extends StatefulWidget {
  const IntentScreen({super.key});

  @override
  State<IntentScreen> createState() => _IntentScreenState();
}

class _IntentScreenState extends State<IntentScreen>
    with TickerProviderStateMixin {
  static const _questions = [intentQuestion, experienceQuestion];

  final List<String> _answers = [];
  int _step = 0;
  String? _selected;

  final baloo = GoogleFonts.baloo2TextTheme();
  final manrope = GoogleFonts.manropeTextTheme();

  IntentQuestionModel get _question => _questions[_step];

  void _handleContinue() {
    if (_selected == null) return;

    _answers.add(_selected!);

    if (_step < _questions.length - 1) {
      setState(() {
        _step++;
        _selected = null; // reset choice for the next question
      });
      return;
    }

    _routeUser();
  }

  late AnimationController _bottomSheetController;
  @override
  void initState() {
    super.initState();

    _bottomSheetController = BottomSheet.createAnimationController(this);

    _bottomSheetController.duration = const Duration(milliseconds: 700);
    _bottomSheetController.reverseDuration = const Duration(milliseconds: 600);
  }

  @override
  void dispose() {
    _bottomSheetController.dispose();
    super.dispose();
  }

  String _successMessage(String experience) {
    switch (experience) {
      case 'I already trade or invest':
        return "We'll skip the basics and drop you straight into advanced tools, deeper charts, and market data.";
      case 'I know the basics':
        return "We'll sharpen what you already know with real scenarios and a few new concepts along the way.";
      default:
        return "No pressure — we'll walk you through everything step by step, starting with the fundamentals.";
    }
  }

  Widget _resolveDestination(String experience) {
    switch (experience) {
      case 'I already trade or invest':
        return SizedBox.shrink();

      //const IntermediateDashboard();
      case 'I know the basics':
        return SizedBox.shrink();
      //const StandardDashboard();
      default:
        return SizedBox.shrink();

      //const BeginnerTrackIntro();
    }
  }

  String _successTitle(String experience) {
    switch (experience) {
      case 'I already trade or invest':
        return "You're all set, Pro!";
      case 'I know the basics':
        return "Great, let's build on that!";
      default:
        return "Perfect, we'll start from zero!";
    }
  }

  void _routeUser() {
    final intent = _answers[0];
    final experience = _answers[1];

    final destination = _resolveDestination(experience);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      transitionAnimationController: _bottomSheetController,
      builder: (sheetContext) {
        // Auto-close the sheet after a few seconds
        Future.delayed(const Duration(seconds: 3), () {
          if (sheetContext.mounted) {
            Navigator.of(sheetContext).pop();
          }
        });

        return TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 500),
          tween: Tween(begin: 40.0, end: 0.0),
          builder: (context, value, child) {
            return Transform.translate(offset: Offset(0, value), child: child);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SuccessLottieWidget(),
                  const YMargin(20),
                  KidText(
                    _successTitle(experience),
                    textAlign: TextAlign.center,
                    style: baloo.bodySmall?.copyWith(
                      color: AppColors.dark,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  const YMargin(10),
                  KidText(
                    _successMessage(experience),
                    textAlign: TextAlign.center,
                    style: manrope.bodySmall?.copyWith(
                      color: AppColors.dark.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                      fontSize: 14.5,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).then((_) {
      // Runs once the sheet has fully closed (either by timer or manual dismiss)
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => destination),
      );
    });
  }

  Widget _buildProgressBar() {
    return Row(
      children: List.generate(_questions.length, (index) {
        final isActive = index <= _step;
        return Expanded(
          child: Container(
            height: 6,
            margin: EdgeInsets.only(
              right: index == _questions.length - 1 ? 0 : 8,
            ),
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.greenDeep
                  : AppColors.dark.withOpacity(0.08),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildOptionCard(IntentOption option) {
    final isSelected = _selected == option.label;

    return GestureDetector(
      onTap: () => setState(() => _selected = option.label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.greenDeep.withOpacity(0.08)
              : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected
                ? AppColors.greenDeep
                : AppColors.dark.withOpacity(0.08),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetSvgImage(
              image: option.icon,
              height: 34,
              width: 34,
              color: isSelected
                  ? AppColors.greenDeep
                  : AppColors.dark.withOpacity(0.45),
            ),
            const YMargin(14),
            KidText(
              option.label,
              textAlign: TextAlign.center,
              style: manrope.bodySmall?.copyWith(
                color: AppColors.dark,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                fontSize: 14.5,
                height: 1.25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(24),

              KidText(
                'Step ${_step + 1} of ${_questions.length}',
                style: manrope.bodySmall?.copyWith(
                  color: AppColors.dark.withOpacity(0.5),
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              const YMargin(10),
              _buildProgressBar(),

              const YMargin(40),
              KidText(
                _question.title,
                style: baloo.bodySmall?.copyWith(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  height: 1.2,
                ),
              ),
              const YMargin(14),
              KidText(
                _question.subtitle,
                style: manrope.bodySmall?.copyWith(
                  color: AppColors.dark.withAlpha(190),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 1.35,
                ),
              ),
              const YMargin(30),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.95,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _question.options
                      .map((option) => _buildOptionCard(option))
                      .toList(),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selected == null ? null : _handleContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenDeep,
                    disabledBackgroundColor: AppColors.greenDeep.withOpacity(
                      0.35,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: KidText(
                    _step < _questions.length - 1 ? 'Next' : 'Continue',
                    style: baloo.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const YMargin(34),
            ],
          ),
        ),
      ),
    );
  }
}
