import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/src/utils/color_premul_lerp.dart'
    show colorPremulLerp;

@immutable
class SelenicColors extends ThemeExtension<SelenicColors>
    with DiagnosticableTreeMixin {
  static const light = SelenicColors(
    accentPrimary: Color.fromARGB(255, 43, 54, 185),
    accentSecondary: Color.fromARGB(255, 72, 51, 175),
    lineAccent: Color(0xFFDCDEE3),
    backgroundPrimary: Color(0xFFFFFFFF),
    backgroundSecondary: Color(0xFFF6F7F9),
    bodyTextPrimary: Color(0xFF000000),
    bodyTextSecondary: Color(0xFF687083),
    filledButton: Color(0xFFFFFFFF),
    outlinedButton: Color(0xFF000000),
    hoverPrimary: Color(0x1F5C33CF),
    hoverSecondary: Color(0x0A000000),
    overlayModal: Color(0x8F000000),
    warning: Color(0xFFFFB319),
    warning_60: Color(0x8FFFB319),
    warning_10: Color(0x14FFB319),
    error: Color(0xFFFF4E64),
    error_60: Color(0x8FFF4E64),
    error_10: Color(0x14FF4E64),
    success: Color(0xFF49B356),
    success_60: Color(0x8F49B356),
    success_10: Color(0x1449B356),
    supportive_2: Color(0xFFD33030),
    supportive_2_60: Color(0x8FD33030),
    supportive_2_10: Color(0x14D33030),
    supportive_3: Color(0xFF95F1D5),
    supportive_3_60: Color(0x8F95F1D5),
    supportive_3_10: Color(0x1495F1D5),
    supportive_4: Color(0xFFB3804A),
    supportive_4_60: Color(0x8FB3804A),
    supportive_4_10: Color(0x14B3804A),
    supportive_6: Color(0xFF3448F0),
    supportive_6_60: Color(0x8F3448F0),
    supportive_6_10: Color(0x143448F0),
    supportive_1: Color(0xFF5C33CF),
    supportive_1_60: Color(0x8F5C33CF),
    supportive_1_10: Color(0x145C33CF),
    supportive_5: Color(0xFF725550),
    supportive_5_60: Color(0x8F725550),
    supportive_5_10: Color(0x14725550),
    textPrimary: Color(0xFF000000), // bodyTextPrimary
    textSecondary: Color(0xFF687083), // bodyTextSecondary
    iconPrimary: Color(0xFF000000), // bodyTextPrimary
    iconSecondary: Color(0xFF687083), // bodyTextSecondary
  );

  static const dark = SelenicColors(
    accentPrimary: Color.fromARGB(255, 43, 54, 185),
    accentSecondary: Color.fromARGB(255, 72, 51, 175),
    lineAccent: Color(0xFF292929),
    backgroundPrimary: Color(0xFF000000),
    backgroundSecondary: Color(0xFF1F1F1F),
    bodyTextPrimary: Color(0xFFFFFFFF),
    bodyTextSecondary: Color(0xFF94989E),
    filledButton: Color(0xFFFFFFFF),
    outlinedButton: Color(0xFF000000),
    hoverPrimary: Color(0x1F5C33CF),
    hoverSecondary: Color(0x14FFFFFF),
    overlayModal: Color(0x8F000000),
    warning: Color(0xFFFFB319),
    warning_60: Color(0x8FFFB319),
    warning_10: Color(0x14FFB319),
    error: Color(0xFFFF4E64),
    error_60: Color(0x8FFF4E64),
    error_10: Color(0x14FF4E64),
    success: Color(0xFF49B356),
    success_60: Color(0x8F49B356),
    success_10: Color(0x1449B356),
    supportive_2: Color(0xFFD33030),
    supportive_2_60: Color(0x8FD33030),
    supportive_2_10: Color(0x14D33030),
    supportive_3: Color(0xFF95F1D5),
    supportive_3_60: Color(0x8F95F1D5),
    supportive_3_10: Color(0x1495F1D5),
    supportive_4: Color(0xFFB3804A),
    supportive_4_60: Color(0x8FB3804A),
    supportive_4_10: Color(0x14B3804A),
    supportive_6: Color(0xFF3448F0),
    supportive_6_60: Color(0x8F3448F0),
    supportive_6_10: Color(0x143448F0),
    supportive_1: Color(0xFF5C33CF),
    supportive_1_60: Color(0x8F5C33CF),
    supportive_1_10: Color(0x145C33CF),
    supportive_5: Color(0xFF725550),
    supportive_5_60: Color(0x8F725550),
    supportive_5_10: Color(0x14725550),
    textPrimary: Color(0xFFFFFFFF), // bodyTextPrimary
    textSecondary: Color(0xFF94989E), // bodyTextSecondary
    iconPrimary: Color(0xFFFFFFFF), // bodyTextPrimary
    iconSecondary: Color(0xFF94989E), // bodyTextSecondary
  );

  // Main colors:

  /// Primary color.
  final Color accentPrimary;

  /// Secondary (accent) color.
  final Color accentSecondary;

  /// Border and line color.
  final Color lineAccent;

  /// Background color.
  final Color backgroundPrimary;

  /// Surface color.
  final Color backgroundSecondary;

  /// Primary body text and icon color.
  final Color bodyTextPrimary;

  /// Secondary body text and icon color.
  final Color bodyTextSecondary;

  /// filled button text and icon color.
  final Color filledButton;

  /// outlined button text and icon color.
  final Color outlinedButton;

  /// Secondary hover effect color.
  final Color hoverPrimary;

  /// Primary hover effect color.
  final Color hoverSecondary;

  /// Modal overlay (scrim) color.
  final Color overlayModal;

  // Supportive and Semantic colors:

  /// Warning color.
  final Color warning;

  /// Warning color.
  final Color warning_60;

  /// Warning color.
  final Color warning_10;

  /// Error color.
  final Color error;

  /// Error color.
  final Color error_60;

  /// Error color.
  final Color error_10;

  /// Success color.
  final Color success;

  /// Success color.
  final Color success_60;

  /// Success color.
  final Color success_10;

  /// Supportive color.
  final Color supportive_1;

  /// Supportive color.
  final Color supportive_1_60;

  /// Supportive color.
  final Color supportive_1_10;

  /// Supportive color.
  final Color supportive_2;

  /// Supportive color.
  final Color supportive_2_60;

  /// Supportive color.
  final Color supportive_2_10;

  /// Supportive color.
  final Color supportive_3;

  /// Supportive color.
  final Color supportive_3_60;

  /// Supportive color.
  final Color supportive_3_10;

  /// Supportive color.
  final Color supportive_4;

  /// Supportive color.
  final Color supportive_4_60;

  /// Supportive color.
  final Color supportive_4_10;

  /// Supportive color.
  final Color supportive_5;

  /// Supportive color.
  final Color supportive_5_60;

  /// Supportive color.
  final Color supportive_5_10;

  /// Supportive color.
  final Color supportive_6;

  /// Supportive color.
  final Color supportive_6_60;

  /// Supportive color.
  final Color supportive_6_10;

  /// Primary text color.
  final Color textPrimary;

  /// Secondary text color.
  final Color textSecondary;

  /// Primary icon color.
  final Color iconPrimary;

  /// Primary icon color.
  final Color iconSecondary;

  const SelenicColors({
    required this.accentPrimary,
    required this.accentSecondary,
    required this.lineAccent,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.bodyTextPrimary,
    required this.bodyTextSecondary,
    required this.filledButton,
    required this.outlinedButton,
    required this.hoverPrimary,
    required this.hoverSecondary,
    required this.overlayModal,
    required this.warning,
    required this.warning_60,
    required this.warning_10,
    required this.error,
    required this.error_60,
    required this.error_10,
    required this.success,
    required this.success_60,
    required this.success_10,
    required this.supportive_1,
    required this.supportive_1_60,
    required this.supportive_1_10,
    required this.supportive_2,
    required this.supportive_2_60,
    required this.supportive_2_10,
    required this.supportive_3,
    required this.supportive_3_60,
    required this.supportive_3_10,
    required this.supportive_4,
    required this.supportive_4_60,
    required this.supportive_4_10,
    required this.supportive_5,
    required this.supportive_5_60,
    required this.supportive_5_10,
    required this.supportive_6,
    required this.supportive_6_60,
    required this.supportive_6_10,
    required this.textPrimary,
    required this.textSecondary,
    required this.iconPrimary,
    required this.iconSecondary,
  });

  @override
  SelenicColors copyWith({
    Color? accentPrimary,
    Color? accentSecondary,
    Color? lineAccent,
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? bodyTextPrimary,
    Color? bodyTextSecondary,
    Color? filledButton,
    Color? outlinedButton,
    Color? hoverPrimary,
    Color? hoverSecondary,
    Color? overlayModal,
    Color? warning,
    Color? warning_60,
    Color? warning_10,
    Color? error,
    Color? error_60,
    Color? error_10,
    Color? success,
    Color? success_60,
    Color? success_10,
    Color? supportive_1,
    Color? supportive_1_60,
    Color? supportive_1_10,
    Color? supportive_2,
    Color? supportive_2_60,
    Color? supportive_2_10,
    Color? supportive_3,
    Color? supportive_3_60,
    Color? supportive_3_10,
    Color? supportive_4,
    Color? supportive_4_60,
    Color? supportive_4_10,
    Color? supportive_5,
    Color? supportive_5_60,
    Color? supportive_5_10,
    Color? supportive_6,
    Color? supportive_6_60,
    Color? supportive_6_10,
    Color? textPrimary,
    Color? textSecondary,
    Color? iconPrimary,
    Color? iconSecondary,
  }) {
    return SelenicColors(
      accentPrimary: accentPrimary ?? this.accentPrimary,
      accentSecondary: accentSecondary ?? this.accentSecondary,
      lineAccent: lineAccent ?? this.lineAccent,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      bodyTextPrimary: bodyTextPrimary ?? this.bodyTextPrimary,
      bodyTextSecondary: bodyTextSecondary ?? this.bodyTextSecondary,
      filledButton: filledButton ?? this.filledButton,
      outlinedButton: outlinedButton ?? this.outlinedButton,
      hoverPrimary: hoverPrimary ?? this.hoverPrimary,
      hoverSecondary: hoverSecondary ?? this.hoverSecondary,
      overlayModal: overlayModal ?? this.overlayModal,
      warning: warning ?? this.warning,
      warning_60: warning_60 ?? this.warning_60,
      warning_10: warning_10 ?? this.warning_10,
      error: error ?? this.error,
      error_60: error_60 ?? this.error_60,
      error_10: error_10 ?? this.error_10,
      success: success ?? this.success,
      success_60: success_60 ?? this.success_60,
      success_10: success_10 ?? this.success_10,
      supportive_1: supportive_1 ?? this.supportive_1,
      supportive_1_60: supportive_1_60 ?? this.supportive_1_60,
      supportive_1_10: supportive_1_10 ?? this.supportive_1_10,
      supportive_2: supportive_2 ?? this.supportive_2,
      supportive_2_60: supportive_2_60 ?? this.supportive_2_60,
      supportive_2_10: supportive_2_10 ?? this.supportive_2_10,
      supportive_3: supportive_3 ?? this.supportive_3,
      supportive_3_60: supportive_3_60 ?? this.supportive_3_60,
      supportive_3_10: supportive_3_10 ?? this.supportive_3_10,
      supportive_4: supportive_4 ?? this.supportive_4,
      supportive_4_60: supportive_4_60 ?? this.supportive_4_60,
      supportive_4_10: supportive_4_10 ?? this.supportive_4_10,
      supportive_5: supportive_5 ?? this.supportive_5,
      supportive_5_60: supportive_5_60 ?? this.supportive_5_60,
      supportive_5_10: supportive_5_10 ?? this.supportive_5_10,
      supportive_6: supportive_6 ?? this.supportive_6,
      supportive_6_60: supportive_6_60 ?? this.supportive_6_60,
      supportive_6_10: supportive_6_10 ?? this.supportive_6_10,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
    );
  }

  @override
  SelenicColors lerp(ThemeExtension<SelenicColors>? other, double t) {
    if (other is! SelenicColors) return this;

    return SelenicColors(
      accentPrimary: colorPremulLerp(
        accentPrimary,
        other.accentPrimary,
        t,
      )!,
      accentSecondary: colorPremulLerp(
        accentSecondary,
        other.accentSecondary,
        t,
      )!,
      lineAccent: colorPremulLerp(
        lineAccent,
        other.lineAccent,
        t,
      )!,
      backgroundPrimary: colorPremulLerp(
        backgroundPrimary,
        other.backgroundPrimary,
        t,
      )!,
      backgroundSecondary: colorPremulLerp(
        backgroundSecondary,
        other.backgroundSecondary,
        t,
      )!,
      bodyTextPrimary: colorPremulLerp(
        bodyTextPrimary,
        other.bodyTextPrimary,
        t,
      )!,
      bodyTextSecondary: colorPremulLerp(
        bodyTextSecondary,
        other.bodyTextSecondary,
        t,
      )!,
      filledButton: colorPremulLerp(
        filledButton,
        other.filledButton,
        t,
      )!,
      outlinedButton: colorPremulLerp(
        outlinedButton,
        other.outlinedButton,
        t,
      )!,
      hoverPrimary: colorPremulLerp(
        hoverPrimary,
        other.hoverPrimary,
        t,
      )!,
      hoverSecondary: colorPremulLerp(
        hoverSecondary,
        other.hoverSecondary,
        t,
      )!,
      overlayModal: colorPremulLerp(
        overlayModal,
        other.overlayModal,
        t,
      )!,
      warning: colorPremulLerp(
        warning,
        other.warning,
        t,
      )!,
      warning_60: colorPremulLerp(
        warning_60,
        other.warning_60,
        t,
      )!,
      warning_10: colorPremulLerp(
        warning_10,
        other.warning_10,
        t,
      )!,
      error: colorPremulLerp(
        error,
        other.error,
        t,
      )!,
      error_60: colorPremulLerp(
        error_60,
        other.error_60,
        t,
      )!,
      error_10: colorPremulLerp(
        error_10,
        other.error_10,
        t,
      )!,
      success: colorPremulLerp(
        success,
        other.success,
        t,
      )!,
      success_60: colorPremulLerp(
        success_60,
        other.success_60,
        t,
      )!,
      success_10: colorPremulLerp(
        success_10,
        other.success_10,
        t,
      )!,
      supportive_1: colorPremulLerp(
        supportive_1,
        other.supportive_1,
        t,
      )!,
      supportive_1_60: colorPremulLerp(
        supportive_1_60,
        other.supportive_1_60,
        t,
      )!,
      supportive_1_10: colorPremulLerp(
        supportive_1_10,
        other.supportive_1_10,
        t,
      )!,
      supportive_2: colorPremulLerp(
        supportive_2,
        other.supportive_2,
        t,
      )!,
      supportive_2_60: colorPremulLerp(
        supportive_2_60,
        other.supportive_2_60,
        t,
      )!,
      supportive_2_10: colorPremulLerp(
        supportive_2_10,
        other.supportive_2_10,
        t,
      )!,
      supportive_3: colorPremulLerp(
        supportive_3,
        other.supportive_3,
        t,
      )!,
      supportive_3_60: colorPremulLerp(
        supportive_3_60,
        other.supportive_3_60,
        t,
      )!,
      supportive_3_10: colorPremulLerp(
        supportive_3_10,
        other.supportive_3_10,
        t,
      )!,
      supportive_4: colorPremulLerp(
        supportive_4,
        other.supportive_4,
        t,
      )!,
      supportive_4_60: colorPremulLerp(
        supportive_4_60,
        other.supportive_4_60,
        t,
      )!,
      supportive_4_10: colorPremulLerp(
        supportive_4_10,
        other.supportive_4_10,
        t,
      )!,
      supportive_5: colorPremulLerp(
        supportive_5,
        other.supportive_5,
        t,
      )!,
      supportive_5_60: colorPremulLerp(
        supportive_5_60,
        other.supportive_5_60,
        t,
      )!,
      supportive_5_10: colorPremulLerp(
        supportive_5_10,
        other.supportive_5_10,
        t,
      )!,
      supportive_6: colorPremulLerp(
        supportive_6,
        other.supportive_6,
        t,
      )!,
      supportive_6_60: colorPremulLerp(
        supportive_6_60,
        other.supportive_6_60,
        t,
      )!,
      supportive_6_10: colorPremulLerp(
        supportive_6_10,
        other.supportive_6_10,
        t,
      )!,
      textPrimary: colorPremulLerp(
        textPrimary,
        other.textPrimary,
        t,
      )!,
      textSecondary: colorPremulLerp(
        textSecondary,
        other.textSecondary,
        t,
      )!,
      iconPrimary: colorPremulLerp(
        iconPrimary,
        other.iconPrimary,
        t,
      )!,
      iconSecondary: colorPremulLerp(
        iconSecondary,
        other.iconSecondary,
        t,
      )!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicColors"))
      ..add(ColorProperty("accentPrimary", accentPrimary))
      ..add(ColorProperty("accentSecondary", accentSecondary))
      ..add(ColorProperty("lineAccent", lineAccent))
      ..add(ColorProperty("backgroundPrimary", backgroundPrimary))
      ..add(ColorProperty("backgroundSecondary", backgroundSecondary))
      ..add(ColorProperty("bodyTextPrimary", bodyTextPrimary))
      ..add(ColorProperty("bodyTextSecondary", bodyTextSecondary))
      ..add(ColorProperty("filledButton", filledButton))
      ..add(ColorProperty("outlinedButton", outlinedButton))
      ..add(ColorProperty("hoverPrimary", hoverPrimary))
      ..add(ColorProperty("heles", hoverSecondary))
      ..add(ColorProperty("hoverSecondary", overlayModal))
      ..add(ColorProperty("warning", warning))
      ..add(ColorProperty("warning60", warning_60))
      ..add(ColorProperty("warning10", warning_10))
      ..add(ColorProperty("error", error))
      ..add(ColorProperty("error60", error_60))
      ..add(ColorProperty("error10", error_10))
      ..add(ColorProperty("success", success))
      ..add(ColorProperty("success60", success_60))
      ..add(ColorProperty("success10", success_10))
      ..add(ColorProperty("supportive_1", supportive_1))
      ..add(ColorProperty("supportive_1_60", supportive_1_60))
      ..add(ColorProperty("supportive_1_10", supportive_1_10))
      ..add(ColorProperty("supportive_2", supportive_2))
      ..add(ColorProperty("supportive_2_60", supportive_2_60))
      ..add(ColorProperty("supportive_2_10", supportive_2_10))
      ..add(ColorProperty("supportive_3", supportive_3))
      ..add(ColorProperty("supportive_3_60", supportive_3_60))
      ..add(ColorProperty("supportive_3_10", supportive_3_10))
      ..add(ColorProperty("supportive_4", supportive_4))
      ..add(ColorProperty("supportive_4_60", supportive_4_60))
      ..add(ColorProperty("supportive_4_10", supportive_4_10))
      ..add(ColorProperty("supportive_5", supportive_5))
      ..add(ColorProperty("supportive_5_60", supportive_5_60))
      ..add(ColorProperty("supportive_5_10", supportive_5_10))
      ..add(ColorProperty("supportive_6", supportive_6))
      ..add(ColorProperty("supportive_6_60", supportive_6_60))
      ..add(ColorProperty("supportive_6_10", supportive_6_10))
      ..add(ColorProperty("textPrimary", textPrimary))
      ..add(ColorProperty("textSecondary", textSecondary))
      ..add(ColorProperty("iconPrimary", iconPrimary))
      ..add(ColorProperty("iconSecondary", iconSecondary));
  }
}
