// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() => runApp(const CowrieApp());

// class CowrieApp extends StatelessWidget {
//   const CowrieApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cowrie Onboarding',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(useMaterial3: true, fontFamily: 'Manrope'),
//       home: const OnboardingFlow(),
//     );
//   }
// }

// /// ---------- Design tokens (mirrors the :root CSS variables) ----------
// class AppColors {
//   static const ink = Color(0xFF12183B);
//   static const cream = Color(0xFFFBF3E7);
//   static const green = Color(0xFF14B87F);
//   static const greenDeep = Color(0xFF0C8F62);
//   static const coral = Color(0xFFFF6B4A);
//   static const gold = Color(0xFFF2B705);
//   static const text = Color(0xFF1C1F33);
//   static const textSoft = Color(0xFF5B5F79);
//   static const white = Color(0xFFFFFFFF);
//   static const gateAmberBg = Color(0x24F2B705); // rgba(242,183,5,0.14)
//   static const gateAmberBorder = Color(0x66F2B705); // rgba(242,183,5,0.4)
//   static const gateAmberText = Color(0xFF7A5A00);
// }

// /// ---------- Data model for each onboarding page ----------
// class OnboardingPageData {
//   final String svgAsset;
//   final String eyebrow;
//   final String titlePlain;
//   final String titleHighlight; // portion of the title rendered in green
//   final bool highlightFirst; // whether the highlighted span comes before the plain text
//   final String subtitle;
//   final bool showSimStamp;
//   final bool showGateNote;

//   const OnboardingPageData({
//     required this.svgAsset,
//     required this.eyebrow,
//     required this.titlePlain,
//     required this.titleHighlight,
//     this.highlightFirst = false,
//     required this.subtitle,
//     this.showSimStamp = false,
//     this.showGateNote = false,
//   });
// }

// final List<OnboardingPageData> pages = [
//   const OnboardingPageData(
//     svgAsset: 'assets/images/01_welcome_mascot.svg',
//     eyebrow: 'Welcome to Cowrie',
//     titlePlain: 'Meet Naira \u{1F402} — your ',
//     titleHighlight: 'trading buddy',
//     subtitle:
//         "Learn how the Nigerian Exchange really works, one fun lesson and one practice trade at a time.",
//   ),
//   const OnboardingPageData(
//     svgAsset: 'assets/images/02_shares.svg',
//     eyebrow: 'Lesson 01 · Companies & shares',
//     titlePlain: 'Every big company ',
//     titleHighlight: 'started small',
//     subtitle:
//         "When a company sells tiny pieces of itself, those pieces are called shares. Owning one makes you a small owner — that's investing.",
//   ),
//   const OnboardingPageData(
//     svgAsset: 'assets/images/03_candlesticks.svg',
//     eyebrow: 'Lesson 02 · Reading the market',
//     titlePlain: 'Meet the ',
//     titleHighlight: 'candlestick',
//     subtitle:
//         "Green means the price closed higher. Coral means it closed lower. Stack a few together and you can see a story unfold.",
//   ),
//   const OnboardingPageData(
//     svgAsset: 'assets/images/04_simulation.svg',
//     eyebrow: 'Lesson 03 · The practice floor',
//     titlePlain: 'Play with ',
//     titleHighlight: 'pretend naira',
//     subtitle:
//         "Every trade you make in Cowrie is a simulation. You'll build real instincts before real money ever enters the picture.",
//     showSimStamp: true,
//   ),
//   const OnboardingPageData(
//     svgAsset: 'assets/images/05_parent_gate.svg',
//     eyebrow: 'Almost there',
//     titlePlain: "Let's bring in a ",
//     titleHighlight: 'parent',
//     subtitle:
//         "A parent or guardian sets up the family account and can watch your progress. You'll get your own trading profile right after.",
//     showGateNote: true,
//   ),
// ];

// /// ---------- Main flow widget ----------
// class OnboardingFlow extends StatefulWidget {
//   const OnboardingFlow({super.key});

//   @override
//   State<OnboardingFlow> createState() => _OnboardingFlowState();
// }

