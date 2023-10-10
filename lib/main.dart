import 'package:daur_minyak/firebase_options.dart';
import 'package:daur_minyak/presentation/misc/constants.dart';
import 'package:daur_minyak/presentation/providers/router/router_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryColor));

    return ScreenUtilInit(
      designSize: const Size(360, 640),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
              seedColor: primaryColor,
              background: backgroundColor,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
            textTheme: TextTheme(
              bodyMedium: GoogleFonts.poppins(),
              bodyLarge: GoogleFonts.poppins(),
              labelLarge: GoogleFonts.poppins(),
            )),
        routeInformationProvider:
            ref.watch(routerProvider).routeInformationProvider,
        routerDelegate: ref.watch(routerProvider).routerDelegate,
        routeInformationParser:
            ref.watch(routerProvider).routeInformationParser,
      ),
    );
  }
}
