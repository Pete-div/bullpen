import 'package:bullpen/_lib.dart';

class Constant {
  static String assetImagePath = "assets/images/";
  static const String fontsFamily = "Posppin";

  static const String apiKey = '7a9ba303cf232d3d804e282de179735f5';
  static double getPercentSize(double total, double percent) {
    return (percent * total) / 100;
  }

  static void backToPrev(BuildContext context) {
    Navigator.of(context).pop();
  }
  static void sendToNext(
    BuildContext context,
    String route, {
    Object? arguments,
  }) {
    if (arguments != null) {
      Navigator.pushNamed(context, route, arguments: arguments);
    } else {
      Navigator.pushNamed(context, route);
    }
  }

  static void sendToReplacementNext(
    BuildContext context,
    String route, {
    Object? arguments,
  }) {
    if (arguments != null) {
      Navigator.pushReplacementNamed(context, route, arguments: arguments);
    } else {
      Navigator.pushReplacementNamed(context, route);
    }
  }

  static double getToolbarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top + kToolbarHeight;
  }

  static double getToolbarTopHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static void sendToScreen(Widget widget, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }

  static void backToFinish(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
  }
}
