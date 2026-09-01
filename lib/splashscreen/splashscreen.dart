
// import 'package:kid_investor/_lib.dart';

// class SplashNewScreen extends ConsumerStatefulWidget {
//   const SplashNewScreen({super.key});

//   @override
//   ConsumerState<SplashNewScreen> createState() {
//     return _SplashScreenState();
//   }
// }

// class _SplashScreenState extends ConsumerState<SplashNewScreen>
//     with TickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     delayBeforeDashboard();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
  


//   void delayBeforeDashboard() {
//     Future.delayed(const Duration(seconds: 2), () {
//       navigateUserToDashboard();
//     });
//   }

//   navigateUserToDashboard() async {
//     // final cachedUser = await UserSharedPreference.getUser();
//           Constant.sendToReplacementNext(context, Routes.onboardingPath);

//     //    if (cachedUser != null) {
//     //    Constant.sendToReplacementNext(context, Routes.dashboardRoute);
//     // } else {
//     //   Constant.sendToReplacementNext(context, Routes.onBoardingRoute);
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           height: double.infinity,
//           width: double.infinity,
//           child: GetSvgImage(
//             image: 'assets/svg/splash-screen.svg',
//             boxFit: BoxFit.cover,
//           ),
//         ),
//         Center(child: GetPngImage(image: 'assets/images/FishMa-Logo.png',height: 50,width: 190,boxFit: BoxFit.scaleDown,)),
//       ],
//     );
//   }
// }
