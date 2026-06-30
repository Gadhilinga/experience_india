import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool isOutlineButton;
  final Color? borderColor;

  const CommonTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.padding,
    this.isOutlineButton = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadiusValue = borderRadius ?? 12;

    if (isOutlineButton) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          side: BorderSide(color: borderColor ?? Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? borderColor ?? Colors.blue,
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
        ),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.blue,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w600,
        ),
      ),
    );
  }
}
