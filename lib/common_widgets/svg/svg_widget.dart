import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgWidget(String path, {double? size, Color? color}) =>
    SvgPicture.asset(path, color: color, height: size, width: size);
