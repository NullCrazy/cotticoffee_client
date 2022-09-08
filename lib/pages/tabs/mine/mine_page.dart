import 'package:flutter/material.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/31 1:44 下午
class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print('_MinePageState');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('我的'),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('_MinePageState dispose');
  }

  @override
  bool get wantKeepAlive => true;
}
