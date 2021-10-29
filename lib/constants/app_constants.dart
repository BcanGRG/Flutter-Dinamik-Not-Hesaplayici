import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.indigo;
  static const String baslikText = "Ortalama Hesapla";
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: anaRenk,
  );
  static final TextStyle dersListeStyle = GoogleFonts.quicksand(
    fontSize: 22,
    fontWeight: FontWeight.w900,
    color: anaRenk.shade400,
  );
  static final TextStyle subtitleStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    color: anaRenk.shade200,
  );
  static final TextStyle ortalamaGosterBodyStyle = GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: anaRenk,
  );
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w600,
    color: anaRenk,
  );
  static BorderRadius borderRadiusForm = BorderRadius.circular(16);

  static const EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 14, vertical: 8);

  static const EdgeInsets dropDownHorizontal =
      EdgeInsets.symmetric(horizontal: 8);
}
