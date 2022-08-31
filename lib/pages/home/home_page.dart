import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:flutter/material.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/30 6:06 下午
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: 'home',
      child: Container(),
    );
  }
}
