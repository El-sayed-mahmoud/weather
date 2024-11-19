import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:templete/Modules/Splash/splash_controller.dart';
import 'package:templete/Utilities/text_style_helper.dart';
import 'package:templete/Utilities/theme_helper.dart';
import 'package:templete/Widgets/loading_screen.dart';
import 'package:templete/main.dart';

import '../../Utilities/format_date_helper.dart';
import '../Weather/weather_screen.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const routeName="Home";
  const HomeScreen({super.key});

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends StateX<HomeScreen> {
  _HomeScreenState() : super(controller: HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeClass.of(context).backGroundColor,
      ),
      body: LoadingScreen(
          child: Center(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:con.dates.map((e){
            return InkWell(
              onTap: (){
                context.pushNamed(WeatherScreen.routeName,extra:e );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(width: 1.r,color: ThemeClass.of(context).primaryColor)
                ),
                child: Text(FormatDateHelper.formatDayAndDate.format(e),style: TextStyleHelper.of(context).s14SemiBoldTextStyle,),
              ),
            );
                    }).toList(),
                  ),
          )),
    );
  }
}
