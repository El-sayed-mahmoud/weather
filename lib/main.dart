import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rush/rush.dart';
import 'Utilities/git_it.dart';
import 'Utilities/router_config.dart';
import 'package:provider/provider.dart';
import 'Utilities/theme_helper.dart';
import 'core/Font/font_provider.dart';
import 'core/Language/app_languages.dart';
import 'core/Language/locales.dart';
import 'core/Theme/theme_provider.dart';


const bool enableLargeScreens = true;
const bool enableMediumScreens = false;
const bool enableSmallScreens = true;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  responseSetUp(
    enableLargeScreens: enableLargeScreens,
    enableMediumScreens: enableMediumScreens,
    enableSmallScreens: enableSmallScreens
  );
  await GitIt.initGitIt();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
          ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
          ChangeNotifierProvider<FontProvider>(create: (_) => FontProvider()),
        ],
        child: const EntryPoint(),
      )
  );
}


class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  static Size largeSize = const Size(1920,1080);
  static Size mediumSize = const Size(1000,780);
  static Size smallSize = const Size(375,812);

  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context);
    final appTheme = Provider.of<ThemeProvider>(context);
    appLan.fetchLocale();
    appTheme.fetchTheme();
    return LayoutBuilder(
      builder: (context, constraints) {
        Size appSize = largeSize;
        if (constraints.maxWidth <= 768) {
          if(enableSmallScreens) appSize = smallSize;
        } else if (constraints.maxWidth <= 1200 && constraints.maxWidth > 768) {
          if(enableMediumScreens) appSize = mediumSize;
        } else {
          appSize = largeSize;
        }
        return ScreenUtilInit(
          designSize: appSize,
          builder:(_,__)=> MaterialApp.router(
            scrollBehavior: MyCustomScrollBehavior(),
            routerConfig: GoRouterConfig.router,
            debugShowCheckedModeBanner: false,
            title: 'App Name',
            locale: Locale(appLan.appLang.name),
            theme: appTheme.appThemeMode?.copyWith(
              scaffoldBackgroundColor: ThemeClass.of(context).backGroundColor,
            ),
            supportedLocales: Languages.values.map((e) => Locale(e.name)).toList(),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
              DefaultMaterialLocalizations.delegate
            ],
          ),
        );
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
