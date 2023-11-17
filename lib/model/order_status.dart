enum OrderStatus { placed, accepted, picked, transit, arrived, delivered }

class OrderStatusModel {
  final OrderStatus orderStatus;
  final String title;
  final String subTitle;

  OrderStatusModel({
    required this.orderStatus,
    required this.title,
    required this.subTitle,
  });

  static List<OrderStatusModel> statusHistory = [
    OrderStatusModel(
        orderStatus: OrderStatus.placed,
        title: "Order Placed",
        subTitle: "Waiting for vendor to accept your order"),
    OrderStatusModel(
        orderStatus: OrderStatus.accepted,
        title: "Order Accepted",
        subTitle:
            "The vendor is preparing your order and a rider will pick up soon"),
    OrderStatusModel(
        orderStatus: OrderStatus.picked,
        title: "Order Pick up in progress",
        subTitle: "A rider is on the way to the vendor to pick up your order"),
    OrderStatusModel(
        orderStatus: OrderStatus.transit,
        title: "Order on the way to customer",
        subTitle: "A rider has picked up your order"),
    OrderStatusModel(
        orderStatus: OrderStatus.arrived,
        title: "Order arrived",
        subTitle: "Dont't keep the rider waiting"),
    OrderStatusModel(
        orderStatus: OrderStatus.delivered,
        title: "Order delivered",
        subTitle: "Enjoy!")
  ];
}
