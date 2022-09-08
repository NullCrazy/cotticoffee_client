import 'package:cotticoffee_client/pages/tabs/tab_page.dart';
import 'package:flutter/material.dart';

import '../privacy/privacy_mixin.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/30 5:36 下午
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with PrivacyMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      checkPrivacyAgreement(context, (result) async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TabPage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
