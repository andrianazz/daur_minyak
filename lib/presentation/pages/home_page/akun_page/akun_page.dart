import 'package:daur_minyak/presentation/misc/constants.dart';
import 'package:daur_minyak/presentation/misc/methods.dart';
import 'package:daur_minyak/presentation/providers/user_data/user_data_provider.dart';
import 'package:daur_minyak/presentation/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AkunPage extends ConsumerWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 174.h,
                child: Image.asset(
                  "assets/bg_home.png",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpace(40.h),
                        Text(
                          "Akun Saya",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(50.h),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: primaryColor, width: 1),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  iconSize: 21.sp,
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    color: primaryColor,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 0,
                                child: Container(
                                  width: 10.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ref.watch(userDataProvider).when(
                                          data: (data) =>
                                              data?.verification == false
                                                  ? Colors.red
                                                  : Colors.transparent,
                                          error: (error, stackTrace) =>
                                              Colors.transparent,
                                          loading: () => Colors.transparent,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(10.h),
                        Text(
                          ref.watch(userDataProvider).when(
                              data: (data) =>
                                  data!.name.toUpperCase().toString(),
                              error: (error, stackTrace) => error.toString(),
                              loading: () => "Loading...."),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        verticalSpace(5.h),
                        Text(
                          ref.watch(userDataProvider).when(
                              data: (data) =>
                                  "${data!.phone.substring(0, 4)}****${data.phone.substring(7, 11)}",
                              error: (error, stackTrace) => error.toString(),
                              loading: () => "Loading...."),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        verticalSpace(5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shield_moon_outlined,
                              size: 10.w,
                              color: ref.watch(userDataProvider).when(
                                    data: (data) => data?.verification == true
                                        ? Colors.green
                                        : Colors.red,
                                    error: (error, stackTrace) =>
                                        Colors.transparent,
                                    loading: () => Colors.transparent,
                                  ),
                            ),
                            Text(
                              "Belum Terverifikasi",
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: ref.watch(userDataProvider).when(
                                      data: (data) => data?.verification == true
                                          ? Colors.green
                                          : Colors.red,
                                      error: (error, stackTrace) =>
                                          Colors.transparent,
                                      loading: () => Colors.transparent,
                                    ),
                              ),
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
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
                                  error: (error, stackTrace) =>
                                      error.toString(),
                                  loading: () => "Loading..."),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 10,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 70.h,
                left: MediaQuery.of(context).size.width / 2 - 35.w,
                child: Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10.r,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 70.w,
                      height: 70.h,
                      child: Image.asset(
                        "assets/user_pic.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "PENGATURAN APLIKASI",
                  style: TextStyle(
                    fontSize: 6.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
              verticalSpace(5.h),
              ListTileWidget(
                title: "Ubah PIN",
                icon: Icons.lock_person_outlined,
                onTap: () {},
              ),
              ListTileWidget(
                title: "Pilih Bahasa",
                icon: Icons.g_translate_outlined,
                onTap: () {},
              ),
              ListTileWidget(
                title: "Kode Referal",
                icon: Icons.handshake_outlined,
                onTap: () {},
              ),
              ListTileWidget(
                title: "Bagi Rating",
                icon: Icons.reviews_outlined,
                onTap: () {},
              ),
              verticalSpace(15.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "PENGATURAN APLIKASI",
                  style: TextStyle(
                    fontSize: 6.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
              verticalSpace(5.h),
              ListTileWidget(
                title: "Tutorial",
                icon: Icons.tips_and_updates_outlined,
                onTap: () {},
              ),
              ListTileWidget(
                title: "Pusat Bantuan",
                icon: Icons.support_agent_sharp,
                onTap: () {},
              ),
              ListTileWidget(
                title: "Syarat dan Ketentuan",
                icon: Icons.document_scanner_outlined,
                onTap: () {},
              ),
              ListTileWidget(
                title: "Kebijakan Privasi",
                icon: Icons.privacy_tip_outlined,
                onTap: () {},
              ),
              verticalSpace(40.h),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    side: BorderSide(
                      color: Colors.red.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () {
                    ref.read(userDataProvider.notifier).logout();
                  },
                  child: Text(
                    "Keluar",
                    style: TextStyle(
                      color: Colors.red.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              verticalSpace(40.h),
            ],
          )
        ],
      ),
    );
  }
}
