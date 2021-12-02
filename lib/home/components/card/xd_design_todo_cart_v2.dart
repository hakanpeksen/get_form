import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/image_constants.dart';
import '../../../theme/app_color.dart';

class XdDesignTodoCardV2 extends StatelessWidget {
  const XdDesignTodoCardV2({Key? key}) : super(key: key);

  final subtitle1 = 'Elliot Fu';
  final subtitle2 = 'Friends of Veronika';
  final subtitle3 = 'Elliot requested permission to view your\n contact details';
  final approveBtn = 'Approve';
  final declineBtn = 'Decline';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.h,
      margin: EdgeInsets.all(20.h),
      child: SizedBox(
        width: 260.w,
        child: Stack(
          children: [
            Positioned(right: 14.w, top: 16.h, child: Image.asset(ImageConstants.instance.elliot)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(11.w, 16.h, 0, 5.h), child: cardBodyColumn),
                SizedBox(height: 18.h),
                cardDivider,
                SizedBox(height: 10.h),
                cardBodyRow,
                SizedBox(height: 10.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column get cardBodyColumn => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText(subtitle1, Get.textTheme.subtitle1!),
          SizedBox(height: 5.h),
          Opacity(opacity: 0.4, child: buildText(subtitle2, Get.textTheme.subtitle2!)),
          SizedBox(height: 5.h),
          Opacity(opacity: 0.8, child: buildText(subtitle3, Get.textTheme.subtitle2!)),
        ],
      );

  Text buildText(String labelText, TextStyle textStyle) {
    return Text(
      labelText,
      style: textStyle,
    );
  }

  Divider get cardDivider => const Divider(thickness: 1, color: AppColors.iron);

  Row get cardBodyRow => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButton(approveBtn, AppColors.mountainMeadow),
          buildButton(declineBtn, AppColors.alizarinCrimson),
        ],
      );

  OutlinedButton buildButton(String btnTitle, Color btnColor) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1.0, color: btnColor),
        minimumSize: const Size(133, 36),
      ),
      onPressed: () {},
      child: buildText(btnTitle, Get.textTheme.button!.copyWith(color: btnColor)),
    );
  }
}

///Before
/*  Text(
  subtitle,
  style: Get.textTheme.subtitle1!
      .copyWith(fontSize: 18.sp, color: AppColors.black, fontWeight: FontWeight.w700),
), */