import 'package:daur_minyak/data/repositories/firebase/firebase_authentication.dart';
import 'package:daur_minyak/data/repositories/firebase/firebase_user_repository.dart';
import 'package:daur_minyak/domain/entities/user.dart';
import 'package:daur_minyak/domain/usecases/login/login.dart';
import 'package:daur_minyak/firebase_options.dart';
import 'package:daur_minyak/presentation/providers/repositories/user_repository_provider.dart';
import 'package:daur_minyak/presentation/providers/router/router_provider.dart';
import 'package:daur_minyak/presentation/providers/usecases/login_provider.dart';
import 'package:daur_minyak/presentation/providers/user_data/user_data_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
    );
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userDataProvider, (previous, next) {
      print(previous);
      print(next);
      if (next is AsyncData) {
        if (next.value != null) {
          ref.read(routerProvider).goNamed("main");
        }
      } else if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(next.error.toString()),
        ));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: switch (ref.watch(userDataProvider)) {
          AsyncData(:final value) => value == null
              ? SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(userDataProvider.notifier).login(
                            email: "edho@gmail.com",
                            password: "123456",
                          );
                    },
                    child: const Text("Login"),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
          _ => const Center(child: CircularProgressIndicator())
        },
      ),
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      print(previous);
      print(next);
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed("login");
      } else if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(next.error.toString()),
        ));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              ref.watch(userDataProvider).when(
                    data: (data) => data.toString(),
                    error: (error, stackTrace) => '',
                    loading: () => "Loading",
                  ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(userDataProvider.notifier).logout();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
