import 'package:iaudiometer/utils/app_text_style/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
part 'scale.dart';

class AppCss {
  static TextStyle manrope = GoogleFonts.manrope();

  static TextStyle get h1 => manrope.bold.size(FontSizes.f18).letterSpace(.7);

  static TextStyle get h2 => manrope.semiBold.size(FontSizes.f16).letterSpace(.7);

  static TextStyle get h3 => manrope.semiBold.size(FontSizes.f14);

  static TextStyle get body1 => manrope.size(FontSizes.f14);

  static TextStyle get body2 => manrope.size(FontSizes.f12);

  static TextStyle get body3 => manrope.size(FontSizes.f11);

  static TextStyle get caption => manrope.size(FontSizes.f11).letterSpace(.3);

  static TextStyle get footnote => manrope.bold.size(FontSizes.f11);
}
