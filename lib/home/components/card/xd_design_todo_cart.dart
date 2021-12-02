import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_form/ui/shared/ui_helper.dart';

import '../../../constants/image_constants.dart';
import '../../../theme/app_color.dart';

class XdDesignTodoCard extends StatelessWidget {
  const XdDesignTodoCard({Key? key}) : super(key: key);

  final subtitle1 = 'Matt Giampietro';
  final subtitle2 = 'Friends';
  final subtitle3 = 'Matthew is an interior designer living in\n New York';
  final subtitle4 = '75 Friends';
  final subtitle5 = 'Joined in 2021';
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.h,
      margin: EdgeInsets.all(20.h),
      child: SizedBox(
        width: 250.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image.asset(ImageConstants.instance.matthew, fit: BoxFit.cover)),
            Padding(padding: EdgeInsets.fromLTRB(20.w, 8.h, 0, 5.h), child: cardBodyColumn),
            UIHelper.heightSpace23,
            cardDivider,
            UIHelper.heightSpace15,
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.w), child: cardBodyRow),
            UIHelper.heightSpace15,
          ],
        ),
      ),
    );
  }

  Column get cardBodyColumn => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText(subtitle1, Get.textTheme.subtitle1!),
          UIHelper.heightSpace5,
          Opacity(opacity: 0.4, child: buildText(subtitle2, Get.textTheme.subtitle2!)),
          UIHelper.heightSpace5,
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
        children: [
          iconWidget,
          UIHelper.widthSpace13,
          Opacity(opacity: 0.4, child: buildText(subtitle4, Get.textTheme.subtitle2!)),
          const Spacer(),
          Opacity(opacity: 0.4, child: buildText(subtitle5, Get.textTheme.subtitle2!)),
        ],
      );

  Opacity get iconWidget => Opacity(
        opacity: 0.4,
        child: SvgPicture.asset(
          ImageConstants.instance.user,
        ),
      );
}

///Before
/*  Text(
  subtitle,
  style: Get.textTheme.subtitle1!
      .copyWith(fontSize: 18.sp, color: AppColors.black, fontWeight: FontWeight.w700),
), */