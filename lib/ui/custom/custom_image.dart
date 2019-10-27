import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutu/ui/custom/app_images.dart';

class CustomImage extends StatelessWidget {

  final String url;

  CustomImage({this.url});

  @override
  Widget build(BuildContext context) {
    if(url != null) {
      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, string) {
          return Center(
              child: CircularProgressIndicator());
        },
      );
    }
    return AppImages.defaultImage;
  }
}