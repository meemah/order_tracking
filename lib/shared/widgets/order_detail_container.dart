import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles/app_styles.dart';
import '../utils/theme/app_colors.dart';
import 'app_spacing.dart';

class OrderDetailContainer extends StatelessWidget {
  final String? icon;
  final String title;
  final String subTitle;
  const OrderDetailContainer({
    super.key,
    this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  icon!,
                  width: 30.w,
                  height: 30.h,
                ),
              )
            : Container(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.smallTextRegular(
                  color: AppColors.greyScale5, fontWeight: FontWeight.w600),
            ),
            const YMargin(3),
            Text(
              subTitle,
              style: AppStyle.normalTextRegular(fontWeight: FontWeight.w500),
            )
          ],
        )
      ],
    );
  }
}
