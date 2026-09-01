
import 'package:bullpen/_lib.dart';

class CustomTextFieldWidget extends ConsumerWidget {
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final Function(String)? onSubmitted;
  final Function(String)? onchange;
  final Function(String)? onFieldSubmitted;
  final String? hintText;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final bool hasBorder;
  final TextStyle? labelStyle;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextStyle? hintTextStyle;
  final BorderRadius? borderRadius;
  final Color? tappedColor;
  final int? minLines;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? maxLength;
  final bool autofocus;
  final bool? enabled;
  final bool readOnly;
  final List<TextInputFormatter>? textInputFormatters;
  final InputBorder? enableBord;
  final TextStyle? style;
  final InputBorder? focusBorder;

  const CustomTextFieldWidget({
    Key? key,
    this.textInputAction,
    this.focusNode,
    required this.controller,
    this.textInputType,
    this.onSubmitted,
    this.hintText,
    this.backgroundColor,
    this.onTap,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.hasBorder = false,
    this.keyboardType,
    this.hintTextStyle,
    this.enableBord,
    this.focusBorder,
    this.labelStyle,
    this.labelText,
    this.borderRadius,
    this.tappedColor,
    this.minLines,
    this.maxLines,
    this.onchange,
    this.onFieldSubmitted,
    this.maxLength,
    this.autofocus = false,
    this.readOnly = false,
    this.enabled,
    this.style,
    this.textInputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // final appTheme = ref.watch(appThemeProvider);
    return TextFormField(
      cursorColor: Colors.black,
      onChanged: onchange,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.disabled,
      autofocus: autofocus,
      onTap: onTap,
      controller: controller,
      inputFormatters: textInputFormatters,
      validator: validator,
      focusNode: focusNode,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      readOnly: readOnly,
      style:
          style ??
          TextStyle(
            //color: appTheme.textColors.c700,
            color: dark,
            fontWeight: FontWeight.w500,
            fontSize: 13,
            letterSpacing: 13 * -0.03,
          ),
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 8.0,
        ),
        fillColor: backgroundColor ?? Color(0xFFD5D5D5).withOpacity(0.5),
        suffixIcon: suffixIcon,

        suffixIconColor:
            suffixIconColor ?? Theme.of(context).colorScheme.primary,
        prefixIcon: prefixIcon,
        labelText: labelText,
        labelStyle: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
        
        prefixIconColor:
            prefixIconColor ?? Theme.of(context).colorScheme.primary,
        hintText: hintText,
        hintStyle:
            hintTextStyle ??
            TextStyle(
              letterSpacing: 13 * -0.03,
              color: greyColor,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: mildGrey.withOpacity(0.3), width: 1),
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
        errorStyle: TextStyle(
          letterSpacing: 10 * -0.03,
          color: redColor,
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
        enabledBorder:
            enableBord ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: mildGrey.withOpacity(0.3),
                width: controller.text.isNotEmpty ? 1 : 1,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),

        focusedBorder:
            focusBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF181818), width: 1),
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
      ),
    );
  }
}