// class _OnboardingFlowState extends State<OnboardingFlow> {
//   final PageController _controller = PageController();
//   int _current = 0;

//   void _go(int index) {
//     final target = index.clamp(0, pages.length - 1);
//     _controller.animateToPage(
//       target,
//       duration: const Duration(milliseconds: 380),
//       curve: Curves.easeOut,
//     );
//   }

//   void _onParentContinue() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('→ Parent sign-in flow')),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final baloo = GoogleFonts.baloo2TextTheme();
//     final manrope = GoogleFonts.manropeTextTheme();

//     return Scaffold(
//       backgroundColor: AppColors.cream,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ---- Skip row ----
//             Padding(
//               padding: const EdgeInsets.fromLTRB(22, 8, 22, 0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Visibility(
//                     visible: _current != pages.length - 1,
//                     maintainState: true,
//                     maintainAnimation: true,
//                     maintainSize: true,
//                     child: TextButton(
//                       onPressed: () => _go(pages.length - 1),
//                       style: TextButton.styleFrom(
//                         foregroundColor: AppColors.textSoft,
//                       ),
//                       child: Text(
//                         'Skip',
//                         style: manrope.bodyMedium?.copyWith(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 13,
//                           letterSpacing: 0.3,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // ---- Pages ----
//             Expanded(
//               child: PageView.builder(
//                 controller: _controller,
//                 itemCount: pages.length,
//                 onPageChanged: (i) => setState(() => _current = i),
//                 itemBuilder: (context, i) {
//                   return _OnboardingPage(
//                     data: pages[i],
//                     baloo: baloo,
//                     manrope: manrope,
//                   );
//                 },
//               ),
//             ),

//             // ---- Footer: dots + nav row ----
//             Padding(
//               padding: const EdgeInsets.fromLTRB(26, 0, 26, 20),
//               child: Column(
//                 children: [
//                   _DotsIndicator(current: _current, total: pages.length),
//                   const SizedBox(height: 18),
//                   Row(
//                     children: [
//                       if (_current > 0)
//                         _BackButton(onTap: () => _go(_current - 1))
//                       else
//                         const SizedBox(width: 52),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: _PrimaryButton(
//                           label: _current == pages.length - 1
//                               ? 'Continue with a parent'
//                               : (_current == 0 ? "Let's start" : 'Next'),
//                           showArrow: _current != pages.length - 1,
//                           baloo: baloo,
//                           onTap: _current == pages.length - 1
//                               ? _onParentContinue
//                               : () => _go(_current + 1),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// ---------- A single onboarding page ----------
// class _OnboardingPage extends StatelessWidget {
//   final OnboardingPageData data;
//   final TextTheme baloo;
//   final TextTheme manrope;

//   const _OnboardingPage({
//     required this.data,
//     required this.baloo,
//     required this.manrope,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ---- Illustration ----
//           Padding(
//             padding: const EdgeInsets.fromLTRB(28, 8, 28, 0),
//             child: SizedBox(
//               height: 280,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Center(
//                     child: SvgPicture.asset(
//                       data.svgAsset,
//                       height: 260,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   if (data.showSimStamp)
//                     Positioned(
//                       top: 4,
//                       right: 4,
//                       child: Transform.rotate(
//                         angle: 0.10, // ~6deg
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: AppColors.white.withOpacity(0.9),
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: AppColors.coral,
//                               width: 2,
//                               style: BorderStyle.solid,
//                             ),
//                           ),
//                           child: Text(
//                             'SIMULATED · NO REAL \u20A6',
//                             style: baloo.bodySmall?.copyWith(
//                               color: AppColors.coral,
//                               fontWeight: FontWeight.w700,
//                               fontSize: 10,
//                               letterSpacing: 0.5,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),

