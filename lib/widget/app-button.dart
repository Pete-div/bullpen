import 'package:bullpen/_lib.dart';

class AppButton extends ConsumerWidget {
  final String text;
  final Color? enabledBtnColor;
  final Color? disabledBtnColor;
  final Color? textColor;
  final bool? enabled;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final bool? smallButton;
  final Widget? row;
  final bool? enableBorder;
  final BorderRadiusGeometry? boxRadius;
  final Function() onTap;
  const AppButton({
    super.key,
    required this.text,
    this.enabledBtnColor,
    this.textColor,
    this.enabled,
    this.row,
    required this.onTap,
    this.boxRadius,
    this.disabledBtnColor,
    this.paddingVertical,
    this.paddingHorizontal,
    this.enableBorder = false,
    this.smallButton = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);

    final bool isEnabled = enabled ?? true;

    final Color backgroundColor = isEnabled
        ? (enabledBtnColor ?? (appTheme.isDark ? grayColor : primaryColor))
        : (disabledBtnColor ??
              (appTheme.isDark ? grayColor : primaryColor.withOpacity(0.5)));

    final Color borderColor = isEnabled
        ? (enabledBtnColor ??
              (appTheme.isDark ? Color(0xFFD5D5D5) : primaryColor))
        : (disabledBtnColor ??
              (appTheme.isDark ? Colors.transparent : Color(0xFFD5D5D5)));

    final Color resolvedTextColor = isEnabled
        ? (textColor ?? (appTheme.isDark ? dark : white))
        : (appTheme.isDark ? dark : Colors.white);

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: boxRadius ?? BorderRadius.circular(16),
          border: Border.all(
            color: enableBorder == true ? Color(0xFFD5D5D5) : borderColor,
            width: 1,
          ),
          color: backgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: paddingVertical ?? 15.0,
            horizontal: paddingHorizontal ?? 2,
          ),
          child: Center(
            child:
                row ??
                KidText(
                  text,
                  color: resolvedTextColor,
                  weight: FontWeight.w600,
                  size: ts3,
                ),
          ),
        ),
      ),
    );
  }
}
