import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vinamilk_b2b/vnm/material/widgets/loading.dart';

import '../../core/exception/index.dart';
import '../../core/global/logger.dart';
import '../../extension/widget.dart';
import '../styles/color.dart';

class VNMImage extends StatelessWidget {
  final String path;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final double? radius;
  final String? errorImage;
  final bool? hideError;
  final bool? hidePlaceHolder;
  final Color? backgroundColor;
  final Color? color;

  const VNMImage(this.path,
      {super.key,
      this.fit,
      this.height,
      this.width,
      this.radius,
      this.errorImage,
      this.hideError,
      this.backgroundColor,
      this.color,
      this.hidePlaceHolder});

  bool get _fromNetwork => !path.startsWith("assets/");

  bool get _isSVG => path.endsWith(".svg");

  BoxFit get _fit => fit ?? BoxFit.contain;

  ColorFilter? get _color =>
      color == null ? null : ColorFilter.mode(color!, BlendMode.srcATop);

  @override
  Widget build(BuildContext context) {
    var image = _buildImage(context);
    return _borderedImage(image);
  }

  Widget _borderedImage(Widget image) {
    return ClipRRect(
      child: Container(
        color: backgroundColor,
        child: image,
      ),
      borderRadius: BorderRadius.circular(radius ?? 0),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (_isSVG) {
      if (_fromNetwork) {
        return _svgNetwork();
      } else {
        return _svgAsset();
      }
    } else {
      if (_fromNetwork) {
        return _imageNetwork(context);
      } else {
        return _imageAsset();
      }
    }
  }

  Widget _svgNetwork() {
    return SvgPicture.network(
      path,
      fit: _fit,
      height: height,
      width: width,
      colorFilter: _color,
    );
  }

  Widget _svgAsset() {
    return SvgPicture.asset(
      path,
      fit: _fit,
      height: height,
      width: width,
      colorFilter: _color,
    );
  }

  Widget _imageNetwork(BuildContext context) {
    return path.isEmpty
        ? _imageNetworkError(context, path, EmptyImageException())
        : CachedNetworkImage(
            imageUrl: path,
            fit: _fit,
            placeholder: _imageNetworkPlaceHolder,
            errorWidget: _imageNetworkError,
            filterQuality: FilterQuality.medium,
            height: height,
            width: width);
  }

  Widget _imageAsset() {
    return Image.asset(
      path,
      fit: _fit,
      height: height,
      width: width,
      color: color,
    );
  }

  Widget _imageNetworkPlaceHolder(BuildContext context, String url) {
    return Opacity(
      opacity: hidePlaceHolder == true ? 0 : 1,
      child: LayoutBuilder(builder: (context, layout) {
        double size = max(layout.maxHeight, layout.maxWidth);
        if (size > 200)
          return Container(
            alignment: Alignment.center,
            width: width,
            height: height,
            child: LoadingView(),
          );
        return SizedBox(height: layout.maxHeight, width: layout.maxWidth)
            .withShimmer();
      }),
    );
  }

  Widget _imageNetworkError(BuildContext context, String url, error) {
    if (!(error is EmptyImageException)) VNMLogger().error(error);
    Widget image = SizedBox();
    if (errorImage != null)
      image = errorImage!.endsWith("svg")
          ? SvgPicture.asset(
              errorImage!,
              fit: _fit,
              height: height,
              width: width,
            )
          : Image.asset(
              errorImage!,
              fit: _fit,
              height: height,
              width: width,
            );
    else
      image = LayoutBuilder(builder: (context, layout) {
        var iconSize = min(layout.maxHeight, layout.maxWidth);
        if (iconSize * 0.5 > 100) {
          iconSize = 100;
        } else if (iconSize * 0.5 < 20 && iconSize > 20) {
          iconSize = 20;
        } else {
          iconSize *= 0.5;
        }
        return Container(
          height: layout.maxHeight,
          width: layout.maxWidth,
          alignment: Alignment.center,
          child: Icon(
            Icons.image_not_supported_outlined,
            size: iconSize,
            color: VNMColor.hint(),
          ),
        );
      });

    return Opacity(opacity: hideError == true ? 0 : 1, child: image);
  }
}
