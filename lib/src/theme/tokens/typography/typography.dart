import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/tokens/typography/text_styles.dart';

@immutable
class SelenicTypography extends ThemeExtension<SelenicTypography>
    with DiagnosticableTreeMixin {
  static const typography = SelenicTypography(
    body: SelenicTextStyles.body,
    heading: SelenicTextStyles.heading,
  );

  /// The text styles for the body.
  final SelenicTextStyles body;

  /// The text styles for the heading.
  final SelenicTextStyles heading;

  const SelenicTypography({required this.body, required this.heading});

  @override
  SelenicTypography copyWith(
      {SelenicTextStyles? body, SelenicTextStyles? heading}) {
    return SelenicTypography(
      body: body ?? this.body,
      heading: heading ?? this.heading,
    );
  }

  @override
  SelenicTypography lerp(ThemeExtension<SelenicTypography>? other, double t) {
    if (other is! SelenicTypography) return this;

    return SelenicTypography(
      body: body.lerp(other.body, t),
      heading: heading.lerp(other.heading, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicTypography"))
      ..add(DiagnosticsProperty("body", body))
      ..add(DiagnosticsProperty("heading", heading));
  }
}
