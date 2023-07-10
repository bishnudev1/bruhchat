import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appstyles {
  static const appbarTitleStyle = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 20.5, color: Color(0xff010000));

  static final headTextStyle = GoogleFonts.archivo(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: const Color(0xff200C08),
  );

  static const subHeadTextStyle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Color(0xff71727A),
      fontFamily: 'ProximaNova');

  static final BoxDecoration buttonStyle = BoxDecoration(
      borderRadius: BorderRadius.circular(10), color: const Color(0xff2A2A36));

  // Original Repo Styles

  static const backgroundColor = Colors.white;

  static const neutralLightLight = Color(0xfff8f9fe);
  static const neutralLightMedium = Color(0xffE8E9F1);
  static const neutralLightDark = Color(0xffd4d6dd);
  static const neutralLightDarkest = Color(0xffc5c6cc);

  static const neutralDarkColor = Color(0XFF8F9098);
  static const neutralDarkMedium = Color(0xff494A50);
  static const neutralDarkDark = Color(0xff252527);

  static const highlightColor = Color(0xff2a2a36);
  static const highlightLight = Color(0xff9c9cd7);
  static const highlightLightest = Color(0xffc8c8ff);

  static const callDetailsBackgroundColor = Color(0xff4ab3ba);
  static const callTimerBackgroundColor = Color(0xff34a0a7);

  static const primaryHeadingColor = Color(0xff010000);
  static const secondaryHeadingColor = Color(0xff200c08);

  static const secondaryTextColor = Color(0xff71727a);

  static const violet = Color(0xFF494965);
  static const cyan = Color(0xFF40A2AA);
  static const warningLight = Color(0xFFfff4e4);
  static const warningMedium = Color(0xFFFFB37C);
  static const warning = Color(0xFFE86339);
  static const errorLight = Color(0xffffe2e5);
  static const successLight = Color(0xffE7F4E8);
  static const successMedium = Color(0xff3AC0A0);

  static const extraLargeHeadingStyle = TextStyle(
    fontSize: 26,
    color: secondaryHeadingColor,
    fontWeight: FontWeight.w800,
    fontFamily: 'PP Writer',
  );

  static const extraLargeHeadingStyle2 = TextStyle(
    fontSize: 26,
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Archivo Black',
  );

  static const largeHeadingStyle = TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.w900,
    letterSpacing: 1,
    fontFamily: 'Canela',
  );

  static const appBarHeadingStyle = TextStyle(
    color: Appstyles.primaryHeadingColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'Proxima Nova',
  );

  static const secondaryHeadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: Color(0xff200c08),
    fontFamily: 'Canela',
  );

  static const secondaryTextStyle = TextStyle(
    color: Color(0xff71727a),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Proxima Nova',
  );

  static const appBarTextStyle = TextStyle(
    color: highlightColor,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const bottomNavTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 7,
    fontWeight: FontWeight.w600,
  );

  static const bottomNavTextStyleInverted = TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );

  static const primaryButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  static const secondaryButtonTextStyle = TextStyle(
    color: highlightColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  static const callDetailsHeadingStyle = TextStyle(
    color: Colors.white,
    fontSize: 21,
    fontWeight: FontWeight.w700,
  );

  static const interviewCallDetailsHeadingStyle = TextStyle(
    color: Colors.white,
    fontSize: 21.7,
    fontWeight: FontWeight.w700,
    fontFamily: 'Proxima Nova',
  );

  static const tertiaryHeadingStyle = TextStyle(
    color: Color(0xff252527),
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: 'Proxima Nova',
  );

  static const bodyTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Appstyles.secondaryHeadingColor,
    fontFamily: 'Inter',
  );

  static const bodyLightTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: neutralDarkColor,
    fontFamily: 'Inter',
  );

  static const secondaryBodyTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: secondaryTextColor,
    fontFamily: 'Inter',
  );

  static const tertiaryBodyTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: secondaryTextColor,
    fontFamily: 'Proxima Nova',
  );

  static const appbarSearchIcon = Icon(
    size: 26,
    CupertinoIcons.search,
    color: Colors.black,
  );

  static const buttonProgressIndicator = SizedBox(
    width: 14,
    height: 14,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      strokeWidth: 2,
      backgroundColor: Appstyles.highlightColor,
    ),
  );

  static ButtonStyle bottomNavButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Appstyles.highlightColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.only(top: 16, bottom: 16)),
  );

  static ButtonStyle bottomNavButtonOutlined = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    side: MaterialStateProperty.all<BorderSide>(
      const BorderSide(color: Appstyles.highlightColor, width: 1.5),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.only(top: 16, bottom: 16)),
  );

  static ButtonStyle secondaryButton = TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(
      horizontal: 26,
      vertical: 11,
    ),
    backgroundColor: Appstyles.violet,
    side: const BorderSide(
      color: Appstyles.neutralLightDarkest,
      width: 0.5,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  );

  static ButtonStyle secondaryButtonOutlined = TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(
      horizontal: 26,
      vertical: 11,
    ),
    backgroundColor: Colors.white,
    side: const BorderSide(
      color: Appstyles.neutralLightDarkest,
      width: 0.5,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  );

  static ButtonStyle zeroPaddingTextButtonStyle = TextButton.styleFrom(
    padding: EdgeInsets.zero,
    minimumSize: Size.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  static InputDecoration textFieldDecoration(String hintText, {String? error}) {
    return InputDecoration(
      hintText: hintText,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xff2a2a36),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: const Color(0XFF8F9098).withOpacity(0.5)),
        borderRadius: BorderRadius.circular(15),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xffbfc6cc),
        ),
      ),
      hintStyle: const TextStyle(letterSpacing: 0.2, fontSize: 14),
      errorText: error,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    );
  }
}
