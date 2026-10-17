import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:bullpen/_lib.dart';
import 'package:bullpen/route/app_pages.dart';
import 'package:overlay_support/overlay_support.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUpLocator();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((val) async {
    runApp(
      //     DevicePreview(
      //  enabled: true,
      //     tools: const [
      //       ...DevicePreview.defaultTools,
      //       //CustomPlugin(),
      //     ],
      //     builder:((context)=>  const ProviderScope(
      //       child: MyApp(),
      //     )),
      //   )
      ProviderScope(
        child: ScreenUtilInit(
          designSize: Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: false,
          child: MyApp(initialLanguageCode: 'en'),
        ),
      ),
    );
  });
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key, this.initialLanguageCode = 'en'});
  final String initialLanguageCode;

  static ConsumerState<MyApp> of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  bool? isOnBoardingCompleted;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  DateTime? _backgroundTime;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      _backgroundTime = DateTime.now();
    } else if (state == AppLifecycleState.resumed && _backgroundTime != null) {
      Duration duration = DateTime.now().difference(_backgroundTime!);
      if (duration.inMinutes > 2) {
        if (isOnBoardingCompleted == true) {
          // navigatorKey.currentState
          //     ?.pushNamed(Routes.welcomeBackRoute);
        } else {}
      } else {
        return;
      }
    }
  }

  final Map<ThemeMode, ThemeData> appThemes = {
    ThemeMode.light: ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.light,
      fontFamily: 'DmSans',

      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Color(0x33000000),
        selectionHandleColor: Colors.black,
      ),
    ),
    ThemeMode.dark: ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.dark,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Color(0x33000000),
        selectionHandleColor: Colors.black,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'DmSans',
      scaffoldBackgroundColor: Colors.black,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, ch) {
        final themeModel = ref.watch(appThemeModeProvider);
        final appTheme = ref.watch(appThemeProvider);
        return AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarBrightness: appTheme.isDark
                ? Brightness.dark
                : Brightness.light,
            statusBarIconBrightness: appTheme.isDark
                ? Brightness.dark
                : Brightness.light,
            statusBarColor: appTheme.isDark ? Colors.white : Colors.black,
          ),
          child: OverlaySupport.global(
            child: MaterialApp(
              navigatorKey: navigatorKey,
              theme: appThemes[ThemeMode.light],
              darkTheme: appThemes[ThemeMode.dark],
              themeMode: themeModel,
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.splashRoute,
              routes: AppPages.routes,
              builder: (context, child) {
                final mediaQueryData = MediaQuery.of(context);
                final textScaler = mediaQueryData.textScaler.clamp(
                  minScaleFactor: 0.8,
                  maxScaleFactor: 1.2,
                );

                return MediaQuery(
                  data: mediaQueryData.copyWith(textScaler: textScaler),
                  child: EasyLoading.init()(context, child),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
