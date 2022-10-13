import 'package:cotticoffee_client/global/icon_font.dart';
import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/network/cotti_net_work.dart';
import 'package:cotticoffee_client/pages/tabs/mine/setting/entity/shop_license_entity.dart';
import 'package:cotticoffee_client/routers/mine_router.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:cotticoffee_client/widget/custom_smart_footer.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/12 10:33 PM
class ShopLicensePage extends StatefulWidget {
  const ShopLicensePage({Key? key}) : super(key: key);

  @override
  State<ShopLicensePage> createState() => _ShopLicensePageState();
}

class _ShopLicensePageState extends State<ShopLicensePage> {
  final RefreshController _controller = RefreshController(initialRefresh: false);
  final List<ShopLicenseEntity> _list = [];
  LoadStatus status = LoadStatus.idle;
  num pageNo = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _onLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: '门店资质',
      child: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        controller: _controller,
        footer: const CustomSmartFooter(),
        onLoading: () => _onLoading(),
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h, bottom: 0),
          itemBuilder: (context, index) {
            ShopLicenseEntity shopLicense = _list[index];
            return InkWell(
              onTap: () => NavigatorUtils.push(
                context,
                MineRouter.shopLicenseDetailPage,
                arguments: shopLicense.images,
              ),
              child: Container(
                color: Colors.white,
                height: 55.h,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 12.w, right: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      shopLicense.shopName ?? '',
                      style: TextStyle(
                        color: textBlack,
                        fontSize: 14.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '查看',
                          style: TextStyle(
                            color: textGray,
                            fontSize: 14.sp,
                          ),
                        ),
                        Icon(
                          IconFont.icon_right,
                          size: 20.w,
                          color: textGray,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 0.5.h,
              color: dividerGray,
              margin: EdgeInsets.symmetric(horizontal: 18.w),
            );
          },
          itemCount: _list.length,
        ),
      ),
    );
  }

  _onLoading() async {
    List<ShopLicenseEntity>? list = await getShopLicence(pageNo + 1);
    if (list?.isNotEmpty ?? false) {
      pageNo++;
      _list.addAll(list!);
      _controller.loadComplete();
    } else if (list?.isEmpty ?? false) {
      _controller.loadNoData();
    } else {
      _controller.loadComplete();
    }
    setState(() {});
  }

  Future<List<ShopLicenseEntity>?> getShopLicence(num pageNo) async {
    try {
      return CottiNetWork().post('/shop/queryShopLicence', data: {
        'pageNo': pageNo,
        'pageSize': 20,
      }).then((value) => ShopLicenseList.fromJson(value).list ?? []);
    } catch (error) {
      return null;
    }
  }
}
