
import 'package:bullpen/_lib.dart';

class XMargin extends StatelessWidget {
  final double width;

  const XMargin(this.width);

  @override
  Widget build(BuildContext context) {
    try {
      return SizedBox(width: SizeConfig().sh(width).toDouble());
    } catch (_) {
      return SizedBox(width: width); // fallback
    }
  }
}
