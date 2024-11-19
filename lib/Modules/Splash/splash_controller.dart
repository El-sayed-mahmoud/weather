import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:templete/Modules/Splash/splash_data_handler.dart';
import '../../Utilities/shared_preferences.dart';
import '../AppearanceLayoutScreens/appearance_screen.dart';
import '../Home/home_screen.dart';

class SplashController extends StateXController {
  // singleton
  factory SplashController() => _this ??= SplashController._();
  static SplashController? _this;
  SplashController._();



  Future init(BuildContext context)async{
    // await SplashDataHandler.getCurrentUser();
    await Future.delayed(const Duration(seconds: 2));
    if(context.mounted) {
      GoRouter.of(context).goNamed(HomeScreen.routeName);

      if(SharedPref.isLogin()){
        // GoRouter.of(context).goNamed(HomeScreen.routeName);
      }else{
        // GoRouter.of(context).go(LoginScreen.routeName);
      }
    }
  }
}
