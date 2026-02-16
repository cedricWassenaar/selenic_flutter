import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/segmented_control/segmented_control_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicSegmentedControlSizes
    extends ThemeExtension<SelenicSegmentedControlSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the small SelenicSegmentedControl.
  final SelenicSegmentedControlSizeProperties sm;

  /// The properties of the medium SelenicSegmentedControl.
  final SelenicSegmentedControlSizeProperties md;

  SelenicSegmentedControlSizes({
    required this.tokens,
    SelenicSegmentedControlSizeProperties? sm,
    SelenicSegmentedControlSizeProperties? md,
  })  : sm = sm ??
            SelenicSegmentedControlSizeProperties(
              segmentBorderRadius: tokens.borders.interactiveSm,
              segmentGap: tokens.sizes.x5s,
              height: tokens.sizes.md,
              iconSizeValue: tokens.sizes.xs,
              segmentPadding:
                  EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              textStyle: tokens.typography.heading.textDefault,
            ),
        md = md ??
            SelenicSegmentedControlSizeProperties(
              segmentBorderRadius: tokens.borders.interactiveSm,
              segmentGap: tokens.sizes.x4s,
              height: tokens.sizes.lg,
              iconSizeValue: tokens.sizes.xs,
              segmentPadding:
                  EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              textStyle: tokens.typography.heading.textDefault,
            );

  @override
  SelenicSegmentedControlSizes copyWith({
    SelenicTokens? tokens,
    SelenicSegmentedControlSizeProperties? sm,
    SelenicSegmentedControlSizeProperties? md,
  }) {
    return SelenicSegmentedControlSizes(
      tokens: tokens ?? this.tokens,
      sm: sm ?? this.sm,
      md: md ?? this.md,
    );
  }

  @override
  SelenicSegmentedControlSizes lerp(
    ThemeExtension<SelenicSegmentedControlSizes>? other,
    double t,
  ) {
    if (other is! SelenicSegmentedControlSizes) return this;

    return SelenicSegmentedControlSizes(
      tokens: tokens.lerp(other.tokens, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicSegmentedControlSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(
          DiagnosticsProperty<SelenicSegmentedControlSizeProperties>("sm", sm))
      ..add(
          DiagnosticsProperty<SelenicSegmentedControlSizeProperties>("md", md));
  }
}
