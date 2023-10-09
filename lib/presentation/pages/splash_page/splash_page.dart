import 'package:carousel_slider/carousel_slider.dart';
import 'package:daur_minyak/data/models/splash_model.dart';
import 'package:daur_minyak/presentation/misc/methods.dart';
import 'package:daur_minyak/presentation/widgets/button_widget.dart';
import 'package:daur_minyak/presentation/widgets/carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final int _current = 0;
  final CarouselController _carouselC = CarouselController();
  final items = splashPageModel;

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(text: "Masuk", onPressed: () {}),
                horizontalSpace(20.w),
                ButtonWidget(text: "Daftar", onPressed: () {}),
              ],
            ),
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
