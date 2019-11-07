import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutu/ui/utils/app_colors.dart';

class AppImages {

    static SvgPicture defaultImage = SvgPicture.asset(
      "assets/images/default.svg",
      fit: BoxFit.fill,
      color: AppColors.primary,
    );

}