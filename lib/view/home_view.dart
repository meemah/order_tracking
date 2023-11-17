import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking/model/order.dart';
import 'package:order_tracking/shared/utils/styles/app_styles.dart';
import 'package:order_tracking/shared/utils/theme/app_colors.dart';
import 'package:order_tracking/shared/widgets/app_spacing.dart';
import 'package:order_tracking/shared/widgets/order_detail_container.dart';

import '../shared/widgets/order_tracker_container.dart';

class HomeView extends StatelessWidget {
  final UserCredential userCredential;
  const HomeView({super.key, required this.userCredential});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(userCredential.user?.photoURL ?? ""),
                  ),
                  const XMargin(10),
                  Text(
                    "Welcome,\n${userCredential.user?.displayName}",
                    style:
                        AppStyle.mediumTextMedium(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const YMargin(20),
              const OrderTrackerContainer(),
              const YMargin(35),
              Text(
                "Order Detail",
                style: AppStyle.mediumTextMedium(color: AppColors.greyScale5),
              ),
              const YMargin(20),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: OrderDetailContainer(
                            title: "Order ID",
                            subTitle: Order.order.orderId,
                          ),
                        ),
                        OrderDetailContainer(
                          title: "Order Date",
                          subTitle: Order.order.formattedDate,
                        ),
                      ],
                    ),
                    const YMargin(25),
                    OrderDetailContainer(
                        title: "Order Type", subTitle: Order.order.orderType),
                  ],
                ),
              ),
              const YMargin(20),
              Text(
                "Order Items",
                style: AppStyle.mediumTextMedium(color: AppColors.greyScale5),
              ),
              const YMargin(20),
              ListView.separated(
                shrinkWrap: true,
                itemCount: OrderItem.orders.length,
                itemBuilder: (context, index) {
                  OrderItem order = OrderItem.orders[index];
                  return Row(
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  order.imageUrl,
                                ))),
                      ),
                      const XMargin(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.title,
                              style: AppStyle.mediumTextMedium(),
                            ),
                            const XMargin(4),
                            Text(
                              "N${order.amount}",
                              style: AppStyle.normalTextRegular(
                                  color: AppColors.greyScale5),
                            )
                          ],
                        ),
                      ),
                      const XMargin(5),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const YMargin(20);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
