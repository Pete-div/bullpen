import 'package:bullpen/_lib.dart';

class YMargin extends StatelessWidget {
  const YMargin(this.height, {super.key});
  final double height;

  @override
  Widget build(BuildContext context) {
    try {
      return SizedBox(height: SizeConfig().sh(height).toDouble());
    } catch (_) {
      return SizedBox(height: height);
    }
  }
}
