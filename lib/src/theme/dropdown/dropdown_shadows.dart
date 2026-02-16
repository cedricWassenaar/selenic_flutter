import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicDropdownShadows extends ThemeExtension<SelenicDropdownShadows>
    with DiagnosticableTreeMixin {
  /// The list of shadows applied to the SelenicDropdown.
  final List<BoxShadow> dropdownShadows;

  const SelenicDropdownShadows({required this.dropdownShadows});

  @override
  SelenicDropdownShadows copyWith({List<BoxShadow>? dropdownShadows}) {
    return SelenicDropdownShadows(
      dropdownShadows: dropdownShadows ?? this.dropdownShadows,
    );
  }

  @override
  SelenicDropdownShadows lerp(
    ThemeExtension<SelenicDropdownShadows>? other,
    double t,
  ) {
    if (other is! SelenicDropdownShadows) return this;

    return SelenicDropdownShadows(
      dropdownShadows: BoxShadow.lerpList(
        dropdownShadows,
        other.dropdownShadows,
        t,
      )!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty(
          "type",
          "SelenicDropdownShadows",
        ),
      )
      ..add(
        DiagnosticsProperty<List<BoxShadow>>(
          "dropdownShadows",
          dropdownShadows,
        ),
      );
  }
}
