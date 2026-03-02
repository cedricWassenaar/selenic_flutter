import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

Widget selenicWrapper(BuildContext context, Widget? child) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Example",
    theme: ThemeData.light().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        SelenicTheme(tokens: SelenicTokens.light),
      ],
    ),
    darkTheme: ThemeData.dark().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        SelenicTheme(tokens: SelenicTokens.dark),
      ],
    ),
    home: Scaffold(
      body: Center(
        child: child,
      ),
    ),
  );
}
