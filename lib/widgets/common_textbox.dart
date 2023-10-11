import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iaudiometer/utils/theme/light.dart';

class CommonTextBox extends StatefulWidget {
  const CommonTextBox({
    super.key,
    this.labelText,
    this.textStyle,
    this.controller, this.suffix, this.suffixIcon,
  });
  final TextEditingController? controller;
  final String? labelText;
  final TextStyle? textStyle;
  final Widget? suffix;
  final Widget? suffixIcon;

  @override
  State<CommonTextBox> createState() => _CommonTextBoxState();
}

class _CommonTextBoxState extends State<CommonTextBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: GoogleFonts.poppins(fontSize: 15),
      decoration: InputDecoration(
        isDense: true,
        labelStyle: widget.textStyle,
        hintText: widget.labelText,
        hintStyle:widget.textStyle,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: lightColorScheme.onPrimary,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        suffix: widget.suffix,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
