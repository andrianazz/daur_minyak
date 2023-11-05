import 'package:daur_minyak/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget jenisMinyak() {
  Map<String, dynamic> items = {
    "Minyak Makan": "assets/icon-minyak.png",
    "Oli Bekas": "assets/icon-oli.png",
  };
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                items.values.elementAt(0),
                width: 40.w,
                height: 40.h,
              ),
              verticalSpace(7.h),
              Text(
                items.keys.elementAt(0),
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      horizontalSpace(24.w),
      Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                items.values.elementAt(1),
                width: 40.w,
                height: 40.h,
              ),
              verticalSpace(7.h),
              Text(
                items.keys.elementAt(1),
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
