// ignore_for_file: deprecated_member_use

part of 'reusable_components.dart';

enum ButtonType { outLined, noOutLined }

class CustomButton extends StatelessWidget {
  final TextWidget? text;
  final Color backgroundColor;
  final bool isRounded;
  final double? borderRadius;
  final ButtonType buttonType;
  final Function()? onPressed;
  final Color borderColor;
  final double height;
  final double width;
  final Widget? leading;

  const CustomButton({
    Key? key,
    this.height = 55,
    this.width = 0,
    this.text,
    this.onPressed,
    this.borderColor = AppColor.blackColor,
    this.backgroundColor = AppColor.blueColor,
    this.borderRadius,
    this.buttonType = ButtonType.noOutLined,
    this.isRounded = false,
    this.leading,
  }) : super(key: key);

  OutlinedBorder getBorderType() {
    switch (buttonType) {
      case ButtonType.outLined:
        return RoundedRectangleBorder(
          side: BorderSide(width: 1, color: borderColor),
          borderRadius: isRounded
              ? BorderRadius.circular(borderRadius ?? 8)
              : BorderRadius.zero,
        );
      case ButtonType.noOutLined:
        return RoundedRectangleBorder(
          borderRadius: isRounded
              ? BorderRadius.circular(borderRadius ?? 8)
              : BorderRadius.zero,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: getBorderType(),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading ?? Container(),
            const Expanded(child: SizedBox()),
            text!,
            const Expanded(child: SizedBox())
          ],
        ),
      ),
    );
  }
}

class MyOutlineButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final EdgeInsets? padding;
  final Color? color, bacgroundColor;
  final Widget? prefixIcon;
  final Function()? onTap;
  final bool? active;
  final BorderRadius? borderRadius;

  const MyOutlineButton({
    Key? key,
    required this.text,
    this.style,
    this.padding,
    this.color,
    this.prefixIcon,
    this.onTap,
    this.active,
    this.borderRadius,
    this.bacgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: borderRadius!,
              )
            : const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
        backgroundColor: bacgroundColor ?? AppColor.netral1(),
        elevation: 0,
        primary: color ?? AppColor.primayRedColor,
        padding: padding,
        side: BorderSide(
          color: color ?? AppColor.primayRedColor,
        ),
      ),
      onPressed: onTap ?? () {},
      child: prefixIcon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefixIcon!,
                const Spacing(width: 8),
                Text(
                  text,
                  style: style,
                ),
              ],
            )
          : Text(
              text,
              style: style,
            ),
    );
  }
}

class Spacing extends StatelessWidget {
  const Spacing({
    Key? key,
    this.width = 0,
    this.height,
  }) : super(key: key);
  final double? height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 12,
      width: width,
    );
  }
}
