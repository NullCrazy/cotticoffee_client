import 'package:abitelogin/abitelogin.dart';
import 'package:cotticoffee_client/network/cotti_net_work.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:flutter/material.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/31 1:44 下午
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      showAppBar: false,
      child: InkWell(
        onTap: () async {
          Image image = Image.network('https://cdn-product-prod.yummy.tech/wechat/cotti/images/cotti_open_1.jpg');
          image.image.resolve(const ImageConfiguration()).addListener(ImageStreamListener(
            (ImageInfo info, bool _) {
              print(info.image.toString());
            },
          ));
        },
        child: Container(
          alignment: Alignment.center,
          child: Text('test'),
        ),
      ),
    );
  }
}
