

import 'package:bullpen/_lib.dart';

class YMargin extends StatelessWidget {
  final double height;

  const YMargin(this.height);

  @override
  Widget build(BuildContext context) {
    try {
      return SizedBox(height: SizeConfig().sh(height).toDouble());
    } catch (_) {
      return SizedBox(height: height);
    }
  }
}
