import 'package:daur_minyak/presentation/pages/daur_minyak/daur_minyak_page.dart';
import 'package:daur_minyak/presentation/pages/home_page/home_page.dart';
import 'package:daur_minyak/presentation/pages/login_page/login_page.dart';
import 'package:daur_minyak/presentation/pages/register_page/register_page.dart';
import 'package:daur_minyak/presentation/pages/splash_page/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(routes: [
      GoRoute(
        path: "/main",
        name: "main",
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: "/splash",
        name: "splash",
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: "/register",
        name: "register",
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: "/daur_minyak",
        name: "daur_minyak",
        builder: (context, state) => const DaurMinyakPage(),
      )
    ], initialLocation: "/splash", debugLogDiagnostics: false);
