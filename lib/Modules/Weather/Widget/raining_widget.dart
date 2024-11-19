import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:templete/Utilities/strings.dart';
import 'package:templete/Utilities/text_style_helper.dart';
import 'package:templete/core/Language/locales.dart';
import 'package:templete/main.dart';

import '../../../Models/city_model.dart';
import '../../../Models/weather_model.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Widgets/custom_network_image.dart';
import '../../../generated/assets.dart';
import 'content_data_widget.dart';

class RainingWidget extends StatelessWidget {
  final WeatherModel? specificWeatherDate;
  final CityModel? city;
  const RainingWidget({super.key, this.specificWeatherDate, this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 24.w),
      color: ThemeClass.of(context).rainingColor,
      width: 375.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40.h),
            Text(
              Strings.its.tr,
              style: TextStyleHelper.of(context).s16RegTextStyle,
            ),
          Text(
            specificWeatherDate?.weather.firstOrNull?.description??'',
            style: TextStyleHelper.of(context).s16RegTextStyle,
          ),
            Text(
              Strings.now.tr,
              style: TextStyleHelper.of(context).s16RegTextStyle,
            ),
            Gap(38.h),
            Center(
              child: CustomNetworkImage(
                url:specificWeatherDate?.weather.firstOrNull?.image,
                width: 300.r,
                height: 300.r,
              ),
            ),
            const Spacer(),
            Text(
              city?.name??'',
              style: TextStyleHelper.of(context).s18RegTextStyle,
            ),
            Gap(24.h),
            const Spacer(),
            Text(
              city?.name??'',
              style: TextStyleHelper.of(context).s18RegTextStyle,
            ),
            Gap(24.h),
            SizedBox(
              height: 68.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Text(
                    "${specificWeatherDate?.main?.tempe}°",
                    style:TextStyleHelper.of(context)
                        .s45RegTextStyle,
                  ),
                  Gap(38.w),
                  ContentDataWidget(
                    title: Strings.wind.tr,
                    data:"${specificWeatherDate?.wind?.speed??0.0}/ h" ,
                  ),
                  ContentDataWidget(
                    title: Strings.windDirection.tr,
                    data:specificWeatherDate?.wind?.windDirection ,
                  ),
                  ContentDataWidget(
                    title: Strings.humidity.tr,
                    data: "${specificWeatherDate?.main?.humidity??0.0}%" ,
                  ),

                ],
              ),
            ),

            Gap(32.h),
          ],
        ),
      ),
    );
  }
}
