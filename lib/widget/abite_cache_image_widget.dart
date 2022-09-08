import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// FileName: ABiteImageWidget
///
/// Description: 图片组件，支持默认占位，圆角，不同质量的压缩
/// Author: yapeng.zhu@abite.com
/// Date: 2021/12/4
class ABiteCacheImageWidget extends StatelessWidget {
  ///网络图片地址，必传参数
  final String url;

  ///图片的宽度
  final double? imgW;

  ///图片的高度
  final double? imgH;

  ///占位图本地路径
  final String? defImagePath;

  ///图片显示模式
  final BoxFit? fit;

  ///调整图片大小
  final String? resize;

  ///调整图片质量
  final String? quality;

  ///图片格式
  final String? format;

  ///图片的圆角
  final BorderRadius? borderRadius;

  ///默认展位图路径
  final String defImgPath = "assets/images/ic_default.svg";

  ///默认的图片显示模式
  final BoxFit defaultFit = BoxFit.none;

  ///默认圆角
  final BorderRadius defaultRadius = const BorderRadius.all(Radius.circular(0));

  ///是否需要压缩图片
  final bool isCompress;

  ///只进行质量压缩,默认不开启
  final bool onlyQuality;

  final Duration fadeInDuration;

  final Duration fadeOutDuration;

  const ABiteCacheImageWidget({
    Key? key,
    required this.url,
    this.imgW,
    this.imgH,
    this.defImagePath,
    this.fit,
    this.borderRadius,
    this.resize = "w_500", //默认宽度
    this.quality = "q_50", //默认压缩50%
    this.format = "webp", //默认图片格式为webp
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeOutDuration = const Duration(milliseconds: 1000),
    this.isCompress = true,
    this.onlyQuality = false,
  }) : super(key: key);

  ///占位图组件
  ///
  /// [context] 由CachedNetworkImage组件提供
  /// [url] 由CachedNetworkImage组件提供
  Widget _placeHolderWidget(BuildContext context, String url) {
    return ClipRRect(
      borderRadius: borderRadius ?? defaultRadius,
      child: (defImagePath == null)
          ? SvgPicture.asset(
              defImgPath,
              height: (imgH != null) ? (imgH! * 0.4) : 40.h,
              width: (imgH != null) ? (imgH! * 0.4) : 40.h,
            )
          : (defImagePath!.endsWith(".svg"))
              ? SvgPicture.asset(
                  defImagePath!,
                  height: (imgH != null) ? (imgH! * 0.4) : 40.h,
                  width: (imgH != null) ? (imgH! * 0.4) : 40.h,
                )
              : Image.asset(
                  defImagePath!,
                  height: (imgH != null) ? (imgH! * 0.4) : 40.h,
                  width: (imgH != null) ? (imgH! * 0.4) : 40.h,
                  fit: fit,
                ),
    );
  }

  ///图片加载错误组件，显示默认占位
  ///
  /// [context] 由CachedNetworkImage组件提供
  /// [url] 由CachedNetworkImage组件提供
  Widget _errorWidget(BuildContext context, String url, error) {
    return _placeHolderWidget(context, url);
  }

  ///处理图片质量，大小，格式
  ///
  /// [url] 图片地址
  String _compress(String url) {
    if (!isCompress) {
      return url;
    } else if (onlyQuality) {
      return "$url?x-image-process=image/quality,$quality/format,$format";
    }
    return "$url?x-image-process=image/resize,$resize,limit_0/quality,$quality/format,$format";
  }

  Widget _bg(BuildContext context, String url) {
    return Container(
      height: imgH,
      width: imgW,
      decoration: BoxDecoration(
        color: const Color(0xF0F0F0F0),
        borderRadius: borderRadius ?? defaultRadius,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isGif = url.endsWith(".gif");
    return ClipRRect(
      borderRadius: borderRadius ?? defaultRadius,
      child: isGif
          ? Image.network(
              url,
              height: imgH,
              width: imgW,
              fit: fit ?? defaultFit,
            )
          : CachedNetworkImage(
              imageUrl: _compress(url),
              height: imgH,
              width: imgW,
              fit: fit ?? defaultFit,
              fadeInDuration: fadeInDuration,
              fadeOutDuration: fadeOutDuration,
              placeholder: _bg,
              errorWidget: _errorWidget,
            ),
    );
  }
}
