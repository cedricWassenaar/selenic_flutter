import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:moon_tokens/moon_tokens.dart';

import 'package:selenic_design/src/theme/accordion/accordion_theme.dart';
import 'package:selenic_design/src/theme/alert/alert_theme.dart';
import 'package:selenic_design/src/theme/auth_code/auth_code_theme.dart';
import 'package:selenic_design/src/theme/avatar/avatar_theme.dart';
import 'package:selenic_design/src/theme/bottom_sheet/bottom_sheet_theme.dart';
import 'package:selenic_design/src/theme/breadcrumb/breadcrumb_theme.dart';
import 'package:selenic_design/src/theme/button/button_theme.dart';
import 'package:selenic_design/src/theme/carousel/carousel_theme.dart';
import 'package:selenic_design/src/theme/checkbox/checkbox_theme.dart';
import 'package:selenic_design/src/theme/chip/chip_theme.dart';
import 'package:selenic_design/src/theme/dot_indicator/dot_indicator_theme.dart';
import 'package:selenic_design/src/theme/drawer/drawer_theme.dart';
import 'package:selenic_design/src/theme/dropdown/dropdown_theme.dart';
import 'package:selenic_design/src/theme/effects/effects_theme.dart';
import 'package:selenic_design/src/theme/loaders/circular_loader/circular_loader_theme.dart';
import 'package:selenic_design/src/theme/loaders/linear_loader/linear_loader_theme.dart';
import 'package:selenic_design/src/theme/menu_item/menu_item_theme.dart';
import 'package:selenic_design/src/theme/modal/modal_theme.dart';
import 'package:selenic_design/src/theme/popover/popover_theme.dart';
import 'package:selenic_design/src/theme/progress/circular_progress/circular_progress_theme.dart';
import 'package:selenic_design/src/theme/progress/linear_progress/linear_progress_theme.dart';
import 'package:selenic_design/src/theme/progress_pin/progress_pin_theme.dart';
import 'package:selenic_design/src/theme/radio/radio_theme.dart';
import 'package:selenic_design/src/theme/segmented_control/segmented_control_theme.dart';
import 'package:selenic_design/src/theme/switch/switch_theme.dart';
import 'package:selenic_design/src/theme/tab_bar/tab_bar_theme.dart';
import 'package:selenic_design/src/theme/table/table_theme.dart';
import 'package:selenic_design/src/theme/tag/tag_theme.dart';
import 'package:selenic_design/src/theme/text_area/text_area_theme.dart';
import 'package:selenic_design/src/theme/text_input/text_input_theme.dart';
import 'package:selenic_design/src/theme/text_input_group/text_input_group_theme.dart';
import 'package:selenic_design/src/theme/toast/toast_theme.dart';
import 'package:selenic_design/src/theme/tokens/borders.dart';
import 'package:selenic_design/src/theme/tokens/opacities.dart';
import 'package:selenic_design/src/theme/tokens/shadows.dart';
import 'package:selenic_design/src/theme/tokens/sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/theme/tokens/transitions.dart';
import 'package:selenic_design/src/theme/tokens/typography/typography.dart';
import 'package:selenic_design/src/theme/tooltip/tooltip_theme.dart';

