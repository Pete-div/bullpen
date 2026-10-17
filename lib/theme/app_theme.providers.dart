import 'package:bullpen/_lib.dart';

final appThemeModeProvider = NotifierProvider<AppThemeModeNotifier, ThemeMode>(
  AppThemeModeNotifier.new,
);

class AppThemeModeNotifier extends Notifier<ThemeMode>
    with WidgetsBindingObserver {
  @override
  ThemeMode build() {
    WidgetsBinding.instance.addObserver(this);

    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
    });

    _loadTheme();

    return ThemeMode.light;
  }

  Future<void> _loadTheme() async {
    final savedTheme = await themeRepo.getTheme();

    state = savedTheme;

    // Update status bar after loading saved theme.
    _updateStatusBar();
  }

  Future<void> update(ThemeMode newMode) async {
    state = newMode;

    await themeRepo.setThemeMode(mode: newMode);

    _updateStatusBar();
  }

  @override
  void didChangePlatformBrightness() {
    if (state == ThemeMode.system) {
      _updateStatusBar();
    }

    super.didChangePlatformBrightness();
  }

  Brightness get currentBrightness {
    if (state == ThemeMode.light) {
      return Brightness.light;
    }

    if (state == ThemeMode.dark) {
      return Brightness.dark;
    }

    return WidgetsBinding.instance.platformDispatcher.platformBrightness;
  }

  BaseTheme get currentTheme {
    if (state == ThemeMode.light) {
      return AppBaseThemeValues.lightTheme;
    }

    if (state == ThemeMode.dark) {
      return AppBaseThemeValues.darkTheme;
    }

    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    if (brightness == Brightness.light) {
      return AppBaseThemeValues.lightTheme;
    }

    return AppBaseThemeValues.darkTheme;
  }

  void _updateStatusBar() {
    final theme = currentTheme;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: theme.scaffoldBackgroundColor,
        statusBarIconBrightness: theme.brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarColor: theme.scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: theme.brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// THEME DATA PROVIDER
/// ---------------------------------------------------------------------------

final appThemeProvider = Provider<BaseTheme>((ref) {
  final themeMode = ref.watch(appThemeModeProvider);

  BaseTheme theme;

  switch (themeMode) {
    case ThemeMode.light:
      theme = AppBaseThemeValues.lightTheme;
      break;

    case ThemeMode.dark:
      theme = AppBaseThemeValues.darkTheme;
      break;

    case ThemeMode.system:
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;

      if (brightness == Brightness.light) {
        theme = AppBaseThemeValues.lightTheme;
      } else {
        theme = AppBaseThemeValues.darkTheme;
      }
      break;
  }

  // Keep status bar in sync whenever the theme provider rebuilds.
  _updateStatusBar(theme);

  return theme;
});

/// Updates system status/navigation bar based on the current app theme.
void _updateStatusBar(BaseTheme theme) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: theme.scaffoldBackgroundColor,
      statusBarIconBrightness: theme.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      systemNavigationBarColor: theme.scaffoldBackgroundColor,
      systemNavigationBarIconBrightness: theme.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
    ),
  );
}
