import 'package:daur_minyak/presentation/misc/constants.dart';
import 'package:daur_minyak/presentation/misc/methods.dart';
import 'package:daur_minyak/presentation/pages/daur_minyak/models/daur_alamat_model.dart';
import 'package:daur_minyak/presentation/providers/router/router_provider.dart';
import 'package:daur_minyak/presentation/widgets/appbar_daur_minyak.dart';
import 'package:daur_minyak/presentation/widgets/button_full_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlamatDaurMinyakPage extends ConsumerStatefulWidget {
  const AlamatDaurMinyakPage({super.key});

  @override
  ConsumerState<AlamatDaurMinyakPage> createState() =>
      _AlamatDaurMinyakPageState();
}

class _AlamatDaurMinyakPageState extends ConsumerState<AlamatDaurMinyakPage> {
  List<DaurAlamatModel> items = [
    DaurAlamatModel(
      jalan: "Jl. Manunggal Perumahan Cahaya Mata Bumi Blok G 14",
      kecamatan: "Tampan",
      kota: "Pekanbaru",
      provinsi: "Riau",
      kodePos: "13410",
      tipe: "Rumah",
      noHp: "081234567890",
      isSelected: 1,
    ),
    DaurAlamatModel(
      jalan: "Jalan Raya Cipinang Besar Selatan",
      kecamatan: "Jatinegara",
      kota: "Jakarta Timur",
      provinsi: "DKI Jakarta",
      kodePos: "13410",
      tipe: "Kantor",
      noHp: "081234567890",
      isSelected: 2,
    ),
  ];

  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarDaurMinyak(title: "Alamat Penjemputan"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pilih Alamat Pengambilan",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Tambah Alamat",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(12.h),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_outlined),
                  hintText: "Cari Alamat",
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintStyle: TextStyle(fontSize: 10.sp),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              verticalSpace(15.h),
              Column(
                children: items
                    .map(
                      (e) => Card(
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: e.isSelected == true
                                  ? primaryColor
                                  : greyColor,
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: e.isSelected,
                                        groupValue: selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value as int;
                                          });
                                        },
                                      ),
                                      Text(
                                        e.tipe,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.w),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.pin_drop_outlined,
                                          size: 10.sp,
                                          color: primaryColor,
                                        ),
                                        Text(
                                          "Sudah pinpoint",
                                          style: TextStyle(fontSize: 6.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Muhammad Rakha",
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        color: greyColor,
                                      ),
                                    ),
                                    verticalSpace(4.h),
                                    SizedBox(
                                      width: 200.w,
                                      child: Text(
                                        e.jalan,
                                        style: TextStyle(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500,
                                          color: greyColor,
                                        ),
                                      ),
                                    ),
                                    verticalSpace(4.h),
                                    Text(
                                      "${e.kecamatan}, ${e.kota}, \n${e.provinsi} ${e.kodePos}",
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        color: greyColor,
                                      ),
                                    ),
                                    verticalSpace(4.h),
                                    Text(
                                      e.noHp,
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        color: greyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpace(4.h),
                              Container(
                                height: 30.h,
                                width: 80.w,
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                                padding: EdgeInsets.zero,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit_outlined,
                                        size: 10.sp,
                                      ),
                                      horizontalSpace(5.w),
                                      Text(
                                        "Edit",
                                        style: TextStyle(fontSize: 8.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              verticalSpace(10.h),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              verticalSpace(40.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonFullWidget(
                    text: "Lanjut",
                    onPressed: () {
                      ref.read(routerProvider).push("/waktu_daur_minyak");
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
