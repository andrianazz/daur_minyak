import 'package:daur_minyak/presentation/misc/methods.dart';
import 'package:daur_minyak/presentation/providers/router/router_provider.dart';
import 'package:daur_minyak/presentation/providers/user_data/user_data_provider.dart';
import 'package:daur_minyak/presentation/widgets/button_full_widget.dart';
import 'package:daur_minyak/presentation/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:daur_minyak/presentation/extensions/build_context_extensions.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (next is AsyncData) {
        if (next.value != null) {
          ref.read(routerProvider).goNamed("main");
        }
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk Akun',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Silahkan masuk dengan email terdaftar",
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(routerProvider).goNamed("splash");
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          children: [
            verticalSpace(40.h),
            TextFieldWidget(text: "Email", controller: emailC),
            verticalSpace(20.h),
            TextFieldWidget(
              text: "Password",
              controller: passC,
              obscureText: true,
            ),
            verticalSpace(40.h),
            switch (ref.watch(userDataProvider)) {
              AsyncData(:final value) => value == null
                  ? ButtonFullWidget(
                      text: "Masuk",
                      onPressed: () {
                        ref.read(userDataProvider.notifier).login(
                              email: emailC.text,
                              password: passC.text,
                            );
                      })
                  : const Center(child: CircularProgressIndicator()),
              _ => const Center(child: CircularProgressIndicator())
            },
          ],
        ),
      ),
    );
  }
}
