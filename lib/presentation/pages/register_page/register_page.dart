import 'package:daur_minyak/presentation/extensions/build_context_extensions.dart';
import 'package:daur_minyak/presentation/misc/constants.dart';
import 'package:daur_minyak/presentation/misc/methods.dart';
import 'package:daur_minyak/presentation/providers/router/router_provider.dart';
import 'package:daur_minyak/presentation/providers/user_data/user_data_provider.dart';
import 'package:daur_minyak/presentation/widgets/button_full_widget.dart';
import 'package:daur_minyak/presentation/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController passConfirmC = TextEditingController();
  TextEditingController hpC = TextEditingController();

  bool _isChecked = false;

  @override
  Widget build(BuildContext contex) {
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
              'Daftar Akun',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Lengkapi data dirimu di bawah ini",
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
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 23.w),
            child: Column(
              children: [
                verticalSpace(40.h),
                Stack(
                  children: [
                    Image.asset(
                      "assets/user_pic.png",
                      width: 100.w,
                      height: 100.h,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add_circle_outline_sharp,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(35.h),
                TextFieldWidget(text: "Nama Lengkap", controller: nameC),
                verticalSpace(5.h),
                TextFieldWidget(text: "Email", controller: emailC),
                verticalSpace(5.h),
                TextFieldWidget(
                  text: "Password",
                  controller: passC,
                  obscureText: true,
                ),
                verticalSpace(5.h),
                TextFieldWidget(
                  text: "Password Konfirmasi",
                  controller: passConfirmC,
                  obscureText: true,
                ),
                verticalSpace(5.h),
                TextFieldWidget(text: "No Hp", controller: hpC),
                verticalSpace(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: _isChecked,
                        onChanged: (value) => setState(() {
                          _isChecked = value!;
                        }),
                      ),
                    ),
                    horizontalSpace(5.w),
                    RichText(
                      text: TextSpan(
                          text:
                              "Dengan masuk atau mendaftar, kamu menyetujui \n",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "Syarat Ketentuan ",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.blue,
                              ),
                            ),
                            TextSpan(
                              text: "dan ",
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                            TextSpan(
                              onEnter: (event) => print("test"),
                              text: "Kebijakan Privasi ",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.blue,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                verticalSpace(40.h),
                switch (ref.watch(userDataProvider)) {
                  AsyncData(:final value) => value == null
                      ? ButtonFullWidget(
                          text: "Daftar",
                          onPressed: () {
                            ref.read(userDataProvider.notifier).register(
                                  email: emailC.text,
                                  password: passC.text,
                                  passwordConfirmation: passConfirmC.text,
                                  name: nameC.text,
                                  phoneNumber: hpC.text,
                                  isChecked: _isChecked,
                                );
                          })
                      : const Center(child: CircularProgressIndicator()),
                  _ => const Center(child: CircularProgressIndicator())
                },
                verticalSpace(40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
