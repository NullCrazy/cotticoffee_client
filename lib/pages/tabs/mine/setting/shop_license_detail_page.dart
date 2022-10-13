import 'package:cotticoffee_client/widget/cotti_image_widget.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/13 5:03 PM
class ShopLicenseDetailPage extends StatelessWidget {
  final List<String> images;

  const ShopLicenseDetailPage({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: '门店资质',
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        itemBuilder: (context, index) {
          return CottiImageWidget(
            url: images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 12.h);
        },
      ),
    );
  }
}
