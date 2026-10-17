import '../_lib.dart';

class KidText extends ConsumerWidget {
  final String? text;
  final FontWeight? weight;
  final double size;
  final double? height;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final FontStyle? fontStyle;
  final TextStyle? style;
  final TextDecoration? decoration;

  const KidText(
    this.text, {
      super.key,
    this.weight,
    this.size = 14,
    this.color,
    this.textAlign,
    this.maxLines,
    this.decoration,
    this.fontStyle,
    this.style,
    this.height = 20,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context, ref) {
    //final appTheme = ref.watch(appThemeProvider);
    return Text(
      text ?? '-',
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style:
          style ??
          TextStyle(
            fontWeight: weight ?? FontWeight.w400,
            fontSize: size,
            letterSpacing: size * -0.03,
            color: color,
            fontFamily: Constant.fontsFamily,
            fontStyle: fontStyle ?? FontStyle.normal,
            //  color: color ?? AppColors.black,
            decoration: decoration,
          ),
    );
  }
}

class JikooNaira extends ConsumerWidget {
  final String? text;
  final FontWeight? weight;
  final double size;
  final double? height;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;

  const JikooNaira(
    this.text, {
  super.key,
      this.weight,
    this.size = 14,
    this.color,
    this.textAlign,
    this.maxLines,
    this.decoration,
    this.fontStyle,
    this.height = 20,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context, ref) {
    //final appTheme = ref.watch(appThemeProvider);
    return Text(
      text ?? '-',
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontWeight: weight ?? FontWeight.w400,
        fontSize: size,
        fontFamily: Constant.fontsFamily,
        fontStyle: fontStyle ?? FontStyle.normal,
        //  color: color ?? AppColors.black,
        decoration: decoration,
      ),
    );
  }
}
