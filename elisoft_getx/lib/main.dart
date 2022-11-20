import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/data/services/dependency_injection.dart';
import 'app/data/services/theme_service.dart';
import 'app/data/services/translations_service.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/ui/layouts/main/main_layout.dart';
import 'app/ui/theme/themes.dart';
// ignore: depend_on_referenced_packages
import 'package:catcher/catcher.dart';

//debug configuration
CatcherOptions debugOptions =
    CatcherOptions(SilentReportMode(), [ConsoleHandler()]);

//release configuration
CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
  EmailManualHandler(["ghilman6@gmail.com"])
]);

//profile configuration
CatcherOptions profileOptions =
    CatcherOptions(DialogReportMode(), [ConsoleHandler()]);

void main() async {
  // Either<int, String> response = const Right(1);
  // response.fold((integerValue) => print('Integer : $integerValue'),
  //     (stringValue) => print('String : $stringValue'));
  Catcher(
    runAppFunction: () async {
      WidgetsFlutterBinding.ensureInitialized();
      DependecyInjection.init();
      await dotenv.load(fileName: ".env");

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      );

      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then(
        (_) async {
          await initializeDateFormatting("id_ID", null);
          runApp(const MyApp());
        },
      );
    },
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
    profileConfig: profileOptions,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) {
        return GetMaterialApp(
          title: 'Elisoft_getx',
          debugShowCheckedModeBanner: false,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          themeMode: ThemeService.instance.themeMode,
          translations: Translation(),
          locale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          initialRoute: AppRoutes.LOGIN,
          unknownRoute: AppPages.unknownRoutePage,
          getPages: AppPages.pages,
          builder: (_, child) {
            return MainLayout(child: child!);
          },
        );
      },
      //! Must change it to true if you want to use the ScreenUtil
      designSize: const Size(411, 823),
    );
  }
}
