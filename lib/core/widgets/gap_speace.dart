import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GapSpeace extends StatelessWidget {
  const GapSpeace({super.key, this.h, this.w});
  final double? h;
  final double? w;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h?.h ?? 10,
      width: w?.w ?? 10,
    );
  }
}
