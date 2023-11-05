import 'package:daur_minyak/presentation/misc/methods.dart';
import 'package:daur_minyak/presentation/pages/daur_minyak/methods/card_pendapatan.dart';
import 'package:daur_minyak/presentation/pages/daur_minyak/methods/jenis_minyak.dart';
import 'package:daur_minyak/presentation/pages/daur_minyak/methods/title_daur_minyak.dart';
import 'package:daur_minyak/presentation/widgets/appbar_daur_minyak.dart';
import 'package:daur_minyak/presentation/widgets/button_full_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaurMinyakPage extends StatelessWidget {
  const DaurMinyakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFECEC),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarDaurMinyak(
          title: 'Pesan Pengambilan',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(40.h),
            titleDaurMinyak(title: "Jenis Minyak Bekas"),
            verticalSpace(38.h),
            jenisMinyak(),
            verticalSpace(40.h),
            Column(
              children: [
                Stack(
                  children: [
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 32.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            verticalSpace(25.h),
            titleDaurMinyak(title: "Pendapatan Kamu"),
            verticalSpace(10.h),
            cardPendapatan(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ButtonFullWidget(text: "Lanjut", onPressed: () {})],
              ),
            ),
            verticalSpace(40.h),
          ],
        ),
      ),
    );
  }
}
