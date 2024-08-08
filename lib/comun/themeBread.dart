import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
      return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff825513),
      surfaceTint: Color(0xff825513),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffddb8),
      onPrimaryContainer: Color(0xff2a1700),
      secondary: Color(0xff466730),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc7eea9),
      onSecondaryContainer: Color(0xff0a2100),
      tertiary: Color(0xff416834),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc2efae),
      onTertiaryContainer: Color(0xff032100),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff211a13),
      onSurfaceVariant: Color(0xff504539),
      outline: Color(0xff827568),
      outlineVariant: Color(0xffd4c4b5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f27),
      inversePrimary: Color(0xfff8bb71),
      primaryFixed: Color(0xffffddb8),
      onPrimaryFixed: Color(0xff2a1700),
      primaryFixedDim: Color(0xfff8bb71),
      onPrimaryFixedVariant: Color(0xff653e00),
      secondaryFixed: Color(0xffc7eea9),
      onSecondaryFixed: Color(0xff0a2100),
      secondaryFixedDim: Color(0xffacd28f),
      onSecondaryFixedVariant: Color(0xff304f1a),
      tertiaryFixed: Color(0xffc2efae),
      onTertiaryFixed: Color(0xff032100),
      tertiaryFixedDim: Color(0xffa7d394),
      onTertiaryFixedVariant: Color(0xff2a4f1f),
      surfaceDim: Color(0xffe5d8cc),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e6),
      surfaceContainer: Color(0xfff9ece0),
      surfaceContainerHigh: Color(0xfff4e6da),
      surfaceContainerHighest: Color(0xffeee0d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6d321b),
      surfaceTint: Color(0xff8f4c33),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa96247),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff593c32),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8f6d61),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4c4316),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff807443),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff231a16),
      onSurfaceVariant: Color(0xff4e403a),
      outline: Color(0xff6c5b56),
      outlineVariant: Color(0xff897771),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2b),
      inversePrimary: Color(0xffffb59b),
      primaryFixed: Color(0xffa96247),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff8c4a31),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8f6d61),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff74554a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff807443),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff675c2d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d1),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xfffceae4),
      surfaceContainerHigh: Color(0xfff7e4df),
      surfaceContainerHighest: Color(0xfff1dfd9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff421201),
      surfaceTint: Color(0xff8f4c33),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6d321b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff341c13),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff593c32),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff292200),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4c4316),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2e211d),
      outline: Color(0xff4e403a),
      outlineVariant: Color(0xff4e403a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2b),
      inversePrimary: Color(0xffffe7e0),
      primaryFixed: Color(0xff6d321b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff501c07),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff593c32),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff40261d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4c4316),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff352c03),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d1),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xfffceae4),
      surfaceContainerHigh: Color(0xfff7e4df),
      surfaceContainerHighest: Color(0xfff1dfd9),
    );
  }

   ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

 static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(178, 197, 255, 1),
      surfaceTint: Color.fromRGBO(178, 197, 255, 1),
      onPrimary: Color.fromRGBO(23, 46, 96, 1),
      primaryContainer: Color.fromRGBO(48, 69, 120, 1),
      onPrimaryContainer: Color.fromRGBO(218, 226, 255, 1),
      secondary: Color.fromARGB(255, 171, 199, 255),
      onSecondary: Color.fromRGBO(12, 48, 95, 1),
      secondaryContainer: Color.fromARGB(255, 40, 70, 119),
      onSecondaryContainer: Color.fromARGB(255, 30, 31, 34),
      tertiary: Color.fromRGBO(135, 209, 235, 1),
      onTertiary: Color.fromRGBO(0, 53, 67, 1),
      tertiaryContainer: Color.fromARGB(255, 0, 78, 96),
      onTertiaryContainer: Color.fromRGBO(181, 235, 255, 1),
      error: Color.fromRGBO(255, 180, 171, 1),
      onError: Color.fromRGBO(105, 0, 5, 1),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color.fromRGBO(18, 19, 24, 1),
      onSurface: Color.fromRGBO(226, 226, 233, 1),
      onSurfaceVariant: Color(0xffc5c6d0),
      outline: Color.fromRGBO(143, 144, 153, 1),
      outlineVariant: Color.fromRGBO(68, 70, 79, 1),
      shadow: Color.fromRGBO(0, 0, 0, 1),
      scrim: Color.fromRGBO(0, 0, 0, 1),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color.fromRGBO(72, 93, 146, 1),
      primaryFixed: Color.fromRGBO(218, 226, 255, 1),
      onPrimaryFixed: Color.fromRGBO(0, 24, 71, 1),
      primaryFixedDim: Color.fromRGBO(178, 197, 255, 1),
      onPrimaryFixedVariant: Color.fromRGBO(48, 69, 120, 1),
      secondaryFixed: Color.fromRGBO(215, 227, 255, 1),
      onSecondaryFixed: Color.fromRGBO(0, 27, 63, 1),
      secondaryFixedDim: Color.fromRGBO(171, 199, 255, 1),
      onSecondaryFixedVariant: Color.fromRGBO(40, 70, 119, 1),
      tertiaryFixed: Color.fromRGBO(181, 235, 255, 1),
      onTertiaryFixed: Color.fromRGBO(0, 31, 40, 1),
      tertiaryFixedDim: Color.fromRGBO(135, 209, 235, 1),
      onTertiaryFixedVariant: Color.fromRGBO(0, 78, 96, 1),
      surfaceDim: Color.fromRGBO(18, 19, 24, 1),
      surfaceBright: Color.fromRGBO(56, 57, 63, 1),
      surfaceContainerLowest: Color.fromRGBO(13, 14, 19, 1),
      surfaceContainerLow: Color.fromRGBO(26, 27, 33, 1),
      surfaceContainer: Color.fromRGBO(30, 31, 37, 1),
      surfaceContainerHigh: Color.fromRGBO(40, 42, 47, 1),
      surfaceContainerHighest: Color.fromRGBO(51, 52, 58, 1),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffbba3),
      surfaceTint: Color(0xffffb59b),
      onPrimary: Color(0xff2f0900),
      primaryContainer: Color(0xffcb7d61),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffebc2b4),
      onSecondary: Color(0xff261109),
      secondaryContainer: Color(0xffad887c),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffdacb92),
      onTertiary: Color(0xff1c1600),
      tertiaryContainer: Color(0xff9e915d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a110e),
      onSurface: Color(0xfffff9f8),
      onSurfaceVariant: Color(0xffdcc6bf),
      outline: Color(0xffb39f98),
      outlineVariant: Color(0xff927f79),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd9),
      inversePrimary: Color(0xff73371f),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff260700),
      primaryFixedDim: Color(0xffffb59b),
      onPrimaryFixedVariant: Color(0xff5d2610),
      secondaryFixed: Color(0xffffdbcf),
      onSecondaryFixed: Color(0xff200b05),
      secondaryFixedDim: Color(0xffe7bdb0),
      onSecondaryFixedVariant: Color(0xff4a3026),
      tertiaryFixed: Color(0xfff2e2a7),
      onTertiaryFixed: Color(0xff161100),
      tertiaryFixedDim: Color(0xffd5c68e),
      onTertiaryFixedVariant: Color(0xff3f360a),
      surfaceDim: Color(0xff1a110e),
      surfaceBright: Color(0xff423733),
      surfaceContainerLowest: Color(0xff140c0a),
      surfaceContainerLow: Color(0xff231a16),
      surfaceContainer: Color(0xff271d1a),
      surfaceContainerHigh: Color(0xff322824),
      surfaceContainerHighest: Color(0xff3d322f),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f8),
      surfaceTint: Color(0xffffb59b),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffbba3),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffebc2b4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf5),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffdacb92),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a110e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f8),
      outline: Color(0xffdcc6bf),
      outlineVariant: Color(0xffdcc6bf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd9),
      inversePrimary: Color(0xff4d1a05),
      primaryFixed: Color(0xffffe0d6),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffbba3),
      onPrimaryFixedVariant: Color(0xff2f0900),
      secondaryFixed: Color(0xffffe0d6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffebc2b4),
      onSecondaryFixedVariant: Color(0xff261109),
      tertiaryFixed: Color(0xfff7e7ab),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffdacb92),
      onTertiaryFixedVariant: Color(0xff1c1600),
      surfaceDim: Color(0xff1a110e),
      surfaceBright: Color(0xff423733),
      surfaceContainerLowest: Color(0xff140c0a),
      surfaceContainerLow: Color(0xff231a16),
      surfaceContainer: Color(0xff271d1a),
      surfaceContainerHigh: Color(0xff322824),
      surfaceContainerHighest: Color(0xff3d322f),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
