enum ColorsPageSection {
  header,
  mainColors,
  supportiveColors;

  String get titleText => switch (this) {
        header => 'Colors',
        mainColors => 'Main colors',
        supportiveColors => 'Supportive colors',
      };

  String get bodyText => switch (this) {
        header =>
          'Selenic Design System is decentralized and intended to support multiple '
              'products. The use of different-color naming conventions and '
              'numbers makes maintenance more difficult. We decided to give '
              'each of our colors a distinct name, adopting the Dragon Ball Z '
              'approach. Each color name is assigned for a specific purpose, '
              'and the values vary according to the product. Please do not use '
              'hex values; they will not change if you need theme support.',
        mainColors =>
          'The main colors serve a specific purpose. accentPrimary and accentSecondary are used '
              'for accent colors; lineAccent for borders and lines; backgroundPrimary and backgroundSecondary '
              'for backgrounds; textPrimary and textSecondary for text and icons; blandPrimary and '
              'blandSecondary for forced theme-less colors; and overlayPrimary, overlaySecondary, and overlayTertiary '
              'for semi-transparent overlays.',
        supportiveColors =>
          'Every HEX color in all supportive colors is represented by three '
              'shades. The difference between shades is in their transparency '
              'levels. Some colors may have a semantic purpose. warning_* is '
              'usually used for warnings, error_* for errors, and success_* for '
              'success colors. Other colors are used for variety of secondary '
              'reasons.'
      };
}
