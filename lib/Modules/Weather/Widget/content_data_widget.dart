import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';

class ContentDataWidget extends StatelessWidget {
  final String? title,data;
  const ContentDataWidget({super.key, this.title, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
          color: ThemeClass.of(context).mainTextColor,
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title??'',
            style: TextStyleHelper.of(context)
                .s14RegTextStyle
                .copyWith(
                color: ThemeClass.of(context)
                    .backGroundColor),
          ),
          Text(
            data??'',
            style: TextStyleHelper.of(context)
                .s14RegTextStyle
                .copyWith(
                color: ThemeClass.of(context)
                    .lightGreyColor),
          ),
        ],
      ),
    );
  }
}