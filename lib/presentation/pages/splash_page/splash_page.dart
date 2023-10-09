import 'package:carousel_slider/carousel_slider.dart';
import 'package:daur_minyak/data/models/splash_model.dart';
import 'package:daur_minyak/presentation/misc/methods.dart';
import 'package:daur_minyak/presentation/providers/router/router_provider.dart';
import 'package:daur_minyak/presentation/providers/user_data/user_data_provider.dart';
import 'package:daur_minyak/presentation/widgets/button_widget.dart';
import 'package:daur_minyak/presentation/widgets/carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  final int _current = 0;
  final CarouselController _carouselC = CarouselController();
  final items = splashPageModel;

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (next is AsyncData) {
        if (next.value != null) {
          ref.read(routerProvider).goNamed("main");
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),
            verticalSpace(50.h),
            CarouselWidget(items: items, current: _current),
            verticalSpace(20.h),
            switch (ref.watch(userDataProvider)) {
              AsyncData(:final value) => value == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonWidget(
                            text: "Masuk",
                            onPressed: () {
                              ref.read(routerProvider).pushNamed("login");
                            }),
                        horizontalSpace(20.w),
                        ButtonWidget(
                            text: "Daftar",
                            onPressed: () {
                              ref.read(routerProvider).pushNamed("register");
                            }),
                      ],
                    )
                  : const Center(child: CircularProgressIndicator()),
              _ => const Center(child: CircularProgressIndicator())
            },
            verticalSpace(20.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Row(
                children: [
                  const Text(
                    "Butuh bantuan? Hubungi",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Support Daur Minyak",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(26.h),
          ],
        ),
      ),
    );
  }
}
