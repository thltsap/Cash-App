import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;

// Color
const Color primary100 = Color(0xFFB2EBF2);
const Color primary200 = Color(0xFF80DEEA);
const Color primary300 = Color(0xFF4DD0E1);
const Color primary400 = Color(0xFF26C6DA);
const Color primary500 = Color(0xFF00BCD4);
const Color primary600 = Color(0xFF00ACC1);
const Color primary700 = Color(0xFF0097A7);
const Color primary800 = Color(0xFF00838F);
const Color primary900 = Color(0xFF006064);

const Color neutral100 = Color(0xFFF5F5F5);
const Color neutral200 = Color(0xFFEEEEEE);
const Color neutral300 = Color(0xFFE0E0E0);
const Color neutral400 = Color(0xFFBDBDBD);
const Color neutral500 = Color(0xFF9E9E9E);
const Color neutral600 = Color(0xFF757575);
const Color neutral700 = Color(0xFF616161);
const Color neutral800 = Color(0xFF424242);
const Color neutral900 = Color(0xFF212121);

const Color exit100 = Color(0xFFFBDED4);
const Color exit200 = Color(0xFFF8B7AA);
const Color exit300 = Color(0xFFEC847D);
const Color exit400 = Color(0xFFD9595D);
const Color exit500 = Color(0xFFC12A3C);
const Color exit600 = Color(0xFFA51E3B);
const Color exit700 = Color(0xFF8A1538);
const Color exit800 = Color(0xFF6F0D34);
const Color exit900 = Color(0xFF5C0831);

const Color secondaryColor = Color(0xFF03A9F4);
const Color successColor = Color(0xFF11C675);
const Color warningColor = Color(0xFFF5D135);
const Color errorColor = Color(0xFFFF6D7E);
const Color linkColor = Color(0xFF2B4FC1);
const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);

FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

// Typography
// TextStyle suratFontStyle = const TextStyle(
//   fontFamily: 'UthmanThaha',
//   fontSize: 24,
// );

// TextStyle ayatFontStyle =
//     const TextStyle(fontFamily: 'UthmanicHafs', fontSize: 24);

TextStyle headingBold1 =
    GoogleFonts.roboto(color: primary900, fontSize: 24, fontWeight: bold);

TextStyle headingMedium1 =
    GoogleFonts.roboto(color: primary900, fontSize: 24, fontWeight: medium);

TextStyle headingRegular1 =
    GoogleFonts.roboto(color: primary900, fontSize: 24, fontWeight: regular);

TextStyle subHeadingBold1 =
    GoogleFonts.roboto(color: primary900, fontSize: 20, fontWeight: bold);

TextStyle subHeadingSemiBold1 =
    GoogleFonts.roboto(color: primary900, fontSize: 20, fontWeight: semiBold);

TextStyle subHeadingMedium1 =
    GoogleFonts.roboto(color: primary900, fontSize: 20, fontWeight: medium);

TextStyle subHeadingRegular1 =
    GoogleFonts.roboto(color: primary900, fontSize: 20, fontWeight: regular);

TextStyle subHeadingSemiBold2 =
    GoogleFonts.roboto(color: primary900, fontSize: 16, fontWeight: semiBold);

TextStyle subHeadingSemiBold2White =
    GoogleFonts.roboto(color: white, fontSize: 16, fontWeight: semiBold);

TextStyle subHeadingMedium2 =
    GoogleFonts.roboto(color: primary900, fontSize: 16, fontWeight: medium);

TextStyle subHeadingRegular2 =
    GoogleFonts.roboto(color: primary900, fontSize: 16, fontWeight: regular);

TextStyle subHeadingRegular2Grey =
    GoogleFonts.roboto(color: neutral400, fontSize: 16, fontWeight: regular);

TextStyle bodyMedium1 =
    GoogleFonts.roboto(color: primary900, fontSize: 16, fontWeight: medium);

TextStyle bodyRegular1 =
    GoogleFonts.roboto(color: primary900, fontSize: 18, fontWeight: regular);

TextStyle bodyRegular1Grey =
    GoogleFonts.roboto(color: neutral400, fontSize: 16, fontWeight: regular);

TextStyle bodyLight1 =
    GoogleFonts.roboto(color: primary900, fontSize: 16, fontWeight: light);

TextStyle bodySemibold2 =
    GoogleFonts.roboto(color: primary900, fontSize: 14, fontWeight: semiBold);

TextStyle bodyMedium2 =
    GoogleFonts.roboto(color: primary900, fontSize: 14, fontWeight: medium);

TextStyle bodyMedium2Grey =
    GoogleFonts.roboto(color: neutral400, fontSize: 14, fontWeight: medium);

TextStyle bodyRegular2 =
    GoogleFonts.roboto(color: primary900, fontSize: 14, fontWeight: regular);

TextStyle bodyLight2 =
    GoogleFonts.roboto(color: primary900, fontSize: 14, fontWeight: light);

TextStyle bodyMedium3 =
    GoogleFonts.roboto(color: primary900, fontSize: 12, fontWeight: medium);

TextStyle bodyRegular3 =
    GoogleFonts.roboto(color: primary900, fontSize: 12, fontWeight: regular);

TextStyle bodyLight3 =
    GoogleFonts.roboto(color: primary900, fontSize: 12, fontWeight: light);

TextStyle buttonRegular1 =
    GoogleFonts.roboto(color: primary900, fontSize: 14, fontWeight: regular);

TextStyle buttonSemiBold1 =
    GoogleFonts.roboto(color: primary900, fontSize: 14, fontWeight: semiBold);

TextStyle buttonMedium1 =
    GoogleFonts.roboto(color: primary900, fontSize: 14, fontWeight: medium);

TextStyle buttonSemiBold2 =
    GoogleFonts.roboto(color: primary900, fontSize: 12, fontWeight: semiBold);

TextStyle buttonMedium2 =
    GoogleFonts.roboto(color: primary900, fontSize: 12, fontWeight: medium);

TextStyle buttonMedium3 =
    GoogleFonts.roboto(color: primary900, fontSize: 10, fontWeight: medium);

TextStyle caption1 =
    GoogleFonts.roboto(color: primary900, fontSize: 12, fontWeight: regular);

TextStyle captionSemiBold1 =
    GoogleFonts.roboto(color: primary900, fontSize: 12, fontWeight: semiBold);

TextStyle captionRegular2 =
    GoogleFonts.roboto(color: primary900, fontSize: 10, fontWeight: regular);

TextStyle captionLight2 =
    GoogleFonts.roboto(color: primary900, fontSize: 10, fontWeight: light);

TextStyle numberStyle =
    GoogleFonts.poppins(color: primary900, fontSize: 12, fontWeight: medium);

TextStyle bodyLatin1 =
    GoogleFonts.roboto(color: neutral600, fontSize: 14, fontWeight: regular);

TextStyle buttonText =
    GoogleFonts.roboto(color: white, fontSize: 12, fontWeight: regular);

TextStyle Judul1 =
    GoogleFonts.roboto(color: black, fontSize: 18, fontWeight: bold);
TextStyle Judul2 =
    GoogleFonts.roboto(color: black, fontSize: 22, fontWeight: bold);
