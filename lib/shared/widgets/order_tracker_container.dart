import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking/model/order.dart';
import 'package:order_tracking/model/order_status.dart';
import 'package:order_tracking/shared/utils/styles/app_styles.dart';
import 'package:order_tracking/shared/utils/theme/app_colors.dart';
import 'package:order_tracking/shared/widgets/app_spacing.dart';
import 'package:order_tracking/view/order_status_view.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/status_viewmodel.dart';

class OrderTrackerContainer extends StatefulWidget {
  const OrderTrackerContainer({
    super.key,
  });

  @override
  State<OrderTrackerContainer> createState() => _OrderTrackerContainerState();
}

class _OrderTrackerContainerState extends State<OrderTrackerContainer> {
  @override
  void initState() {
    super.initState();
    Provider.of<StatusViewModel>(context, listen: false).setOrderStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(
            0xff301934,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Consumer<StatusViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ongoing Order",
                      style: AppStyle.normalTextRegular(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      Order.order.orderId,
                      style: AppStyle.smallTextRegular(
                          color: AppColors.greyScale2),
                    )
                  ],
                ),
                const YMargin(20),
                Row(
                    children: OrderStatus.statusHistory
                        .asMap()
                        .map((int i, OrderStatus element) => MapEntry(
                            i,
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.w),
                                height: 5.h,
                                decoration: BoxDecoration(
                                    color:
                                        viewModel.status.data?.toLowerCase() ==
                                                element.orderStatus.name
                                                    .toLowerCase()
                                            ? Colors.green
                                            : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            )))
                        .values
                        .toList()),
                const YMargin(20),
                GestureDetector(
                  onTap: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return const OrderStatusView();
                  })),
                  child: Text(
                    "Track your order",
                    style: AppStyle.mediumTextMedium(color: Colors.white),
                  ),
                )
              ],
            );
          },
        ));
  }
}
