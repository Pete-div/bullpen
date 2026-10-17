import 'package:bullpen/_lib.dart';
import 'package:bullpen/onboarding/onboarding.model.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController controller = PageController();

  int index = 0;

  final onboardingPageData = [
    OnboardingModel(
      svgAsset: 'assets/svg/01_welcome_mascot.svg',
      eyebrow: 'Welcome to Bullpen',
      titlePlain: 'Meet Naira \u{1F402} — your ',
      titleHighlight: 'trading buddy',
      subtitle:
          "Learn how the Nigerian Exchange really works, one fun lesson and one practice trade at a time.",
    ),
    OnboardingModel(
      svgAsset: 'assets/svg/02_shares.svg',
      eyebrow: 'Lesson 01 · Companies & shares',
      titlePlain: 'Every company you know ',
      titleHighlight: 'started small',
      subtitle:
          "When a company sells small pieces of itself, those pieces are called shares. Own one, and you technically own a slice of that business.",
    ),
    OnboardingModel(
      svgAsset: 'assets/svg/03_candlesticks.svg',
      eyebrow: 'Lesson 02 · Reading the market',
      titlePlain: 'Meet the ',
      titleHighlight: 'candlestick',
      subtitle:
          "Green means the price closed higher than it opened. Red means it closed lower. String a few together and you can read a stock's whole story.",
    ),
    OnboardingModel(
      svgAsset: 'assets/svg/04_simulation.svg',
      eyebrow: 'Lesson 03 · The practice floor',
      titlePlain: 'Trade with ',
      titleHighlight: 'zero real risk',
      subtitle:
          "Every trade here is simulated — real NGX-style price action, fake money. Mess up, learn, try again — before it ever costs you anything.",
      showSimStamp: true,
    ),
  ];

  void goToPage(int page) {
    final target = page.clamp(0, onboardingPageData.length - 1);

    controller.animateToPage(
      target,
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 8, 22, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (index != onboardingPageData.length - 1)
                    TextButton(
                      onPressed: () {
                        goToPage(onboardingPageData.length - 1);
                      },
                      style: TextButton.styleFrom(foregroundColor: textSoft),
                      child: KidText(
                        'Skip',
                        size: 13,
                        weight: FontWeight.w700,
                        color: textSoft,
                      ),
                    ),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: onboardingPageData.length,
                onPageChanged: (i) {
                  setState(() {
                    index = i;
                  });
                },
                itemBuilder: (context, i) {
                  final page = onboardingPageData[i];

                  return SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(28, 8, 28, 0),
                          child: SizedBox(
                            height: 280,
                            child: Center(
                              child: SvgPicture.asset(
                                page.svgAsset,
                                height: 260,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 18, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/icon_shell.svg',
                                    width: 8,
                                    height: 8,
                                  ),
                                  const SizedBox(width: 6),
                                  Flexible(
                                    child: KidText(
                                      _eyebrowForPage(i),
                                      size: 11,
                                      weight: FontWeight.w800,
                                      color: greenDeep,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              KidText(
                                page.titlePlain,
                                size: 27,
                                weight: FontWeight.w700,
                                color: text,
                              ),

                              KidText(
                                page.titleHighlight,
                                size: 16,
                                weight: FontWeight.w500,
                                color: text,
                              ),
                              const SizedBox(height: 10),

                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 290,
                                ),
                                child: KidText(
                                  page.subtitle,
                                  size: 14.5,
                                  weight: FontWeight.w500,
                                  color: textSoft,
                                ),
                              ),

                              if (i == onboardingPageData.length - 1) ...[
                                const SizedBox(height: 16),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(26, 0, 26, 20),
              child: Column(
                children: [
                  _buildDots(),

                  const SizedBox(height: 18),

                  Row(
                    children: [
                      if (index > 0)
                        SizedBox(
                          width: 52,
                          height: 52,
                          child: Material(
                            color: text.withAlpha(6),
                            borderRadius: BorderRadius.circular(16),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                goToPage(index - 1);
                              },
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/svg/icon_back_arrow.svg',
                                  width: 18,
                                  height: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        const SizedBox(width: 52),

                      const SizedBox(width: 12),

                      Expanded(
                        child: AppButton(
                          enabledBtnColor: greenDeep,
                          paddingVertical: 16,
                          text: _buttonText(),
                          textColor: white,
                          boxRadius: BorderRadius.circular(18),
                          onTap: () {
                            if (index == onboardingPageData.length - 1) {
                              // Parent flow
                              Constant.sendToNext(context, Routes.intentRoute);
                            } else {
                              goToPage(index + 1);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _buttonText() {
    if (index == onboardingPageData.length - 1) {
      return 'Continue';
    }

    if (index == 0) {
      return "Let's start";
    }

    return 'Next';
  }

  String _eyebrowForPage(int index) {
    switch (index) {
      case 0:
        return 'WELCOME TO BULLPEN';
      case 1:
        return 'LESSON 01 · COMPANIES & SHARES';
      case 2:
        return 'LESSON 02 · READING THE MARKET';
      case 3:
        return 'LESSON 03 · THE PRACTICE FLOOR';
      case 4:
        return 'ALMOST THERE';
      default:
        return '';
    }
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(onboardingPageData.length, (i) {
        final isActive = i == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4.5),
          width: isActive ? 22 : 9,
          height: 9,
          decoration: BoxDecoration(
            color: isActive ? greenDeep : text.withAlpha(18),
            borderRadius: BorderRadius.circular(4.5),
          ),
        );
      }),
    );
  }

  // Widget _buildParentNote() {
  //   return ConstrainedBox(
  //     constraints: const BoxConstraints(maxWidth: 290),
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
  //       decoration: BoxDecoration(
  //         color: gateAmberBg,
  //         borderRadius: BorderRadius.circular(14),
  //         border: Border.all(color: gateAmberBorder),
  //       ),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           SvgPicture.asset(
  //             'assets/images/icon_info.svg',
  //             width: 18,
  //             height: 18,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
