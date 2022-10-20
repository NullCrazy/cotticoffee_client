import 'package:cotticoffee_client/global/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/20 6:16 PM
class OrderInfoItem extends StatelessWidget {
  String title;
  String? subTitle;
  double? subTitleFontSize;
  String? rightIcon;
  Function? clickRight;

  OrderInfoItem(
    this.title,
    this.subTitle, {
    Key? key,
    this.subTitleFontSize,
    this.rightIcon,
    this.clickRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildItem();
  }

  _buildItem() {
    return Container(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textGray,
              fontSize: 13.sp,
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 219.w,
            ),
            child: GestureDetector(
              onTap: () {
                if (clickRight != null) {
                  clickRight!();
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      subTitle ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: textBlack,
                        fontSize: subTitleFontSize ?? 14.sp,
                        fontFamily: 'DDP4',
                      ),
                      strutStyle: StrutStyle(
                        forceStrutHeight: true,
                        fontSize: subTitleFontSize ?? 14.sp,
                      ),
                    ),
                  ),
                  if (rightIcon != null)
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: SvgPicture.asset(rightIcon!, width: 10.w),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
