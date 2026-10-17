import 'package:bullpen/_lib.dart';

class XMargin extends StatelessWidget {
  const XMargin(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    try {
      return SizedBox(width: SizeConfig().sh(width).toDouble());
    } catch (_) {
      return SizedBox(width: width); // fallback
    }
  }
}
