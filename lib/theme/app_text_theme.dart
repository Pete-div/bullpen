




import '../_lib.dart';

class AppTextStyles {
  final bool isDark;

  AppTextStyles({required this.isDark});

  TextStyle get bodyLarge => TextStyle(
        fontFamily: Constant.fontsFamily,
        color: isDark ? textFieldColor : const Color(0xff606060),
        fontWeight: FontWeight.w400,
        fontSize: ts3,
      );

  TextStyle get bodyText1 => TextStyle(
        fontSize: ts2,
        fontWeight: FontWeight.w600,
        color: isDark ? textFieldColor : dark,
        fontStyle: FontStyle.normal,
        fontFamily: Constant.fontsFamily,
      );

  TextStyle get bodyText2 => TextStyle(
        fontSize: ts3,
        fontWeight: FontWeight.w400,
        color: isDark ? Color(0xFFD3D3D3) : dark,
        fontStyle: FontStyle.normal,
        fontFamily: Constant.fontsFamily,
      );

  TextStyle get headerText1 => TextStyle(
        fontSize: ts1,
        fontWeight: FontWeight.w800,
        color: isDark ? textFieldColor :dark,
        fontStyle: FontStyle.normal,
        fontFamily: Constant.fontsFamily,
      );

  TextStyle get headerText2 => TextStyle(
        fontSize: ts2,
        fontWeight: FontWeight.w700,
        color: isDark ? textFieldColor : dark,
        fontStyle: FontStyle.normal,
        fontFamily: Constant.fontsFamily,
      );

  TextStyle get headerText3 => TextStyle(
        fontSize: ts3,
        fontWeight: FontWeight.w600,
        color: isDark ? textFieldColor : dark,
        fontStyle: FontStyle.normal,
        fontFamily: 'DmSans',
      );
}
