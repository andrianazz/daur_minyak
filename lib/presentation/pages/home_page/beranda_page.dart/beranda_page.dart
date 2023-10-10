import 'package:daur_minyak/data/models/info_paket_model.dart';
import 'package:daur_minyak/data/models/tutorial_model.dart';
import 'package:daur_minyak/presentation/misc/constants.dart';
import 'package:daur_minyak/presentation/misc/methods.dart';
import 'package:daur_minyak/presentation/providers/user_data/user_data_provider.dart';
import 'package:daur_minyak/presentation/widgets/carousel_small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BerandaPage extends ConsumerStatefulWidget {
  const BerandaPage({super.key});

  @override
  ConsumerState<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends ConsumerState<BerandaPage> {
  final itemsInfo = infoPaketModel;
  final int _currentCarousel = 0;
  final itemsTutorial = tutorialModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Stack(
          children: [
            Container(
              height: 172.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg_home.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24.w, top: 40.h, right: 24.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                ref.read(userDataProvider.notifier).logout(),
                            child: Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/user_picture.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace(5.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ref.watch(userDataProvider).when(
                                    data: (data) => data!.name.toString(),
                                    error: (error, stackTrace) =>
                                        error.toString(),
                                    loading: () => "Loading..."),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                ref.watch(userDataProvider).when(
                                    data: (data) => data!.phone.toString(),
                                    error: (error, stackTrace) =>
                                        error.toString(),
                                    loading: () => "Loading..."),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(70.h),
                  Container(
                    width: 185.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.r,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: Image.asset(
                              "assets/icon_coin.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          horizontalSpace(5.w),
                          Text(
                            ref.watch(userDataProvider).when(
                                data: (data) => "Rp. ${data!.balance}",
                                error: (error, stackTrace) => error.toString(),
                                loading: () => "Loading..."),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        verticalSpace(40.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Info dan Paket Spesial",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: orangeColor, width: 2.w),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: Text(
                      "LIHAT SEMUA",
                      style: TextStyle(fontSize: 8.sp, color: orangeColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        verticalSpace(10.h),
        CarouselSmallWidget(items: itemsInfo, current: _currentCarousel),
        verticalSpace(20.h),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: itemsTutorial.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100.w,
                height: 120.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 5.h,
                ),
                margin: EdgeInsets.only(
                  left: index == 0 ? 24.w : 0,
                  right: index == 4 ? 24.w : 0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    verticalSpace(5.h),
                    Text(
                      itemsTutorial[index]['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 70.h,
                      child: Image.asset(
                        "assets/icon_duitin.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return horizontalSpace(6.w);
            },
          ),
        ),
      ],
    );
  }
}
