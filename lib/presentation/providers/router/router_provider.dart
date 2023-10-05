import 'package:daur_minyak/main.dart';
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
    ], initialLocation: "/login", debugLogDiagnostics: false);
