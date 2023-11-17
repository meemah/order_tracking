import 'package:flutter/material.dart';
import 'package:order_tracking/model/order_status.dart';
import 'package:order_tracking/shared/widgets/app_spacing.dart';
import 'package:order_tracking/viewmodel/status_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../shared/utils/styles/app_styles.dart';
import '../shared/utils/theme/app_colors.dart';

class OrderStatusView extends StatefulWidget {
  const OrderStatusView({
    super.key,
  });

  @override
  State<OrderStatusView> createState() => _OrderStatusViewState();
}

class _OrderStatusViewState extends State<OrderStatusView> {
  @override
  void initState() {
    super.initState();
    Provider.of<StatusViewModel>(context, listen: false).setOrderStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Track Order",
                style: AppStyle.mediumTextMedium(color: AppColors.greyScale5),
              ),
              const YMargin(20),
              Consumer<StatusViewModel>(builder: (ctx, viewModel, _) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: OrderStatus.statusHistory.length,
                    itemBuilder: (ctx, index) {
                      OrderStatus orderStatus =
                          OrderStatus.statusHistory[index];
                      bool isSelected =
                          orderStatus.orderStatus.name == viewModel.status.data;
                      return TimelineTile(
                        indicatorStyle: IndicatorStyle(
                            color: isSelected ? Colors.green : Colors.grey),
                        alignment: TimelineAlign.start,
                        lineXY: 0.1,
                        endChild: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                orderStatus.title,
                                style: AppStyle.mediumTextMedium(),
                              ),
                              const YMargin(3),
                              Text(
                                orderStatus.subTitle,
                                style: AppStyle.normalTextRegular(
                                    fontSize: 12, color: AppColors.greyScale5),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
