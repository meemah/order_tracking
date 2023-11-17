import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInButton extends StatelessWidget {
  final Function() onTap;
  final String imageUrl;
  final Color color;
  final bool isLoading;
  const SignInButton(
      {super.key,
      required this.imageUrl,
      required this.onTap,
      this.isLoading = false,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        color: color,
        height: 45.h,
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 14.h,
                  width: 14.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  ),
                ),
              )
            : Image.asset(imageUrl),
      ),
    );
  }
}
