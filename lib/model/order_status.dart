enum Status { placed, accepted, picked, transit, arrived, delivered }

class OrderStatus {
  final Status orderStatus;
  final String title;
  final String subTitle;

  OrderStatus({
    required this.orderStatus,
    required this.title,
    required this.subTitle,
  });

  static List<OrderStatus> statusHistory = [
    OrderStatus(
        orderStatus: Status.placed,
        title: "Order Placed",
        subTitle: "Waiting for vendor to accept your order"),
    OrderStatus(
        orderStatus: Status.accepted,
        title: "Order Accepted",
        subTitle:
            "The vendor is preparing your order and a rider will pick up soon"),
    OrderStatus(
        orderStatus: Status.picked,
        title: "Order Pick up in progress",
        subTitle: "A rider is on the way to the vendor to pick up your order"),
    OrderStatus(
        orderStatus: Status.transit,
        title: "Order on the way to customer",
        subTitle: "A rider has picked up your order"),
    OrderStatus(
        orderStatus: Status.arrived,
        title: "Order arrived",
        subTitle: "Dont't keep the rider waiting"),
    OrderStatus(
        orderStatus: Status.delivered,
        title: "Order delivered",
        subTitle: "Enjoy!")
  ];
}
