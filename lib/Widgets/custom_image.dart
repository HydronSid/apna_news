import 'package:apna_news/Utils/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double imgHeight, imgWidth;
  final BoxFit? boxFit;
  final double? borderRadius;
  const CustomImage(
      {super.key,
      required this.image,
      required this.imgHeight,
      required this.imgWidth,
      this.borderRadius,
      this.boxFit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit ?? BoxFit.fill,
      height: imgHeight,
      imageUrl: image,
      progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
        width: imgWidth,
        height: imgHeight,
        child: Shimmer.fromColors(
          baseColor: Colors.black12,
          highlightColor: Colors.white,
          enabled: true,
          child: Container(
            width: imgWidth,
            height: imgHeight,
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(borderRadius ?? 0.0)),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        Images.noImageError,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
