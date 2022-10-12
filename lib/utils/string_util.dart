/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/11 2:27 PM
class StringUtil {
  static String mobilePhoneEncode(String? mobilePhone) {
    if (mobilePhone != null && mobilePhone.length >= 11) {
      return mobilePhone.replaceRange(4, 7, '****');
    }
    return mobilePhone ?? '';
  }
}