//           // ---- Copy ----
//           Padding(
//             padding: const EdgeInsets.fromLTRB(30, 18, 30, 0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // eyebrow
//                 Row(
//                   children: [
//                     SvgPicture.asset(
//                       'assets/images/icon_shell.svg',
//                       width: 8,
//                       height: 8,
//                     ),
//                     const SizedBox(width: 6),
//                     Text(
//                       data.eyebrow.toUpperCase(),
//                       style: manrope.bodySmall?.copyWith(
//                         fontWeight: FontWeight.w800,
//                         fontSize: 11,
//                         letterSpacing: 1.3,
//                         color: AppColors.greenDeep,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 // title (rich text with highlighted span)
//                 RichText(
//                   text: TextSpan(
//                     style: baloo.headlineSmall?.copyWith(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 27,
//                       height: 1.18,
//                       color: AppColors.text,
//                     ),
//                     children: [
//                       TextSpan(text: data.titlePlain),
//                       TextSpan(
//                         text: data.titleHighlight,
//                         style: const TextStyle(color: AppColors.greenDeep),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 290),
//                   child: Text(
//                     data.subtitle,
//                     style: manrope.bodyMedium?.copyWith(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14.5,
//                       height: 1.55,
//                       color: AppColors.textSoft,
//                     ),
//                   ),
//                 ),
//                 if (data.showGateNote) ...[
//                   const SizedBox(height: 16),
//                   _GateNote(manrope: manrope),
//                 ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------- Parent-gate note (amber callout) ----------
// class _GateNote extends StatelessWidget {
//   final TextTheme manrope;
//   const _GateNote({required this.manrope});

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: const BoxConstraints(maxWidth: 290),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//         decoration: BoxDecoration(
//           color: AppColors.gateAmberBg,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(color: AppColors.gateAmberBorder),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 1),
//               child: SvgPicture.asset(
//                 'assets/images/icon_info.svg',
//                 width: 18,
//                 height: 18,
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Text(
//                 "Kids can't skip this step — it keeps sign-ups and any "
//                 "future upgrades in a parent's hands.",
//                 style: manrope.bodySmall?.copyWith(
//                   fontSize: 12.5,
//                   height: 1.5,
//                   color: AppColors.gateAmberText,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// ---------- Dots indicator ----------
// class _DotsIndicator extends StatelessWidget {
//   final int current;
//   final int total;
//   const _DotsIndicator({required this.current, required this.total});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(total, (i) {
//         final isOn = i == current;
//         return AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//           margin: const EdgeInsets.symmetric(horizontal: 4.5),
//           width: isOn ? 22 : 9,
//           height: 9,
//           decoration: BoxDecoration(
//             color: isOn
//                 ? AppColors.greenDeep
//                 : AppColors.text.withOpacity(0.18),
//             borderRadius: BorderRadius.circular(4.5),
//           ),
//         );
//       }),
//     );
//   }
// }

// /// ---------- Primary CTA button ----------
// class _PrimaryButton extends StatelessWidget {
//   final String label;
//   final bool showArrow;
//   final TextTheme baloo;
//   final VoidCallback onTap;

//   const _PrimaryButton({
//     required this.label,
//     required this.showArrow,
//     required this.baloo,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 52,
//       child: ElevatedButton(
//         onPressed: onTap,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.greenDeep,
//           foregroundColor: AppColors.white,
//           elevation: 0,
//           shadowColor: AppColors.greenDeep.withOpacity(0.35),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(18),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               label,
//               style: baloo.titleMedium?.copyWith(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 16,
//                 color: AppColors.white,
//                 letterSpacing: 0.2,
//               ),
//             ),
//             if (showArrow) ...[
//               const SizedBox(width: 8),
//               const Text('→', style: TextStyle(color: AppColors.white)),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// ---------- Back (chevron) button ----------
// class _BackButton extends StatelessWidget {
//   final VoidCallback onTap;
//   const _BackButton({required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 52,
//       height: 52,
//       child: Material(
//         color: AppColors.text.withOpacity(0.06),
//         borderRadius: BorderRadius.circular(16),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(16),
//           onTap: onTap,
//           child: Center(
//             child: SvgPicture.asset(
//               'assets/images/icon_back_arrow.svg',
//               width: 18,
//               height: 18,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
