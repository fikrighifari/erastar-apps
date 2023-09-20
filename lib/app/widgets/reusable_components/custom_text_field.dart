import 'package:erastar_apps/app/themes/app_themes.dart';
import 'package:erastar_apps/app/themes/color_themes.dart';
import 'package:erastar_apps/export.dart';
import 'package:flutter/services.dart';

Widget displayNone() => SizedBox.shrink();

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon, prefixIcon;
  final Color? backgroundColor, textHintColor, textLabelColor;
  final EdgeInsets? padding, margin;
  final String? hintText, labelText;
  final FocusNode? focusNode;
  final Function(String)? onChange;
  final bool readOnly, obscureText;
  final VoidCallback? onTap;
  final int? maxLine, minLine;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    this.backgroundColor,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
    this.margin,
    this.textHintColor,
    this.textLabelColor,
    this.controller,
    this.focusNode,
    this.textStyle,
    this.labelStyle,
    this.hintText,
    this.labelText,
    this.maxLine,
    this.minLine,
    this.onChange,
    this.onTap,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this.labelText != null
            ? Text(
                this.labelText.toString(),
                style: this.labelStyle ?? defaultTextStyle,
              )
            : displayNone(),
        SizedBox(
          height: 6,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: this.backgroundColor ?? AppColor.whiteColor,
          ),
          child: TextField(
            controller: this.controller,
            maxLines: this.maxLine ?? 1,
            minLines: this.minLine ?? 1,
            keyboardType: this.keyboardType,
            readOnly: this.readOnly,
            onTap: this.onTap,
            style: this.textStyle ?? TextStyle(fontSize: 13),
            decoration: InputDecoration(
              errorText: null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColor.blackColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: this.padding ??
                  EdgeInsets.symmetric(horizontal: 16).copyWith(
                    top: 10,
                    bottom: 10,
                  ),
              hintText: this.hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              suffixIcon: this.suffixIcon,
              prefixIcon: this.prefixIcon,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.primayRedColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            cursorColor: Colors.grey,
            obscureText: this.obscureText,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class SuffixIconTextOutline extends StatelessWidget {
  final String url;
  final double? width;
  final VoidCallback? onTap;
  const SuffixIconTextOutline(
    this.url, {
    Key? key,
    this.onTap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Transform.scale(
        scale: .5,
        child: SvgPicture.asset(
          url,
          width: width,
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final EdgeInsets? padding;
  final Function()? onTap;
  const CustomTextButton({
    Key? key,
    required this.text,
    this.style,
    this.onTap,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          elevation: 0,
          primary: AppColor.primayRedColor,
          padding: padding,
        ),
        onPressed: this.onTap ?? () {},
        child: Text(
          this.text,
          style: style,
        ));
  }
}

class OutlineTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Color? backgroundColor, textHintColor, textLabelColor;
  final EdgeInsets? padding, margin;
  final String? hintText, labelText, helperText;
  final double height;
  final int? maxLine, minLine;
  final TextInputType? keyboardType;
  final bool readOnly, obscureText, filled;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatter;

  const OutlineTextField({
    Key? key,
    this.backgroundColor,
    this.controller,
    this.focusNode,
    this.helperText,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.textLabelColor,
    this.textHintColor,
    this.onTap,
    this.suffixIcon,
    this.onChanged,
    this.minLine,
    this.validator,
    this.inputFormatter,
    this.padding,
    this.margin = const EdgeInsets.only(bottom: 12),
    this.filled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.height = 42,
    this.maxLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: this.backgroundColor ?? AppColor.whiteColor,
      ),
      margin: this.margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: TextFormField(
            inputFormatters: this.inputFormatter,
            focusNode: this.focusNode,
            obscureText: this.obscureText,
            controller: this.controller,
            onChanged: this.onChanged,
            onTap: this.onTap,
            readOnly: this.readOnly,
            keyboardType: this.keyboardType,
            maxLines: this.maxLine,
            minLines: this.minLine,
            validator: this.validator,
            decoration: InputDecoration(
              fillColor: this.readOnly ? AppColor.blackColor : null,
              filled: this.readOnly && this.filled,
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.whiteColor,
                ),
              ),
              border: OutlineInputBorder(),
              contentPadding:
                  padding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              hintText: this.hintText,
              hintStyle: TextStyle(
                color: this.textHintColor,
              ),
              labelStyle: TextStyle(
                color: this.textLabelColor,
              ),
              labelText: this.labelText,
              suffixIcon: this.suffixIcon,
              helperText: this.helperText,
            ),
          ))
        ],
      ),
    );
  }

  static Widget label(
    String label, {
    SuffixIconTextOutline? suffixIcon,
    int? maxline = 1,
    int? minline = 1,
    TextInputType? keyboardType,
    TextEditingController? controller,
    Function(String)? onChanged,
    Function()? onTap,
    bool obscureText = false,
    FormFieldValidator<String>? validator,
    bool readOnly = false,
    bool filled = true,
    FocusNode? focusNode,
    EdgeInsets? margin,
    List<TextInputFormatter>? inputFormatter,
    String? helperText,
    String? hintText,
  }) =>
      OutlineTextField(
          focusNode: focusNode,
          onTap: onTap,
          readOnly: readOnly,
          filled: filled,
          validator: validator,
          obscureText: obscureText,
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
          maxLine: maxline,
          minLine: minline,
          margin: margin ?? EdgeInsets.only(bottom: 12),
          backgroundColor: AppColor.backgroundColor,
          textLabelColor: AppColor.primayRedColor,
          labelText: label,
          suffixIcon: suffixIcon,
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ).copyWith(top: 14),
          inputFormatter: inputFormatter,
          helperText: helperText,
          hintText: hintText,
          textHintColor: AppColor.primayRedColor);
}
