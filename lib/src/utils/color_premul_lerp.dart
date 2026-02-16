import 'dart:ui';

int _scale255(double v) {
  return (v * 255.0).round().clamp(0, 255);
}

Color _scaleAlpha(Color a, double factor) {
  return a.withAlpha((_scale255(a.a) * factor).round().clamp(0, 255));
}

/// Workaround for Flutter's use of straight alpha instead of premultiplied
/// alpha for color lerping.
Color? colorPremulLerp(Color? a, Color? b, double t) {
  if (b == null) {
    if (a == null) {
      return null;
    } else {
      return _scaleAlpha(a, 1.0 - t);
    }
  } else {
    if (a == null) {
      return _scaleAlpha(b, t);
    } else {
      final weight1 = (1 - t) * a.a;
      final weight2 = t * b.a;
      final summedWeight = weight1 + weight2;
      final w = summedWeight > 0.000001 ? weight2 / summedWeight : 0.5;

      return Color.fromARGB(
        lerpDouble(_scale255(a.a), _scale255(b.a), t)!.toInt().clamp(0, 255),
        lerpDouble(_scale255(a.r), _scale255(b.r), w)!.toInt().clamp(0, 255),
        lerpDouble(_scale255(a.g), _scale255(b.g), w)!.toInt().clamp(0, 255),
        lerpDouble(_scale255(a.b), _scale255(b.b), w)!.toInt().clamp(0, 255),
      );
    }
  }
}
