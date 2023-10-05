import 'package:daur_minyak/data/repositories/dummy/dummy_authentication.dart';
import 'package:daur_minyak/data/repositories/dummy/dummy_user_repository.dart';
import 'package:daur_minyak/data/repositories/firebase/firebase_authentication.dart';
import 'package:daur_minyak/domain/entities/user.dart';
import 'package:daur_minyak/domain/repositories/authentication_repository.dart';
import 'package:daur_minyak/domain/repositories/user_repository.dart';
import 'package:daur_minyak/domain/usecases/login/login.dart';
import 'package:daur_minyak/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Login login = Login(
              authRepository: DummyAuthentication(),
              userRepository: DummyUserRepository(),
            );

            await login(LoginParams(
                    email: "andrianwahyu41@gmail.com", password: "12345678"))
                .then((result) {
              if (result.isSuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(user: result.resultValue!),
                  ),
                );
              } else {
                print(result.resultMessage);
              }
            });
          },
          child: const Text('Login Test'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final User user;
  const SecondPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Text(user.toString()),
      ),
    );
  }
}
