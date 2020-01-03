import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutu/ui/utils/app_images.dart';

class CustomImage extends StatelessWidget {

  final String url;

  CustomImage({this.url});

  @override
  Widget build(BuildContext context) {
    if(url != null) {
      return FittedBox(
        child: CachedNetworkImage(
          imageUrl: url,
          errorWidget: (context, url, error) {
            return Container();
          },
        ),
      );
    }
    return FittedBox(
      child: AppImages.defaultImage,
    );
  }
}