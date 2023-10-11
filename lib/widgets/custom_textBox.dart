// ignore_for_file: file_names

import 'package:iaudiometer/utils/theme/light.dart';
import 'package:flutter/material.dart';

class CustomTextBox extends StatefulWidget {
  const CustomTextBox({
    super.key,
    this.fieldName,
    this.hintText,
    this.errorText,
    this.hasFocusBorder,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.focusNode,
    this.maxLength,
    this.onEditingComplete,
    this.minLines,
    this.maxLines,
    this.contentPadding,
    this.textAlign,
    this.onFieldSubmitted,
    this.validator,
  });

  final String? fieldName;
  final String? hintText;
  final String? errorText;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool? hasFocusBorder;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.fieldName != null)
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child: Text(
              widget.fieldName ?? '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        TextFormField(
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType ?? TextInputType.name,
          controller: widget.controller,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          textAlign: widget.textAlign ?? TextAlign.start,
          onChanged: widget.onChanged,
          maxLength: widget.maxLength,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          cursorColor: lightColorScheme.secondary,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          validator: widget.validator,
          decoration: InputDecoration(
            counterText: "",
            hintText: widget.hintText,
            errorText: widget.errorText,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: widget.hasFocusBorder != null && widget.hasFocusBorder == true ? Colors.grey : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: widget.hasFocusBorder != null && widget.hasFocusBorder == true ? Colors.green : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: widget.hasFocusBorder != null && widget.hasFocusBorder == true ? Colors.green : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: const Color(0xFFf3f5f7),
            filled: true,
            contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          ),
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
