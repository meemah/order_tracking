import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInButton extends StatelessWidget {
  final Function() onTap;
  final String imageUrl;
  final Color color;
  const SignInButton(
      {super.key,
      required this.imageUrl,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        color: color,
        height: 45.h,
        child: Image.asset(imageUrl),
      ),
    );
  }
}
