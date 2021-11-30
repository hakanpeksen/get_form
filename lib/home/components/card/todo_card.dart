import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.h,
      margin: EdgeInsets.all(20.h),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Column(
          children: [
            Expanded(flex: 7, child: Image.network("https://picsum.photos/200")),
            Text(
              "terms and conditions",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Text' * 3,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.subtitle1!.copyWith(decoration: TextDecoration.underline),
            ),
            const Expanded(child: Icon(Icons.check)),
            const Expanded(child: Text("Subtitle")),
          ],
        ),
      ),
    );
  }
}
