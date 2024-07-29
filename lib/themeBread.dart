import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
      return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4286731539),
      surfaceTint: Color(4286731539),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294958520),
      onPrimaryContainer: Color(4280948480),
      secondary: Color(4282804016),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291292841),
      onSecondaryContainer: Color(4278853888),
      tertiary: Color(4282476596),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290965422),
      onTertiaryContainer: Color(4278395136),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965492),
      onSurface: Color(4280359443),
      onSurfaceVariant: Color(4283450681),
      outline: Color(4286739816),
      outlineVariant: Color(4292134069),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281806631),
      inversePrimary: Color(4294490993),
      primaryFixed: Color(4294958520),
      onPrimaryFixed: Color(4280948480),
      primaryFixedDim: Color(4294490993),
      onPrimaryFixedVariant: Color(4284825088),
      secondaryFixed: Color(4291292841),
      onSecondaryFixed: Color(4278853888),
      secondaryFixedDim: Color(4289516175),
      onSecondaryFixedVariant: Color(4281356058),
      tertiaryFixed: Color(4290965422),
      onTertiaryFixed: Color(4278395136),
      tertiaryFixedDim: Color(4289188756),
      onTertiaryFixedVariant: Color(4280962847),
      surfaceDim: Color(4293253324),
      surfaceBright: Color(4294965492),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963686),
      surfaceContainer: Color(4294569184),
      surfaceContainerHigh: Color(4294239962),
      surfaceContainerHighest: Color(4293845204),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4285346331),
      surfaceTint: Color(4287581235),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289290823),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284038194),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287589729),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283187990),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4286608451),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4280490518),
      onSurfaceVariant: Color(4283318330),
      outline: Color(4285291350),
      outlineVariant: Color(4287199089),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937451),
      inversePrimary: Color(4294948251),
      primaryFixed: Color(4289290823),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4287384113),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287589729),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285814090),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286608451),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284963885),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449425),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963692),
      surfaceContainer: Color(4294765284),
      surfaceContainerHigh: Color(4294436063),
      surfaceContainerHighest: Color(4294041561),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282520065),
      surfaceTint: Color(4287581235),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285346331),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281605139),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284038194),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280885760),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283187990),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281213213),
      outline: Color(4283318330),
      outlineVariant: Color(4283318330),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937451),
      inversePrimary: Color(4294961120),
      primaryFixed: Color(4285346331),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283440135),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284038194),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282394141),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283187990),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281674755),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449425),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963692),
      surfaceContainer: Color(4294765284),
      surfaceContainerHigh: Color(4294436063),
      surfaceContainerHighest: Color(4294041561),
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
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color.fromRGBO(18, 19, 24, 1),
      onSurface: Color.fromRGBO(226, 226, 233, 1),
      onSurfaceVariant: Color(4291151568),
      outline: Color.fromRGBO(143, 144, 153, 1),
      outlineVariant: Color.fromRGBO(68, 70, 79, 1),
      shadow: Color.fromRGBO(0, 0, 0, 1),
      scrim: Color.fromRGBO(0, 0, 0, 1),
      inverseSurface: Color(4293059305),
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
      primary: Color(4294949795),
      surfaceTint: Color(4294948251),
      onPrimary: Color(4281272576),
      primaryContainer: Color(4291525985),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293640884),
      onSecondary: Color(4280684809),
      secondaryContainer: Color(4289562748),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4292529042),
      onTertiary: Color(4280030720),
      tertiaryContainer: Color(4288581981),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898382),
      onSurface: Color(4294965752),
      onSurfaceVariant: Color(4292658879),
      outline: Color(4289961880),
      outlineVariant: Color(4287790969),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041561),
      inversePrimary: Color(4285740831),
      primaryFixed: Color(4294958031),
      onPrimaryFixed: Color(4280682240),
      primaryFixedDim: Color(4294948251),
      onPrimaryFixedVariant: Color(4284294672),
      secondaryFixed: Color(4294958031),
      onSecondaryFixed: Color(4280290053),
      secondaryFixedDim: Color(4293377456),
      onSecondaryFixedVariant: Color(4283052070),
      tertiaryFixed: Color(4294107815),
      onTertiaryFixed: Color(4279636224),
      tertiaryFixedDim: Color(4292200078),
      onTertiaryFixedVariant: Color(4282332682),
      surfaceDim: Color(4279898382),
      surfaceBright: Color(4282529587),
      surfaceContainerLowest: Color(4279503882),
      surfaceContainerLow: Color(4280490518),
      surfaceContainer: Color(4280753434),
      surfaceContainerHigh: Color(4281477156),
      surfaceContainerHighest: Color(4282200623),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965752),
      surfaceTint: Color(4294948251),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949795),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965752),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293640884),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966005),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4292529042),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898382),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965752),
      outline: Color(4292658879),
      outlineVariant: Color(4292658879),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041561),
      inversePrimary: Color(4283243013),
      primaryFixed: Color(4294959318),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949795),
      onPrimaryFixedVariant: Color(4281272576),
      secondaryFixed: Color(4294959318),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293640884),
      onSecondaryFixedVariant: Color(4280684809),
      tertiaryFixed: Color(4294436779),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4292529042),
      onTertiaryFixedVariant: Color(4280030720),
      surfaceDim: Color(4279898382),
      surfaceBright: Color(4282529587),
      surfaceContainerLowest: Color(4279503882),
      surfaceContainerLow: Color(4280490518),
      surfaceContainer: Color(4280753434),
      surfaceContainerHigh: Color(4281477156),
      surfaceContainerHighest: Color(4282200623),
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
     scaffoldBackgroundColor: colorScheme.background,
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
