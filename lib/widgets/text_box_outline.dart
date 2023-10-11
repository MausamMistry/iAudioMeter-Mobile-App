import 'package:iaudiometer/utils/theme/light.dart';
import 'package:flutter/material.dart';

class TextBoxOutLine extends StatefulWidget {
  const TextBoxOutLine({
    super.key,
    this.icon,
    this.iconSize,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.radius,
    this.contentPadding,
    this.suffixIcon,
    this.errorText,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.focusNode,
    this.fillColor,
    this.readOnly,
    this.isBorder,
    this.isTextAlignCenter,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final IconData? icon;
  final double? iconSize;
  final Widget? suffixIcon;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final double? radius;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final bool? isBorder;
  final bool? readOnly;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final GestureTapCallback? onTap;
  final bool? isTextAlignCenter;

  @override
  State<TextBoxOutLine> createState() => _TextBoxOutLineState();
}

class _TextBoxOutLineState extends State<TextBoxOutLine> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      cursorColor: lightColorScheme.secondary,
      readOnly: widget.readOnly ?? false,
      textAlign: widget.isTextAlignCenter != null && widget.isTextAlignCenter == true ? TextAlign.center : TextAlign.start,
      decoration: InputDecoration(
        counterText: "",
        filled: true,
        isDense: widget.focusNode != null && widget.focusNode!.hasFocus == true ? true : false,
        fillColor: widget.fillColor ?? Colors.white,
        contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(vertical: 16),
        enabledBorder: widget.isBorder == null
            ? OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 4)),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
              )
            : null,
        focusedBorder: widget.isBorder == null
            ? OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 4)),
                borderSide: BorderSide(color: lightColorScheme.secondary, width: 1),
              )
            : null,
        border: widget.isBorder == null ? const OutlineInputBorder() : InputBorder.none,
        prefixIcon: widget.icon == null
            ? null
            : Icon(
                widget.icon,
                color: lightColorScheme.secondary.withOpacity(.5),
                size: widget.iconSize,
              ),
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        errorText: widget.errorText,
      ),
    );
  }
}
