import 'package:daur_minyak/presentation/misc/constants.dart';
import 'package:daur_minyak/presentation/misc/methods.dart';
import 'package:daur_minyak/presentation/pages/daur_minyak/models/daur_waktu_model.dart';
import 'package:daur_minyak/presentation/providers/router/router_provider.dart';
import 'package:daur_minyak/presentation/widgets/appbar_daur_minyak.dart';
import 'package:daur_minyak/presentation/widgets/button_full_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaktuDaurMinyakPage extends ConsumerStatefulWidget {
  const WaktuDaurMinyakPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WaktuDaurMinyakPageState();
}

class _WaktuDaurMinyakPageState extends ConsumerState<WaktuDaurMinyakPage> {
  List<DaurWaktuModel> waktus = [
    DaurWaktuModel(title: "08:00 - 09:00", id: 1),
    DaurWaktuModel(title: "09:00 - 10:00", id: 2),
    DaurWaktuModel(title: "10:00 - 11:00", id: 3),
    DaurWaktuModel(title: "11:00 - 12:00", id: 4),
    DaurWaktuModel(title: "12:00 - 13:00", id: 5),
    DaurWaktuModel(title: "13:00 - 14:00", id: 6),
    DaurWaktuModel(title: "14:00 - 15:00", id: 7),
    DaurWaktuModel(title: "15:00 - 16:00", id: 8),
    DaurWaktuModel(title: "16:00 - 18:00", id: 9),
    DaurWaktuModel(title: "19:00 - 21:00", id: 10),
  ];

  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarDaurMinyak(title: "Waktu penjemputan"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(40.h),
              Text(
                "Pilih Waktu Pengambilan",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              verticalSpace(8.h),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: primaryColor,
                              size: 20.sp,
                            ),
                            horizontalSpace(8.w),
                            Expanded(
                              child: Text(
                                "Sesuaikan waktumu",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: waktus.map((e) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 0.7,
                                      child: Radio(
                                        value: e.id,
                                        groupValue: groupValue,
                                        onChanged: (value) {
                                          setState(() {
                                            groupValue = value as int;
                                          });
                                        },
                                      ),
                                    ),
                                    horizontalSpace(8.w),
                                    Text(
                                      e.title,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                              ],
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(40.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonFullWidget(
                    text: "Cari Duitin Picker",
                    onPressed: () {
                      ref.read(routerProvider).push("/waiting_daur_minyak");
                    },
                  ),
                ],
              ),
              verticalSpace(40.h),
            ],
          ),
        ),
      ),
    );
  }
}
