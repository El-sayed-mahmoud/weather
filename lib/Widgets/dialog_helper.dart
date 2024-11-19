import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class DialogHelper {
  DialogHelper(
      {String? title, required context, Widget? child, double? height, double? width}) {
    showGeneralDialog(
      useRootNavigator: true,
      context: context,
      barrierLabel: "Label",
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Dialog(
          child: SizedBox(
            width: width??100.w,
            height: height??100.h,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32.h,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close,
                          size: 24.r,
                          color: ThemeClass.of(context).sunnyDayColor,
                        ),
                      ),
                      SizedBox(width: 24.h,),
                      Text(
                        title??"",
                        style: TextStyleHelper.of(context).s24RegTextStyle.copyWith(color: ThemeClass.of(context).primaryColor),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: ThemeClass.of(context).primaryColor,
                  ),
                  SizedBox(height: 16.h,),
                  //*   Content
                  child?? const SizedBox.shrink()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

