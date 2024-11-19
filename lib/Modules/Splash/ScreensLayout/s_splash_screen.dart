import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../Utilities/theme_helper.dart';
import '../splash_controller.dart';

class SmallSplashScreen extends StatefulWidget {
  const SmallSplashScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SmallSplashScreenState();
}

class _SmallSplashScreenState extends State<SmallSplashScreen> {
  final SplashController con = SplashController();


  @override
  void initState() {
    con.dependOnInheritedWidget(context);
    con.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:  ThemeClass.of(context).primaryColor,

              ),
            );
          },
        ),
      ),
    );
  }
}
