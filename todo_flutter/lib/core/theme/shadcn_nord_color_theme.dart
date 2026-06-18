// Nord theme for the `shadcn_flutter` package (sunarya-thito).
//
// Note: this is a DIFFERENT package from `shadcn_ui` (nank1ro). Key API
// differences reflected below:
//   * `ColorScheme` carries its own `brightness` field.
//   * There is no `custom` map — the Aurora accents are mapped onto the
//     built-in `chart1..chart5` slots (used by charts) and exposed via an
//     extension for manual use.
//   * `destructiveForeground` is deprecated (defaults to transparent); it is
//     set here for safety and parity with the bundled themes.
//   * Theme is read with `Theme.of(context).colorScheme`.
//
// shadcn_flutter is standalone and re-exports the Flutter primitives it needs,
// so this single import is all that's required.
import 'package:shadcn_flutter/shadcn_flutter.dart';

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
  static const polarNight4 = Color(
    0xFF7B88A1,
  ); // custom Color for more contrast

  // Snow Storm — light base tones (backgrounds, text in dark mode).
  static const snowStorm0 = Color(0xFFD8DEE9); // nord4  – borders / subtle
  static const snowStorm1 = Color(0xFFE5E9F0); // nord5  – muted surface
  static const snowStorm2 = Color(0xFFECEFF4); // nord6  – brightest base

  // Frost — the signature bluish accents.
  static const frostTeal = Color(0xFF8FBCBB); // nord7
  static const frostCyan = Color(0xFF88C0D0); // nord8  – primary accent
  static const frostBlue = Color(0xFF81A1C1); // nord9
  static const frostDeep = Color(0xFF5E81AC); // nord10 – deep blue

  // Aurora — status / categorical colors.
  static const auroraRed = Color(0xFFBF616A); // nord11 – error / destructive
  static const auroraOrange = Color(0xFFD08770); // nord12 – danger / advanced
  static const auroraYellow = Color(0xFFEBCB8B); // nord13 – warning
  static const auroraGreen = Color(0xFFA3BE8C); // nord14 – success
  static const auroraPurple = Color(0xFFB48EAD); // nord15 – special / accent
}

/// Light scheme — "bright ambiance" per Nord's guidelines:
/// Snow Storm for surfaces, Polar Night for text.
const nordLightColorScheme = ColorScheme(
  brightness: Brightness.light,
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
  destructiveForeground: Nord.snowStorm2, // ignore: deprecated_member_use
  border: Nord.snowStorm0, // nord4
  input: Nord.snowStorm0, // nord4
  // Deeper frost as the focus ring so it stays visible against a light bg.
  ring: Nord.frostDeep, // nord10
  // Aurora + Frost as the categorical chart palette.
  chart1: Nord.frostCyan, // nord8
  chart2: Nord.auroraGreen, // nord14
  chart3: Nord.auroraYellow, // nord13
  chart4: Nord.auroraOrange, // nord12
  chart5: Nord.auroraPurple, // nord15
);

/// Dark scheme — "dark ambiance" per Nord's guidelines:
/// Polar Night for surfaces, Snow Storm for text.
const nordDarkColorScheme = ColorScheme(
  brightness: Brightness.dark,
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
  // nord3 is Nord's "comment" tone — intentionally low-contrast on nord0.
  // If placeholders/secondary labels feel too dim for accessibility, lift this
  // toward Snow Storm, e.g. const Color(0xFF7B88A1) (an off-palette mid-grey).
  mutedForeground: Nord.polarNight4, // nord3
  accent: Nord.polarNight2, // nord2 (hover surfaces)
  accentForeground: Nord.snowStorm0,
  destructive: Nord.auroraRed, // nord11
  destructiveForeground: Nord.snowStorm2, // ignore: deprecated_member_use
  border: Nord.polarNight3, // nord3
  input: Nord.polarNight3, // nord3
  // Bright frost ring — highly visible on the dark Polar Night background.
  ring: Nord.frostCyan, // nord8
  chart1: Nord.frostCyan, // nord8
  chart2: Nord.auroraGreen, // nord14
  chart3: Nord.auroraYellow, // nord13
  chart4: Nord.auroraOrange, // nord12
  chart5: Nord.auroraPurple, // nord15
);

