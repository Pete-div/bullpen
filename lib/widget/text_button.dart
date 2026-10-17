// ignore_for_file: deprecated_member_us, deprecated_member_use

import 'package:bullpen/_lib.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final Color? borderColor;
  final bool? isFilled;
  final double? elevate;
  final BorderRadius? borderRadius;
  final double? fontsize;
  final FontWeight? fontweight;
  final Widget? icon;
  final Color? color;
  final Color? textColor;

  // ignore: use_key_in_widget_constructors
  const CommonButton({
    required this.text,
    required this.onPressed,
    this.width,
    this.borderColor,
    this.elevate,
    this.color,
    this.height,
    this.icon,
    this.borderRadius,
    this.fontsize,
    this.fontweight,
    this.textColor,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(32.0),
        side: BorderSide(color: borderColor ?? primaryColor),
      ),
      elevation: elevate ?? 1,
      onPressed: onPressed,
      minWidth: width ?? 300,
      height: height ?? 50,
      color: isFilled == true ? color : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            textScaleFactor: 1.0,
            // style: const TextStyle(fontSize: 16, color: Colors.white),
            style: isFilled == true
                ? TextStyle(
                    fontSize: fontsize ?? 16,
                    color: textColor ?? Colors.white,
                    fontWeight: fontweight,
                  )
                : TextStyle(
                    fontSize: fontsize ?? 16,
                    color: textColor ?? primaryColor,
                    fontWeight: fontweight,
                  ),
            maxLines: 2,
          ),
          icon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class CommonButton2 extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final Color? borderColor;
  final bool? isFilled;
  final double? elevate;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final double? fontsize;
  final FontWeight? fontweight;
  final Color? color;
  final Widget? suffixIcon;
  // ignore: use_key_in_widget_constructors
  const CommonButton2({
    required this.text,
    required this.onPressed,
    this.width,
    this.borderColor,
    this.elevate,
    this.textColor,
    this.color,
    this.height,
    this.borderRadius,
    this.suffixIcon,
    this.fontsize,
    this.fontweight,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(32.0),
        side: BorderSide(color: borderColor ?? primaryColor),
      ),
      elevation: elevate ?? 1,
      onPressed: onPressed,
      minWidth: width ?? 300,
      height: height ?? 50,
      color: isFilled == true ? primaryColor : color,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            suffixIcon ?? const SizedBox.shrink(),
            Text(
              text,
              textAlign: TextAlign.center,
              textScaleFactor: 1.0,
              // style: const TextStyle(fontSize: 16, color: Colors.white),
              style: isFilled == true
                  ? TextStyle(
                      fontSize: fontsize ?? 16,
                      color: textColor ?? Colors.white,
                      fontWeight: fontweight,
                    )
                  : TextStyle(
                      fontSize: fontsize ?? 16,
                      color: textColor ?? primaryColor,
                      fontWeight: fontweight,
                    ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  final Widget tch;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final bool? isFilled;

  // ignore: use_key_in_widget_constructors
  const LoadingButton({
    required this.tch,
    required this.onPressed,
    this.width,
    this.height,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
        side: BorderSide(color: primaryColor),
      ),
      onPressed: () {},
      minWidth: width ?? 300,
      height: height ?? 50,
      color: isFilled == true ? primaryColor : Colors.white,
      child: tch,
    );
  }
}
