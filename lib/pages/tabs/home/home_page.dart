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
         LoginUtils.login(context);
        },
        child: Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: Text('tb_A15#rowIdx_0#filed_A15021'.split("[#|]")[0]),
        ),
      ),
    );
  }
}