/// The Aurora accents, exposed for manual use. shadcn_flutter has no `custom`
/// map, and Aurora is identical in light and dark mode, so these simply return
/// the constants — reachable as `Theme.of(context).colorScheme.auroraGreen`.
extension NordAuroraColors on ColorScheme {
  Color get auroraRed => Nord.auroraRed;
  Color get auroraOrange => Nord.auroraOrange;
  Color get auroraYellow => Nord.auroraYellow;
  Color get auroraGreen => Nord.auroraGreen;
  Color get auroraPurple => Nord.auroraPurple;
}

/// Shortcut so call sites can read the active scheme as `context.colors`
/// instead of `Theme.of(context).colorScheme`.
/// Resolves to the light or dark scheme automatically, and the calling widget
/// rebuilds if the active theme ever changes.
extension ShadColorsContext on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}

/// Ready-made ThemeData. `radius` (0.5) and `scaling` (1) keep shadcn_flutter's
/// defaults — adjust `radius` if you want sharper or rounder components.
const nordLightTheme = ThemeData(
  colorScheme: nordLightColorScheme,
  density: Density.reducedDensity,
);
const nordDarkTheme = ThemeData(
  colorScheme: nordDarkColorScheme,
  density: Density.reducedDensity,
);

/// Drop-in usage. Providing both `theme` and `darkTheme` lets ShadcnApp follow
/// the OS brightness automatically (themeMode defaults to ThemeMode.system) —
/// no manual toggle required.
class NordApp extends StatelessWidget {
  const NordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp(
      title: 'Nord',
      theme: nordLightTheme,
      darkTheme: nordDarkTheme,
      // home: const YourHomePage(),
    );
  }
}

/// Builds a badge style filled with [background]. If [foreground] is omitted,
/// a readable text color is chosen automatically from the background's
/// luminance (light text on dark fills, dark text on pastel fills).
/// The size/density/shape match `PrimaryBadge`'s defaults so the result keeps
/// the compact badge shape rather than full button proportions.
AbstractButtonStyle auroraBadgeStyle(Color background, {Color? foreground}) {
  final fg =
      foreground ??
      (background.computeLuminance() < 0.5
          ? Nord.snowStorm2
          : Nord.polarNight0);
  return const ButtonStyle.primary(
    size: ButtonSize.small,
    density: ButtonDensity.dense,
    shape: ButtonShape.rectangle,
  ).copyWith(
    decoration: (context, states, value) =>
        (value as BoxDecoration).copyWith(color: background),
    textStyle: (context, states, value) =>
        value.copyWith(color: fg, fontWeight: FontWeight.w500),
  );
}

/// A badge filled with any color: `AuroraBadge(Nord.auroraGreen, child: Text('Ok'))`.
///
/// Mirrors `PrimaryBadge`'s API (child, leading, trailing, onPressed) but takes
/// a required fill [color] as its first argument. Pass [foreground] only if you
/// want to override the auto-selected text color.
///
/// Semantic shortcuts map to the Aurora accents:
/// `AuroraBadge.success(child: Text('Done'))`, `.warning`, `.error`, `.danger`,
/// `.special`.
class AuroraBadge extends StatelessWidget {
  final Color color;
  final Color? foreground;
  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onPressed;

  const AuroraBadge(
    this.color, {
    super.key,
    required this.child,
    this.foreground,
    this.leading,
    this.trailing,
    this.onPressed,
  });

  const AuroraBadge.success({
    super.key,
    required this.child,
    this.leading,
    this.trailing,
    this.onPressed,
  }) : color = Nord.auroraGreen,
       foreground = null;

  const AuroraBadge.warning({
    super.key,
    required this.child,
    this.leading,
    this.trailing,
    this.onPressed,
  }) : color = Nord.auroraYellow,
       foreground = null;

  const AuroraBadge.error({
    super.key,
    required this.child,
    this.leading,
    this.trailing,
    this.onPressed,
  }) : color = Nord.auroraRed,
       foreground = null;

  const AuroraBadge.danger({
    super.key,
    required this.child,
    this.leading,
    this.trailing,
    this.onPressed,
  }) : color = Nord.auroraOrange,
       foreground = null;

  const AuroraBadge.special({
    super.key,
    required this.child,
    this.leading,
    this.trailing,
    this.onPressed,
  }) : color = Nord.auroraPurple,
       foreground = null;

  @override
  Widget build(BuildContext context) {
    return PrimaryBadge(
      onPressed: onPressed,
      leading: leading,
      trailing: trailing,
      style: auroraBadgeStyle(color, foreground: foreground),
      child: child,
    );
  }
}
