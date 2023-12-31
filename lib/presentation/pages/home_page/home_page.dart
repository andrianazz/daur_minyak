import 'package:daur_minyak/presentation/extensions/build_context_extensions.dart';
import 'package:daur_minyak/presentation/misc/constants.dart';
import 'package:daur_minyak/presentation/pages/daur_minyak/daur_minyak_page.dart';
import 'package:daur_minyak/presentation/pages/home_page/akun_page/akun_page.dart';
import 'package:daur_minyak/presentation/pages/home_page/beranda_page.dart/beranda_page.dart';
import 'package:daur_minyak/presentation/pages/home_page/pesan_masuk_page/pesan_masuk_page.dart';
import 'package:daur_minyak/presentation/pages/home_page/pesanan_page/pesanan_page.dart';
import 'package:daur_minyak/presentation/providers/router/router_provider.dart';
import 'package:daur_minyak/presentation/providers/user_data/user_data_provider.dart';
import 'package:daur_minyak/presentation/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed("login");
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    });

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
            _pageController.jumpToPage(value);
          });
        },
        children: const [
          BerandaPage(),
          PesananPage(),
          SizedBox(),
          PesanMasukPage(),
          AkunPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        onPressed: () {
          // bool notVerified =
          //     ref.read(userDataProvider).asData!.value!.verification == false;
          // if (notVerified) {
          //   showDialog(
          //     context: context,
          //     builder: (context) => DialogWidget(
          //       text:
          //           "Akun belum terverifikasi,\nsilahkan lengkapi data diri anda",
          //       textButton1: "Lengkapi Data Diri",
          //       onPressedButton1: () {},
          //     ),
          //   );
          // }

          ref.read(routerProvider).pushNamed("daur_minyak");
        },
        child: Image.asset(
          "assets/icon_process.png",
          width: 30.w,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10.sp,
        unselectedFontSize: 10.sp,
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 2) {
            return;
          }

          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_rounded),
            label: "Pesanan",
          ),
          BottomNavigationBarItem(
            icon:
                Visibility(visible: false, child: Icon(Icons.history_rounded)),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: "Pesan Masuk",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Akun",
          ),
        ],
      ),
    );
  }
}
