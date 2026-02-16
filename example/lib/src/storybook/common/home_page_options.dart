enum HomePageContentType {
  headerTitle,
  headerSubtitle,
  bodyTitle;

  String get text => switch (this) {
        headerTitle => 'Selenic Design System',
        headerSubtitle => 'Selenic Design is based on moon_flutter',
        bodyTitle => 'Accelerate your mobile development journey with Flutter '
            'selenic components.',
      };
}
