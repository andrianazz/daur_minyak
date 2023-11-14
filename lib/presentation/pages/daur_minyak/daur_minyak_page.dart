import 'package:daur_minyak/presentation/extensions/integer_extension.dart';
import 'package:daur_minyak/presentation/misc/methods.dart';
import 'package:daur_minyak/presentation/pages/daur_minyak/methods/card_pendapatan.dart';
import 'package:daur_minyak/presentation/pages/daur_minyak/methods/jenis_minyak_qty.dart';
import 'package:daur_minyak/presentation/pages/daur_minyak/methods/title_daur_minyak.dart';
import 'package:daur_minyak/presentation/pages/daur_minyak/models/daur_minyak_model.dart';
import 'package:daur_minyak/presentation/providers/router/router_provider.dart';
import 'package:daur_minyak/presentation/widgets/appbar_daur_minyak.dart';
import 'package:daur_minyak/presentation/widgets/button_full_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaurMinyakPage extends ConsumerStatefulWidget {
  const DaurMinyakPage({super.key});

  @override
  ConsumerState<DaurMinyakPage> createState() => _DaurMinyakPageState();
}

class _DaurMinyakPageState extends ConsumerState<DaurMinyakPage> {
  List<DaurMinyakModel> items = [
    DaurMinyakModel(
      title: "Minyak Goreng",
      image: "assets/icon-minyak.png",
      isSelected: false,
      qty: 0,
      price: 5000,
    ),
    DaurMinyakModel(
      title: "Oli Bekas",
      image: "assets/icon-oli.png",
      isSelected: false,
      qty: 0,
      price: 3000,
    ),
  ];

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.only(
                          right: items.length - 1 == items.lastIndexOf(e)
                              ? 0
                              : 24.w),
                      child: GestureDetector(
                        onTap: () => setState(() {
                          e.isSelected = !e.isSelected;
                        }),
                        child: Stack(
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
                                  border: Border.all(
                                    color: e.isSelected == true
                                        ? Colors.green
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      e.image,
                                      width: 40.w,
                                      height: 40.h,
                                    ),
                                    verticalSpace(7.h),
                                    Text(
                                      e.title,
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            e.isSelected == true
                                ? Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 20.sp,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            verticalSpace(40.h),
            SizedBox(
              height: 80.h,
              child: Column(
                children: items
                    .map(
                      (e) => e.isSelected
                          ? Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 32.h,
                                      padding: EdgeInsets.only(left: 15.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                e.image,
                                                width: 20.sp,
                                              ),
                                              Text(
                                                e.title,
                                                style: TextStyle(
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  if (e.qty <= 1) {
                                                    setState(() {
                                                      e.isSelected = false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      e.qty--;
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.remove_circle_outlined,
                                                  color: Colors.red,
                                                  size: 20.sp,
                                                ),
                                              ),
                                              Text(
                                                "${e.qty} L",
                                                style: TextStyle(
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    e.qty++;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_outlined,
                                                  color: Colors.green,
                                                  size: 20.sp,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: -10.w,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        e.isSelected = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outlined,
                                      color: Colors.red,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    )
                    .toList(),
              ),
            ),
            verticalSpace(25.h),
            titleDaurMinyak(title: "Pendapatan Kamu"),
            verticalSpace(10.h),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: double.infinity,
                height: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textPendapatan("Total Harga", 0),
                    textPendapatan("Biaya Admin 20%", 0),
                    const Divider(
                      height: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                    ),
                    textPendapatan("Estimasi Pendapatan", 0),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonFullWidget(
                    text: "Lanjut",
                    onPressed: () {
                      ref.read(routerProvider).push("/alamat_daur_minyak");
                    },
                  ),
                ],
              ),
            ),
            verticalSpace(40.h),
          ],
        ),
      ),
    );
  }
}

Row textPendapatan(String title, int value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Image.asset(
            "assets/icon_coin.png",
            width: 16.sp,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      Text(
        value.toCurrencyString,
        style: TextStyle(
          fontSize: 8.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
