# Selenic Design System

[![Analyze and test](https://github.com/cedricWassenaar/selenic_flutter/actions/workflows/analyze_and_test.yml/badge.svg?branch=main)](https://github.com/cedricWassenaar/selenic_flutter/actions/workflows/analyze_and_test.yml)
[![Publish to pub.dev](https://github.com/cedricWassenaar/selenic_flutter/actions/workflows/publish.yml/badge.svg)](https://github.com/cedricWassenaar/selenic_flutter/actions/workflows/publish.yml)
## Design overview

![Search](example/assets/components/search.png)

![Search](example/assets/components/button.png)

![Search](example/assets/components/radio.png)

![Search](example/assets/components/tab_bar.png)

## Disclaimer

This project is a fork of moon_design (MIT-licensed), this project is not affiliated with yolo.com or moon.io.
The latest release of the Moon Design System has been archived and has not received an update in a year. The team seems to have decided to focus on React which is why this repository was created.

## Resources

- No resources yet

## Applying theming and overrides

- Declare tokens variable and optionally override values:

```dart
final lightTokens = SelenicTokens.light.copyWith(
  colors: SelenicColors.light.copyWith(
    accentPrimary: Colors.blue,
    textPrimary: Colors.amber,
  ),
  typography: SelenicTypography.typography.copyWith(
    heading: SelenicTypography.typography.heading.apply(
      // Using variable font and bumping down the font weight compared to the
      // baseline 600 for heading.
      fontFamily: "DMSans",
      fontWeightDelta: -1,
      fontVariations: [const FontVariation('wght', 500)],
    ),
  ),
);

final lightTheme = ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[SelenicTheme(tokens: lightTokens)],
  );
```

- Or if needed override widget theming:

```dart
final lightTheme = ThemeData.light().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    SelenicTheme(tokens: lightTokens).copyWith(
      accordionTheme: SelenicAccordionTheme(tokens: lightTokens).copyWith(
        colors: SelenicAccordionTheme(tokens: lightTokens).colors.copyWith(
              backgroundColor: Colors.green,
            ),
      ),
    ),
  ],
);
```

- Apply the declared theme:

```dart
return MaterialApp(
      title: 'Selenic Design System example',
      theme: lightTheme,
      home: const HomePage(),
 );
```
