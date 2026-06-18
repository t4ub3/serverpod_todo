import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension ShadColors on BuildContext {
  ShadColorScheme get colors => ShadTheme.of(this).colorScheme;
}

/// The 16 official Nord palette colors.
/// Source: https://www.nordtheme.com/docs/colors-and-palettes
///
/// Nord is intentionally a set of "dimmed pastel" tones, so every color here is
/// already the muted variant — no desaturation needed.
abstract final class Nord {
  // Polar Night — dark base tones (backgrounds, surfaces).
  static const polarNight0 = Color(0xFF2E3440); // nord0  – darkest base
  static const polarNight1 = Color(0xFF3B4252); // nord1  – elevated surface
  static const polarNight2 = Color(0xFF434C5E); // nord2  – active / selection
  static const polarNight3 = Color(0xFF4C566A); // nord3  – borders / dim text
  static const polarNight4 = Color(0xFF7B88A1); // custom lighter tone

  // Snow Storm — light base tones (backgrounds, text in dark mode).
  static const snowStorm0 = Color(0xFFD8DEE9); // nord4  – borders / subtle
  static const snowStorm1 = Color(0xFFE5E9F0); // nord5  – muted surface
  static const snowStorm2 = Color(0xFFECEFF4); // nord6  – brightest base

  // Frost — the signature bluish accents.
  static const frostTeal = Color(0xFF8FBCBB); // nord7
  static const frostCyan = Color(0xFF88C0D0); // nord8  – primary accent
  static const frostBlue = Color(0xFF81A1C1); // nord9
  static const frostDeep = Color(0xFF5E81AC); // nord10 – deep blue

  // Aurora — status colors.
  static const auroraRed = Color(0xFFBF616A); // nord11 – error / destructive
  static const auroraOrange = Color(0xFFD08770); // nord12 – warning / danger
  static const auroraYellow = Color(0xFFEBCB8B); // nord13 – warning
  static const auroraGreen = Color(0xFFA3BE8C); // nord14 – success
  static const auroraPurple = Color(0xFFB48EAD); // nord15 – accent / numbers
}

/// The Aurora accents, exposed through `ShadColorScheme.custom`.
/// Nord uses these identically in light and dark mode, so both schemes share
/// this map. The comments note Nord's documented semantic for each.
const Map<String, Color> kNordAurora = {
  'red': Nord.auroraRed, // nord11 – error states
  'orange': Nord.auroraOrange, // nord12 – danger / advanced
  'yellow': Nord.auroraYellow, // nord13 – warning states
  'green': Nord.auroraGreen, // nord14 – success states
  'purple': Nord.auroraPurple, // nord15 – special / uncommon
};

/// Convenient typed access, e.g. `ShadTheme.of(context).colorScheme.green`.
extension NordAuroraColors on ShadColorScheme {
  Color get auroraRed => custom['red']!;
  Color get auroraOrange => custom['orange']!;
  Color get auroraYellow => custom['yellow']!;
  Color get auroraGreen => custom['green']!;
  Color get auroraPurple => custom['purple']!;
}

/// Light scheme — "bright ambiance" per Nord's guidelines:
/// Snow Storm for surfaces, Polar Night for text.
const nordLightColorScheme = ShadColorScheme(
  background: Nord.snowStorm2, // nord6
  foreground: Nord.polarNight0, // nord0
  card: Nord.snowStorm2, // nord6 (defined by borders, not fill)
  cardForeground: Nord.polarNight0, // nord0
  popover: Nord.snowStorm2, // nord6
  popoverForeground: Nord.polarNight0, // nord0
  // nord8 is Nord's own "primary accent". Dark text keeps it readable in both
  // modes, so primary stays the same hue light/dark.
  primary: Nord.frostCyan, // nord8
  primaryForeground: Nord.polarNight0, // nord0
  secondary: Nord.snowStorm1, // nord5
  secondaryForeground: Nord.polarNight0,
  muted: Nord.snowStorm1, // nord5
  mutedForeground: Nord.polarNight3, // nord3 (good contrast on light bg)
  accent: Nord.snowStorm0, // nord4 (hover surfaces)
  accentForeground: Nord.polarNight0,
  destructive: Nord.auroraRed, // nord11
  destructiveForeground: Nord.snowStorm2,
  border: Nord.snowStorm0, // nord4
  input: Nord.snowStorm0, // nord4
  // Deeper frost as the focus ring so it stays visible against a light bg.
  ring: Nord.frostDeep, // nord10
  selection: Nord.snowStorm0, // nord4
  custom: kNordAurora,
);

/// Dark scheme — "dark ambiance" per Nord's guidelines:
/// Polar Night for surfaces, Snow Storm for text.
const nordDarkColorScheme = ShadColorScheme(
  background: Nord.polarNight0, // nord0
  foreground: Nord.snowStorm0, // nord4
  card: Nord.polarNight1, // nord1 (elevated)
  cardForeground: Nord.snowStorm0,
  popover: Nord.polarNight1, // nord1
  popoverForeground: Nord.snowStorm0,
  primary: Nord.frostCyan, // nord8
  primaryForeground: Nord.polarNight0, // nord0
  secondary: Nord.polarNight2, // nord2
  secondaryForeground: Nord.snowStorm0,
  muted: Nord.polarNight2, // nord2
  mutedForeground: Nord.polarNight4, // nord3
  accent: Nord.polarNight2, // nord2 (hover surfaces)
  accentForeground: Nord.snowStorm0,
  destructive: Nord.auroraRed, // nord11
  destructiveForeground: Nord.snowStorm2,
  border: Nord.polarNight3, // nord3
  input: Nord.polarNight3, // nord3
  // Bright frost ring — highly visible on the dark Polar Night background.
  ring: Nord.frostCyan, // nord8
  selection: Nord.polarNight2, // nord2
  custom: kNordAurora,
);

/// Drop-in usage. Switch automatically with the platform brightness, or wire
/// `themeMode` to your own state management to let users toggle.
class NordApp extends StatelessWidget {
  const NordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: nordLightColorScheme,
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: nordDarkColorScheme,
      ),
      // themeMode: ThemeMode.system, // light/dark/system
      // home: const YourHomePage(),
    );
  }
}
