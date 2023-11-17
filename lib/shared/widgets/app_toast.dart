import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:order_tracking/main.dart';
import 'package:order_tracking/shared/utils/styles/app_styles.dart';

class AppToast {
  static showFlashToast(String message, {bool isErrorToast = true}) {
    showFlash(
      duration: const Duration(seconds: 3),
      context: navigatorKey.currentContext!,
      builder: (context, controller) {
        return Flash(
          controller: controller,
          child: FlashBar(
            position: FlashPosition.top,
            backgroundColor: isErrorToast ? Colors.redAccent : Colors.green,
            icon: Icon(
              isErrorToast ? Icons.cancel : Icons.check,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(25),
            content: Text(
              message,
              style: AppStyle.normalTextRegular(color: Colors.white),
            ),
            controller: controller,
          ),
        );
      },
    );
  }
}