@immutable
class SelenicTheme extends ThemeExtension<SelenicTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The theming of the Selenic Design System SelenicAccordion widget.
  final SelenicAccordionTheme accordionTheme;

  /// The theming of the Selenic Design System SelenicAlert widget.
  final SelenicAlertTheme alertTheme;

  /// The theming of the Selenic Design System SelenicAuthCode widget.
  final SelenicAuthCodeTheme authCodeTheme;

  /// The theming of the Selenic Design System SelenicAvatar widget.
  final SelenicAvatarTheme avatarTheme;

  /// The theming of the Selenic Design System SelenicBottomSheet widget.
  final SelenicBottomSheetTheme bottomSheetTheme;

  /// The theming of the Selenic Design System SelenicBreadcrumb widget.
  final SelenicBreadcrumbTheme breadcrumbTheme;

  /// The theming of the Selenic Design System SelenicButton widget.
  final SelenicButtonTheme buttonTheme;

  /// The theming of the Selenic Design System SelenicCarousel widget.
  final SelenicCarouselTheme carouselTheme;

  /// The theming of the Selenic Design System SelenicCheckbox widget.
  final SelenicCheckboxTheme checkboxTheme;

  /// The theming of the Selenic Design System SelenicChip widget.
  final SelenicChipTheme chipTheme;

  /// The theming of the Selenic Design System SelenicCircularLoader widget.
  final SelenicCircularLoaderTheme circularLoaderTheme;

  /// The theming of the Selenic Design System SelenicCircularProgress widget.
  final SelenicCircularProgressTheme circularProgressTheme;

  /// The theming of the Selenic Design System SelenicDotIndicator widget.
  final SelenicDotIndicatorTheme dotIndicatorTheme;

  /// The theming of the Selenic Design System SelenicDrawer widget.
  final SelenicDrawerTheme drawerTheme;

  /// The theming of the Selenic Design System SelenicDropdown widget.
  final SelenicDropdownTheme dropdownTheme;

  /// The theming of the Selenic Design System effects.
  final SelenicEffectsTheme effects;

  /// The theming of the Selenic Design System SelenicLinearLoader widget.
  final SelenicLinearLoaderTheme linearLoaderTheme;

  /// The theming of the Selenic Design System SelenicLinearProgress widget.
  final SelenicLinearProgressTheme linearProgressTheme;

  /// The theming of the Selenic Design System SelenicMenuItem widget.
  final SelenicMenuItemTheme menuItemTheme;

  /// The theming of the Selenic Design System SelenicModal widget.
  final SelenicModalTheme modalTheme;

  /// The theming of the Selenic Design System SelenicPopover widget.
  final SelenicPopoverTheme popoverTheme;

  /// The theming of the Selenic Design System SelenicProgressPin widget.
  final SelenicProgressPinTheme progressPinTheme;

  /// The theming of the Selenic Design System SelenicRadio widget.
  final SelenicRadioTheme radioTheme;

  /// The theming of the Selenic Design System SelenicSegmentedControl widget.
  final SelenicSegmentedControlTheme segmentedControlTheme;

  /// The theming of the Selenic Design System SelenicSwitch widget.
  final SelenicSwitchTheme switchTheme;

  /// The theming of the Selenic Design System SelenicTabBar widget.
  final SelenicTabBarTheme tabBarTheme;

  /// The theming of the Selenic Design System SelenicTable widget.
  final SelenicTableTheme tableTheme;

  /// The theming of the Selenic Design System SelenicTag widget.
  final SelenicTagTheme tagTheme;

  /// The theming of the Selenic Design System SelenicTextArea widget.
  final SelenicTextAreaTheme textAreaTheme;

  /// The theming of the Selenic Design System SelenicTextInput widget.
  final SelenicTextInputTheme textInputTheme;

  /// The theming of the Selenic Design System SelenicTextInputGroup widget.
  final SelenicTextInputGroupTheme textInputGroupTheme;

  /// The theming of the Selenic Design System SelenicToast widget.
  final SelenicToastTheme toastTheme;

  /// The theming of the Selenic Design System SelenicTooltip widget.
  final SelenicTooltipTheme tooltipTheme;

  SelenicTheme({
    required this.tokens,
    SelenicAccordionTheme? accordionTheme,
    SelenicAlertTheme? alertTheme,
    SelenicAuthCodeTheme? authCodeTheme,
    SelenicAvatarTheme? avatarTheme,
    SelenicBottomSheetTheme? bottomSheetTheme,
    SelenicBreadcrumbTheme? breadcrumbTheme,
    SelenicButtonTheme? buttonTheme,
    SelenicCarouselTheme? carouselTheme,
    SelenicCheckboxTheme? checkboxTheme,
    SelenicChipTheme? chipTheme,
    SelenicCircularLoaderTheme? circularLoaderTheme,
    SelenicCircularProgressTheme? circularProgressTheme,
    SelenicDotIndicatorTheme? dotIndicatorTheme,
    SelenicDrawerTheme? drawerTheme,
    SelenicDropdownTheme? dropdownTheme,
    SelenicEffectsTheme? effects,
    SelenicLinearLoaderTheme? linearLoaderTheme,
    SelenicLinearProgressTheme? linearProgressTheme,
    SelenicMenuItemTheme? menuItemTheme,
    SelenicModalTheme? modalTheme,
    SelenicPopoverTheme? popoverTheme,
    SelenicProgressPinTheme? progressPinTheme,
    SelenicRadioTheme? radioTheme,
    SelenicSegmentedControlTheme? segmentedControlTheme,
    SelenicSwitchTheme? switchTheme,
    SelenicTabBarTheme? tabBarTheme,
    SelenicTableTheme? tableTheme,
    SelenicTagTheme? tagTheme,
    SelenicTextAreaTheme? textAreaTheme,
    SelenicTextInputTheme? textInputTheme,
    SelenicTextInputGroupTheme? textInputGroupTheme,
    SelenicToastTheme? toastTheme,
    SelenicTooltipTheme? tooltipTheme,
  })  : accordionTheme =
            accordionTheme ?? SelenicAccordionTheme(tokens: tokens),
        alertTheme = alertTheme ?? SelenicAlertTheme(tokens: tokens),
        authCodeTheme = authCodeTheme ?? SelenicAuthCodeTheme(tokens: tokens),
        avatarTheme = avatarTheme ?? SelenicAvatarTheme(tokens: tokens),
        bottomSheetTheme =
            bottomSheetTheme ?? SelenicBottomSheetTheme(tokens: tokens),
        breadcrumbTheme =
            breadcrumbTheme ?? SelenicBreadcrumbTheme(tokens: tokens),
        buttonTheme = buttonTheme ?? SelenicButtonTheme(tokens: tokens),
        carouselTheme = carouselTheme ?? SelenicCarouselTheme(tokens: tokens),
        checkboxTheme = checkboxTheme ?? SelenicCheckboxTheme(tokens: tokens),
        chipTheme = chipTheme ?? SelenicChipTheme(tokens: tokens),
        circularLoaderTheme =
            circularLoaderTheme ?? SelenicCircularLoaderTheme(tokens: tokens),
        circularProgressTheme = circularProgressTheme ??
            SelenicCircularProgressTheme(tokens: tokens),
        dotIndicatorTheme =
            dotIndicatorTheme ?? SelenicDotIndicatorTheme(tokens: tokens),
        drawerTheme = drawerTheme ?? SelenicDrawerTheme(tokens: tokens),
        dropdownTheme = dropdownTheme ?? SelenicDropdownTheme(tokens: tokens),
        effects = effects ?? SelenicEffectsTheme(tokens: tokens),
        linearLoaderTheme =
            linearLoaderTheme ?? SelenicLinearLoaderTheme(tokens: tokens),
        linearProgressTheme =
            linearProgressTheme ?? SelenicLinearProgressTheme(tokens: tokens),
        menuItemTheme = menuItemTheme ?? SelenicMenuItemTheme(tokens: tokens),
        modalTheme = modalTheme ?? SelenicModalTheme(tokens: tokens),
        popoverTheme = popoverTheme ?? SelenicPopoverTheme(tokens: tokens),
        progressPinTheme =
            progressPinTheme ?? SelenicProgressPinTheme(tokens: tokens),
        radioTheme = radioTheme ?? SelenicRadioTheme(tokens: tokens),
        segmentedControlTheme = segmentedControlTheme ??
            SelenicSegmentedControlTheme(tokens: tokens),
        switchTheme = switchTheme ?? SelenicSwitchTheme(tokens: tokens),
        tabBarTheme = tabBarTheme ?? SelenicTabBarTheme(tokens: tokens),
        tableTheme = tableTheme ?? SelenicTableTheme(tokens: tokens),
        tagTheme = tagTheme ?? SelenicTagTheme(tokens: tokens),
        textAreaTheme = textAreaTheme ?? SelenicTextAreaTheme(tokens: tokens),
        textInputTheme =
            textInputTheme ?? SelenicTextInputTheme(tokens: tokens),
        textInputGroupTheme =
            textInputGroupTheme ?? SelenicTextInputGroupTheme(tokens: tokens),
        toastTheme = toastTheme ?? SelenicToastTheme(tokens: tokens),
        tooltipTheme = tooltipTheme ?? SelenicTooltipTheme(tokens: tokens);

  @override
  SelenicTheme copyWith({
    SelenicTokens? tokens,
    SelenicAccordionTheme? accordionTheme,
    SelenicAlertTheme? alertTheme,
    SelenicAuthCodeTheme? authCodeTheme,
    SelenicAvatarTheme? avatarTheme,
    SelenicBottomSheetTheme? bottomSheetTheme,
    SelenicBreadcrumbTheme? breadcrumbTheme,
    SelenicButtonTheme? buttonTheme,
    SelenicCarouselTheme? carouselTheme,
    SelenicCheckboxTheme? checkboxTheme,
    SelenicChipTheme? chipTheme,
    SelenicCircularLoaderTheme? circularLoaderTheme,
    SelenicCircularProgressTheme? circularProgressTheme,
    SelenicDotIndicatorTheme? dotIndicatorTheme,
    SelenicDrawerTheme? drawerTheme,
    SelenicDropdownTheme? dropdownTheme,
    SelenicEffectsTheme? effects,
    SelenicLinearLoaderTheme? linearLoaderTheme,
    SelenicLinearProgressTheme? linearProgressTheme,
    SelenicMenuItemTheme? menuItemTheme,
    SelenicModalTheme? modalTheme,
    SelenicPopoverTheme? popoverTheme,
    SelenicProgressPinTheme? progressPinTheme,
    SelenicRadioTheme? radioTheme,
    SelenicSegmentedControlTheme? segmentedControlTheme,
    SelenicSwitchTheme? switchTheme,
    SelenicTabBarTheme? tabBarTheme,
    SelenicTableTheme? tableTheme,
    SelenicTagTheme? tagTheme,
    SelenicTextAreaTheme? textAreaTheme,
    SelenicTextInputTheme? textInputTheme,
    SelenicTextInputGroupTheme? textInputGroupTheme,
    SelenicToastTheme? toastTheme,
    SelenicTooltipTheme? tooltipTheme,
  }) {
    return SelenicTheme(
      tokens: tokens ?? this.tokens,
      accordionTheme: accordionTheme ?? this.accordionTheme,
      alertTheme: alertTheme ?? this.alertTheme,
      authCodeTheme: authCodeTheme ?? this.authCodeTheme,
      avatarTheme: avatarTheme ?? this.avatarTheme,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      breadcrumbTheme: breadcrumbTheme ?? this.breadcrumbTheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      carouselTheme: carouselTheme ?? this.carouselTheme,
      checkboxTheme: checkboxTheme ?? this.checkboxTheme,
      chipTheme: chipTheme ?? this.chipTheme,
      circularLoaderTheme: circularLoaderTheme ?? this.circularLoaderTheme,
      circularProgressTheme:
          circularProgressTheme ?? this.circularProgressTheme,
      dotIndicatorTheme: dotIndicatorTheme ?? this.dotIndicatorTheme,
      drawerTheme: drawerTheme ?? this.drawerTheme,
      dropdownTheme: dropdownTheme ?? this.dropdownTheme,
      effects: effects ?? this.effects,
      linearLoaderTheme: linearLoaderTheme ?? this.linearLoaderTheme,
      linearProgressTheme: linearProgressTheme ?? this.linearProgressTheme,
      menuItemTheme: menuItemTheme ?? this.menuItemTheme,
      modalTheme: modalTheme ?? this.modalTheme,
      popoverTheme: popoverTheme ?? this.popoverTheme,
      progressPinTheme: progressPinTheme ?? this.progressPinTheme,
      radioTheme: radioTheme ?? this.radioTheme,
      segmentedControlTheme:
          segmentedControlTheme ?? this.segmentedControlTheme,
      switchTheme: switchTheme ?? this.switchTheme,
      tabBarTheme: tabBarTheme ?? this.tabBarTheme,
      tableTheme: tableTheme ?? this.tableTheme,
      tagTheme: tagTheme ?? this.tagTheme,
      textAreaTheme: textAreaTheme ?? this.textAreaTheme,
      textInputTheme: textInputTheme ?? this.textInputTheme,
      textInputGroupTheme: textInputGroupTheme ?? this.textInputGroupTheme,
      toastTheme: toastTheme ?? this.toastTheme,
      tooltipTheme: tooltipTheme ?? this.tooltipTheme,
    );
  }

  @override
  SelenicTheme lerp(ThemeExtension<SelenicTheme>? other, double t) {
    if (other is! SelenicTheme) return this;

    return SelenicTheme(
      tokens: tokens.lerp(other.tokens, t),
      accordionTheme: accordionTheme.lerp(other.accordionTheme, t),
      alertTheme: alertTheme.lerp(other.alertTheme, t),
      authCodeTheme: authCodeTheme.lerp(other.authCodeTheme, t),
      avatarTheme: avatarTheme.lerp(other.avatarTheme, t),
      bottomSheetTheme: bottomSheetTheme.lerp(other.bottomSheetTheme, t),
      breadcrumbTheme: breadcrumbTheme.lerp(other.breadcrumbTheme, t),
      buttonTheme: buttonTheme.lerp(other.buttonTheme, t),
      carouselTheme: carouselTheme.lerp(other.carouselTheme, t),
      checkboxTheme: checkboxTheme.lerp(other.checkboxTheme, t),
      chipTheme: chipTheme.lerp(other.chipTheme, t),
      circularLoaderTheme:
          circularLoaderTheme.lerp(other.circularLoaderTheme, t),
      circularProgressTheme:
          circularProgressTheme.lerp(other.circularProgressTheme, t),
      dotIndicatorTheme: dotIndicatorTheme.lerp(other.dotIndicatorTheme, t),
      drawerTheme: drawerTheme.lerp(other.drawerTheme, t),
      dropdownTheme: dropdownTheme.lerp(other.dropdownTheme, t),
      effects: effects.lerp(other.effects, t),
      linearLoaderTheme: linearLoaderTheme.lerp(other.linearLoaderTheme, t),
      linearProgressTheme:
          linearProgressTheme.lerp(other.linearProgressTheme, t),
      menuItemTheme: menuItemTheme.lerp(other.menuItemTheme, t),
      modalTheme: modalTheme.lerp(other.modalTheme, t),
      popoverTheme: popoverTheme.lerp(other.popoverTheme, t),
      progressPinTheme: progressPinTheme.lerp(other.progressPinTheme, t),
      radioTheme: radioTheme.lerp(other.radioTheme, t),
      segmentedControlTheme:
          segmentedControlTheme.lerp(other.segmentedControlTheme, t),
      switchTheme: switchTheme.lerp(other.switchTheme, t),
      tabBarTheme: tabBarTheme.lerp(other.tabBarTheme, t),
      tableTheme: tableTheme.lerp(other.tableTheme, t),
      tagTheme: tagTheme.lerp(other.tagTheme, t),
      textAreaTheme: textAreaTheme.lerp(other.textAreaTheme, t),
      textInputTheme: textInputTheme.lerp(other.textInputTheme, t),
      textInputGroupTheme:
          textInputGroupTheme.lerp(other.textInputGroupTheme, t),
      toastTheme: toastTheme.lerp(other.toastTheme, t),
      tooltipTheme: tooltipTheme.lerp(other.tooltipTheme, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty(
          "type",
          "SelenicTheme",
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicTokens>(
          "SelenicTokens",
          tokens,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicAccordionTheme>(
          "SelenicAccordionTheme",
          accordionTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicAlertTheme>(
          "SelenicAlertTheme",
          alertTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicAuthCodeTheme>(
          "SelenicAuthCodeTheme",
          authCodeTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicAvatarTheme>(
          "SelenicAvatarTheme",
          avatarTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicBottomSheetTheme>(
          "SelenicBottomSheetTheme",
          bottomSheetTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicBreadcrumbTheme>(
          "SelenicBreadcrumbTheme",
          breadcrumbTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicButtonTheme>(
          "SelenicButtonTheme",
          buttonTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicCarouselTheme>(
          "SelenicCarouselTheme",
          carouselTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicCheckboxTheme>(
          "SelenicCheckboxTheme",
          checkboxTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicChipTheme>(
          "SelenicChipTheme",
          chipTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicCircularLoaderTheme>(
          "SelenicCircularLoaderTheme",
          circularLoaderTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicCircularProgressTheme>(
          "SelenicCircularProgressTheme",
          circularProgressTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicDotIndicatorTheme>(
          "SelenicDotIndicatorTheme",
          dotIndicatorTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicDrawerTheme>(
          "SelenicDrawerTheme",
          drawerTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicDropdownTheme>(
          "SelenicDropdownTheme",
          dropdownTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicEffectsTheme>(
          "SelenicEffectsTheme",
          effects,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicLinearLoaderTheme>(
          "SelenicLinearLoaderTheme",
          linearLoaderTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicLinearProgressTheme>(
          "SelenicLinearProgressTheme",
          linearProgressTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicMenuItemTheme>(
          "SelenicMenuItemTheme",
          menuItemTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicModalTheme>(
          "SelenicModalTheme",
          modalTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicPopoverTheme>(
          "SelenicPopoverTheme",
          popoverTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicProgressPinTheme>(
          "SelenicProgressPinTheme",
          progressPinTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicRadioTheme>(
          "SelenicRadioTheme",
          radioTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicSegmentedControlTheme>(
          "SelenicSegmentedControlTheme",
          segmentedControlTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicSwitchTheme>(
          "SelenicSwitchTheme",
          switchTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicTabBarTheme>(
          "SelenicTabBarTheme",
          tabBarTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicTableTheme>(
          "SelenicTableTheme",
          tableTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicTagTheme>(
          "SelenicTagTheme",
          tagTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicTextAreaTheme>(
          "SelenicTextAreaTheme",
          textAreaTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicTextInputTheme>(
          "SelenicTextInputTheme",
          textInputTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicTextInputGroupTheme>(
          "SelenicTextInputGroupTheme",
          textInputGroupTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicToastTheme>(
          "SelenicToastTheme",
          toastTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicTooltipTheme>(
          "SelenicTooltipTheme",
          tooltipTheme,
        ),
      );
  }
}

extension SelenicThemeX on BuildContext {
  SelenicTheme? get selenicTheme => Theme.of(this).extension<SelenicTheme>();

  SelenicBorders? get selenicBorders => selenicTheme?.tokens.borders;

  MoonColors? get selenicColors => selenicTheme?.tokens.colors;

  SelenicEffectsTheme? get selenicEffects => selenicTheme?.effects;

  SelenicOpacities? get selenicOpacities => selenicTheme?.tokens.opacities;

  SelenicShadows? get selenicShadows => selenicTheme?.tokens.shadows;

  SelenicSizes? get selenicSizes => selenicTheme?.tokens.sizes;

  SelenicTransitions? get selenicTransitions =>
      selenicTheme?.tokens.transitions;

  SelenicTypography? get selenicTypography => selenicTheme?.tokens.typography;
}
