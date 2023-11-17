import 'package:flutter/material.dart';
import 'package:order_tracking/model/order.dart';
import 'package:order_tracking/model/order_status.dart';
import 'package:order_tracking/shared/widgets/app_spacing.dart';
import 'package:order_tracking/viewmodel/status_viewmodel.dart';
import 'package:provider/provider.dart';
// import 'package:timeline_tile/timeline_tile.dart';
import 'package:timelines/timelines.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Track Order ${Order.order.orderId}",
                style: AppStyle.mediumTextMedium(
                    color: AppColors.greyScale5, fontSize: 20),
              ),
              const YMargin(20),
              Consumer<StatusViewModel>(builder: (ctx, viewModel, _) {
                return FixedTimeline.tileBuilder(
                  theme: TimelineThemeData(
                    nodePosition: 0,
                    color: Colors.grey,
                  ),
                  builder: TimelineTileBuilder.connectedFromStyle(
                    contentsBuilder: (context, index) {
                      OrderStatusModel orderStatus =
                          OrderStatusModel.statusHistory[index];
                      bool isSelected = (viewModel.status.data?.index ?? 0) >=
                          orderStatus.orderStatus.index;
                      return Padding(
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
                      );
                    },
                    contentsAlign: ContentsAlign.basic,
                    connectorStyleBuilder: (context, index) {
                      return ConnectorStyle.dashedLine;
                    },
                    firstConnectorStyle: ConnectorStyle.dashedLine,
                    lastConnectorStyle: ConnectorStyle.dashedLine,
                    indicatorStyleBuilder: (context, index) =>
                        IndicatorStyle.outlined,
                    itemCount: OrderStatusModel.statusHistory.length,
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
